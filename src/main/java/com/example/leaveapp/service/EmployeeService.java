package com.example.leaveapp.service;

import java.util.List;

import com.example.leaveapp.entity.LeaveBalance;
import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.LeaveType;
import com.example.leaveapp.entity.User;

public interface EmployeeService {

    List<LeaveRequest> getLeaveRequests(User user);

    List<LeaveBalance> getLeaveBalances(User user);

    List<LeaveType> getLeaveTypes(User user);

    void applyLeave(LeaveRequest request, User user);

    void cancelLeave(Long leaveId, User user);
}