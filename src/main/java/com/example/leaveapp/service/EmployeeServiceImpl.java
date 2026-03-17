package com.example.leaveapp.service;

import com.example.leaveapp.entity.LeaveBalance;
import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.LeaveType;
import com.example.leaveapp.entity.User;
import com.example.leaveapp.repository.LeaveBalanceRepository;
import com.example.leaveapp.repository.LeaveRequestRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private LeaveRequestRepository leaveRepo;

    @Autowired
    private LeaveBalanceRepository balanceRepo;

    @Autowired
    private LeaveService leaveService;

    @Override
    public List<LeaveRequest> getLeaveRequests(User user) {

        return leaveRepo.findByEmployee(user);
    }

    @Override
    public List<LeaveBalance> getLeaveBalances(User user) {

        return balanceRepo.findByEmployee(user);
    }

    @Override
    public List<LeaveType> getLeaveTypes(User user) {

        List<LeaveBalance> balances = balanceRepo.findByEmployee(user);

        return balances.stream()
                .map(LeaveBalance::getLeaveType)
                .toList();
    }

    @Override
    public void applyLeave(LeaveRequest request, User user) {

        request.setEmployee(user);

        leaveService.applyLeave(request);
    }

    @Override
    public void cancelLeave(Long leaveId, User user) {

        LeaveRequest request =
                leaveRepo.findById(leaveId).orElse(null);

        if (request != null &&  request.getEmployee().getUserId().equals(user.getUserId()) && 
            request.getStatus().equals("PENDING")) {

            request.setStatus("CANCELLED");

            leaveRepo.save(request);
        }
    }
}