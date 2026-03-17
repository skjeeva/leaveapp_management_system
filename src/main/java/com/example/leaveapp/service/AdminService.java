package com.example.leaveapp.service;

import java.util.List;

import com.example.leaveapp.entity.*;

public interface AdminService {

    List<User> getEmployees();

    List<Role> getRoles();

    void addEmployee(User user, Long roleId);

    void deleteEmployee(Long id);

    List<User> getEmployeesForManagerAssignment();

    List<User> getManagers();

    void assignManager(Long employeeId, Long managerId);

    List<LeaveRequest> getManagerLeaveRequests();

    void approveManagerLeave(Long leaveId);

    void rejectManagerLeave(Long leaveId, String comment);

    List<LeaveType> getLeaveTypes();

    void addLeaveType(LeaveType type);

    List<LeaveBalance> getLeaveBalances();

    List<User> getEmployeesForBalanceInitialization();

    List<LeaveType> getAllLeaveTypes();


    List<LeaveRequest> getAllLeaveRequests();

    void initializeLeaveBalance(Long employeeId, int year);

	void updateEmployee(User user, Long roleId);

    User getEmployeeById(Long id);
}