package com.example.leaveapp.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.leaveapp.entity.LeaveBalance;
import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.User;
import com.example.leaveapp.repository.LeaveBalanceRepository;
import com.example.leaveapp.repository.LeaveRequestRepository;

@Service
public class LeaveService {

    @Autowired
    private LeaveRequestRepository leaveRepo;

    @Autowired
    private LeaveBalanceRepository balanceRepo;

    public void applyLeave(LeaveRequest request){

        User employee = request.getEmployee();

        if(employee == null){
            throw new RuntimeException("Invalid employee");
        }

        if(request.getLeaveType() == null){
            throw new RuntimeException("Leave type must be selected");
        }

        LocalDate start = request.getStartDate();
        LocalDate end = request.getEndDate();

        // Rule 1: start date cannot be past
        if(start.isBefore(LocalDate.now())){
            throw new RuntimeException("Leave cannot start in the past");
        }

        // Rule 2: end date must be >= start date
        if(end.isBefore(start)){
            throw new RuntimeException("End date must be after start date");
        }

        // calculate leave days
        long days =
                ChronoUnit.DAYS.between(start, end) + 1;

        // Rule 3: overlapping validation
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

        // Rule 4: check leave balance
        LeaveBalance balance =
                balanceRepo.findByEmployeeAndLeaveType(
                        employee,
                        request.getLeaveType());

        if(balance == null){
            throw new RuntimeException(
                    "Leave balance not initialized. Please contact admin.");
        }

        if(balance.getRemainingDays() < days){
            throw new RuntimeException(
                    "Leave exceeds available balance");
        }

        // save leave request
        request.setStatus("PENDING");
        request.setAppliedDate(LocalDate.now());

        leaveRepo.save(request);
    }
}