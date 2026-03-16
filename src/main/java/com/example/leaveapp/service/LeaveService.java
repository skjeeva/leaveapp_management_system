package com.example.leaveapp.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.leaveapp.entity.EmployeeManager;
import com.example.leaveapp.entity.LeaveBalance;
import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.User;
import com.example.leaveapp.repository.EmployeeManagerRepository;
import com.example.leaveapp.repository.LeaveBalanceRepository;
import com.example.leaveapp.repository.LeaveRequestRepository;

@Service
public class LeaveService {

    @Autowired
    private LeaveRequestRepository leaveRepo;

    @Autowired
    private LeaveBalanceRepository balanceRepo;

    @Autowired
    private EmployeeManagerRepository empManagerRepo;

    public void applyLeave(LeaveRequest request){

        User employee = request.getEmployee();

        if(employee == null){
            throw new RuntimeException("Invalid employee");
        }

        // Only employees must have managers
        if("EMPLOYEE".equals(employee.getRole().getRoleName())){

            EmployeeManager mapping =
                    empManagerRepo.findByEmployee(employee);

            if(mapping == null){
                throw new RuntimeException(
                    "Manager not assigned. Please contact admin.");
            }
        }

        if(request.getLeaveType() == null){
            throw new RuntimeException("Leave type must be selected");
        }

        LocalDate start = request.getStartDate();
        LocalDate end = request.getEndDate();

        if(start.isBefore(LocalDate.now())){
            throw new RuntimeException("Leave cannot start in the past");
        }

        if(end.isBefore(start)){
            throw new RuntimeException("End date must be after start date");
        }

        long days =  ChronoUnit.DAYS.between(start, end) + 1;

        List<LeaveRequest> existingLeaves =
                leaveRepo.findByEmployee(employee);

        for(LeaveRequest leave : existingLeaves){

            if("PENDING".equals(leave.getStatus()) ||
               "APPROVED".equals(leave.getStatus())){

                boolean overlap =
                        !(end.isBefore(leave.getStartDate()) ||
                          start.isAfter(leave.getEndDate()));

                if(overlap){

                    throw new RuntimeException(
                            "Leave request conflicts with existing approved leave from "
                            + leave.getStartDate() +
                            " to " +
                            leave.getEndDate());
                }
            }
        }

        LeaveBalance balance = balanceRepo.findByEmployeeAndLeaveType(employee,request.getLeaveType());

        if(balance == null){
            throw new RuntimeException(
                    "Leave balance not initialized. Please contact admin.");
        }

        if(balance.getRemainingDays() < days){
            throw new RuntimeException(
                    "Leave exceeds available balance");
        }

        request.setStatus("PENDING");
        request.setAppliedDate(LocalDate.now());

        leaveRepo.save(request);
    }
}