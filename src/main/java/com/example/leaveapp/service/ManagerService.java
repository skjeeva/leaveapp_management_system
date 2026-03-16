package com.example.leaveapp.service;

import com.example.leaveapp.entity.*;
import com.example.leaveapp.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
public class ManagerService {

    @Autowired
    private EmployeeManagerRepository empManagerRepo;

    @Autowired
    private LeaveRequestRepository leaveRepo;

    @Autowired
    private LeaveBalanceRepository balanceRepo;

    public List<LeaveRequest> getTeamLeaveRequests(User manager){

        List<EmployeeManager> mappings = empManagerRepo.findByManager(manager);

        List<User> employees = mappings.stream().map(EmployeeManager::getEmployee).toList();

        return leaveRepo.findByEmployeeIn(employees);
    }

    public void approveLeave(Long leaveId, User manager){

        LeaveRequest request =
                leaveRepo.findById(leaveId).orElse(null);

        if(request == null){
            throw new RuntimeException("Leave request not found");
        }

        if(request.getEmployee().getUserId()
                .equals(manager.getUserId())){

            throw new RuntimeException(
                    "Managers cannot approve their own leave");
        }
        if(!"PENDING".equals(request.getStatus())){
            throw new RuntimeException(
                    "Leave request already processed");
        }

        EmployeeManager mapping =
                empManagerRepo.findByEmployeeAndManager(
                        request.getEmployee(),
                        manager);

        if(mapping == null){
            throw new RuntimeException(
                    "You are not allowed to approve this employee's leave");
        }

        LeaveBalance balance =balanceRepo.findByEmployeeAndLeaveType(request.getEmployee(),request.getLeaveType());

        if(balance == null){
            throw new RuntimeException(
                    "Leave balance not initialized");
        }

        long days = ChronoUnit.DAYS.between(request.getStartDate(),request.getEndDate()) + 1;

        balance.setUsedDays(balance.getUsedDays() + (int)days);
        balance.setRemainingDays(balance.getRemainingDays() - (int)days);

        balanceRepo.save(balance);

        request.setStatus("APPROVED");

        leaveRepo.save(request);
    }

    public void rejectLeave(Long leaveId, String comment, User manager){

        LeaveRequest request =
                leaveRepo.findById(leaveId).orElse(null);

        if(request == null){
            throw new RuntimeException("Leave request not found");
        }

        if(!"PENDING".equals(request.getStatus())){
            throw new RuntimeException(
                    "Leave request already processed");
        }

        request.setStatus("REJECTED");
        request.setManagerComment(comment);

        leaveRepo.save(request);
    }
}