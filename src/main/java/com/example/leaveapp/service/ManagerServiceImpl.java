package com.example.leaveapp.service;

import com.example.leaveapp.entity.*;
import com.example.leaveapp.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private LeaveRequestRepository leaveRepo;

    @Autowired
    private LeaveBalanceRepository balanceRepo;

    @Autowired
    private EmployeeManagerRepository empManagerRepo;

    @Autowired
    private LeaveService leaveService;

    @Override
    public List<LeaveRequest> getTeamLeaveRequests(User manager) {

        return empManagerRepo.findByManager(manager)
                .stream()
                .filter(mapping -> !mapping.getEmployee().isDeleted()) 
                .flatMap(mapping -> leaveRepo.findByEmployee(mapping.getEmployee()).stream())
                .toList();
    }

    @Override
    public List<LeaveRequest> getManagerLeaves(User manager) {
        return leaveRepo.findByEmployee(manager);
    }

    @Override
    public void approveLeave(Long leaveId, User manager) {

        LeaveRequest request = leaveRepo.findById(leaveId)
                .orElseThrow(() -> new RuntimeException("Leave request not found"));

        EmployeeManager mapping =
                empManagerRepo.findByEmployee(request.getEmployee());

        if (mapping == null ||
            !mapping.getManager().getUserId().equals(manager.getUserId())) {
            throw new RuntimeException("You are not authorized to approve this leave");
        }

        if (request.getStatus() != null && !"PENDING".equals(request.getStatus())) {
            throw new RuntimeException("Leave already processed");
        }

        LeaveBalance balance =
                balanceRepo.findByEmployeeAndLeaveType(
                        request.getEmployee(),
                        request.getLeaveType());

        long days =
                ChronoUnit.DAYS.between(
                        request.getStartDate(),
                        request.getEndDate()) + 1;

        if (balance.getRemainingDays() < days) {
            throw new RuntimeException("Not enough leave balance");
        }

        balance.setUsedDays(balance.getUsedDays() + (int) days);
        balance.setRemainingDays(balance.getRemainingDays() - (int) days);

        balanceRepo.save(balance);

        request.setStatus("APPROVED");

        leaveRepo.save(request);
    }

    @Override
    public void rejectLeave(Long leaveId, String comment, User manager) {

        LeaveRequest request = leaveRepo.findById(leaveId)
                .orElseThrow(() -> new RuntimeException("Leave request not found"));

        EmployeeManager mapping =
                empManagerRepo.findByEmployee(request.getEmployee());

        if (mapping == null ||
            !mapping.getManager().getUserId().equals(manager.getUserId())) {
            throw new RuntimeException("You are not authorized to reject this leave");
        }

        if (!"PENDING".equals(request.getStatus())) {
            throw new RuntimeException("Leave already processed");
        }

        request.setStatus("REJECTED");
        request.setManagerComment(comment);

        leaveRepo.save(request);
    }

    @Override
    public List<LeaveType> getLeaveTypes(User manager) {

        List<LeaveBalance> balances =
                balanceRepo.findByEmployee(manager);

        return balances.stream()
                .map(LeaveBalance::getLeaveType)
                .toList();
    }

    @Override
    public void applyLeave(LeaveRequest request, User manager) {

        request.setEmployee(manager);

        leaveService.applyLeave(request);
    }
}