package com.example.leaveapp.service;

import java.util.List;

import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.LeaveType;
import com.example.leaveapp.entity.User;

public interface ManagerService {

    List<LeaveRequest> getTeamLeaveRequests(User manager);

    List<LeaveRequest> getManagerLeaves(User manager);

    void approveLeave(Long leaveId, User manager);

    void rejectLeave(Long leaveId, String comment, User manager);

    List<LeaveType> getLeaveTypes(User manager);

    void applyLeave(LeaveRequest request, User manager);
}