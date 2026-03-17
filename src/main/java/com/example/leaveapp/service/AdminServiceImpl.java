package com.example.leaveapp.service;

import com.example.leaveapp.entity.*;
import com.example.leaveapp.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private LeaveTypeRepository leaveTypeRepo;

    @Autowired
    private LeaveBalanceRepository leaveBalanceRepo;

    @Autowired
    private LeaveRequestRepository leaveRequestRepo;

    @Autowired
    private RoleRepository roleRepo;

    @Autowired
    private EmployeeManagerRepository empManagerRepo;


    @Override
    public List<User> getEmployees() {
        return userRepo.findByDeletedFalseAndRole_RoleNameNot("ADMIN");
    }

    @Override
    public List<Role> getRoles() {
        return roleRepo.findAll();
    }

    @Override
    public void addEmployee(User user, Long roleId) {

        if (userRepo.findByEmail(user.getEmail()) != null) {
            throw new RuntimeException("Email already exists");
        }

        Role role = roleRepo.findById(roleId)
                .orElseThrow(() -> new RuntimeException("Role not found"));

        user.setRole(role);
        user.setDeleted(false);
        user.setCreatedAt(new Date());

        userRepo.save(user);
    }

    @Override
    public void updateEmployee(User user, Long roleId) {

        User existing = userRepo.findById(user.getUserId())
                .orElseThrow(() -> new RuntimeException("Employee not found"));

        User emailCheck = userRepo.findByEmail(user.getEmail());

        if (emailCheck != null &&
            !emailCheck.getUserId().equals(user.getUserId())) {

            throw new RuntimeException("Email already exists");
        }

        Role role = roleRepo.findById(roleId)
                .orElseThrow(() -> new RuntimeException("Role not found"));

        existing.setName(user.getName());
        existing.setEmail(user.getEmail());
        existing.setRole(role);

        userRepo.save(existing);
    }

    @Transactional
    @Override
    public void deleteEmployee(Long id) {

        User user = userRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found"));

        user.setDeleted(true);

        userRepo.save(user);
    }


    @Override
    public List<User> getEmployeesForManagerAssignment() {

        Role empRole = roleRepo.findByRoleName("EMPLOYEE");

        return userRepo.findByDeletedFalseAndRole(empRole);
    }

    @Override
    public List<User> getManagers() {

        Role managerRole = roleRepo.findByRoleName("MANAGER");

        return userRepo.findByDeletedFalseAndRole(managerRole);
    }

    @Override
    public void assignManager(Long employeeId, Long managerId) {

        User employee = userRepo.findById(employeeId)
                .orElseThrow(() -> new RuntimeException("Employee not found"));

        User manager = userRepo.findById(managerId)
                .orElseThrow(() -> new RuntimeException("Manager not found"));

        if(employee.getUserId().equals(manager.getUserId())){
            throw new RuntimeException("Employee cannot be their own manager");
        }

        EmployeeManager existing = empManagerRepo.findByEmployee(employee);

        if(existing != null){
            throw new RuntimeException("Manager already assigned to this employee");
        }

        EmployeeManager mapping = new EmployeeManager();
        mapping.setEmployee(employee);
        mapping.setManager(manager);

        empManagerRepo.save(mapping);
    }


    @Override
    public List<LeaveRequest> getManagerLeaveRequests() {
        return leaveRequestRepo.findByEmployee_Role_RoleNameAndEmployee_DeletedFalse("MANAGER");
    }

    @Override
    public void approveManagerLeave(Long leaveId) {

        LeaveRequest req = leaveRequestRepo.findById(leaveId)
                .orElseThrow(() -> new RuntimeException("Leave request not found"));

        LeaveBalance balance = leaveBalanceRepo.findByEmployeeAndLeaveType(
                req.getEmployee(),
                req.getLeaveType());

        long days = ChronoUnit.DAYS.between(
                req.getStartDate(),
                req.getEndDate()) + 1;

        balance.setUsedDays(balance.getUsedDays() + (int) days);
        balance.setRemainingDays(balance.getRemainingDays() - (int) days);

        leaveBalanceRepo.save(balance);

        req.setStatus("APPROVED");
        leaveRequestRepo.save(req);
    }

    @Override
    public void rejectManagerLeave(Long leaveId, String comment) {

        LeaveRequest req = leaveRequestRepo.findById(leaveId)
                .orElseThrow(() -> new RuntimeException("Leave request not found"));

        req.setStatus("REJECTED");
        req.setManagerComment(comment);

        leaveRequestRepo.save(req);
    }


    @Override
    public List<LeaveType> getLeaveTypes() {
        return leaveTypeRepo.findAll();
    }

    @Override
    public void addLeaveType(LeaveType type) {
        leaveTypeRepo.save(type);
    }


    @Override
    public List<LeaveBalance> getLeaveBalances() {
        return leaveBalanceRepo.findByEmployee_DeletedFalse();
    }

    @Override
    public List<User> getEmployeesForBalanceInitialization() {

        Role employeeRole = roleRepo.findByRoleName("EMPLOYEE");
        Role managerRole = roleRepo.findByRoleName("MANAGER");

        List<User> employees = userRepo.findByDeletedFalseAndRole(employeeRole);

        employees.addAll(
                userRepo.findByDeletedFalseAndRole(managerRole)
        );

        return employees;
    }

    @Override
    public List<LeaveType> getAllLeaveTypes() {
        return leaveTypeRepo.findAll();
    }

    @Override
    public void initializeLeaveBalance(Long employeeId, int year){

        User employee = userRepo.findById(employeeId)
                .orElseThrow(() -> new RuntimeException("Employee not found"));

        List<LeaveType> leaveTypes = leaveTypeRepo.findAll();

        for(LeaveType type : leaveTypes){

            LeaveBalance existing =
                    leaveBalanceRepo.findByEmployeeAndLeaveTypeAndYear(
                            employee, type, year);

            if(existing != null){
                throw new RuntimeException(
                        "Leave balance already initialized for this employee"
                );
            }
        }

        for(LeaveType type : leaveTypes){

            LeaveBalance balance = new LeaveBalance();

            balance.setEmployee(employee);
            balance.setLeaveType(type);
            balance.setYear(year);
            balance.setTotalDays(type.getMaxDaysPerYear());
            balance.setRemainingDays(type.getMaxDaysPerYear());
            balance.setUsedDays(0);

            leaveBalanceRepo.save(balance);
        }
    }

    @Override
    public List<LeaveRequest> getAllLeaveRequests() {
        return leaveRequestRepo.findByEmployee_DeletedFalse();
    }

    @Override
    public User getEmployeeById(Long id) {
        return userRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found"));
    }
}