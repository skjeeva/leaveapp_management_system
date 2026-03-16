package com.example.leaveapp.controller;

import com.example.leaveapp.entity.*;
import com.example.leaveapp.repository.*;

import jakarta.transaction.Transactional;

import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

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

    @GetMapping("/dashboard")
    public String dashboard(){
        return "admin-dashboard";
    }

    @GetMapping("/employees")
    public String employees(Model model){

        model.addAttribute("employees",userRepo.findByRole_RoleNameNot("ADMIN"));

        model.addAttribute("roles",
                roleRepo.findAll());

        return "manageEmployees";
    }

    @PostMapping("/addEmployee")
    public String addEmployee(User user, Long roleId){

        Role role = roleRepo.findById(roleId).orElse(null);

        user.setRole(role);

        userRepo.save(user);

        return "redirect:/admin/employees";
    }

    @Transactional
    @GetMapping("/deleteEmployee")
    public String deleteEmployee(Long id){

        User user = userRepo.findById(id).orElse(null);

        if(user != null){
            leaveRequestRepo.deleteByEmployee(user);
            leaveBalanceRepo.deleteByEmployee(user);
            empManagerRepo.deleteByEmployee(user);
            userRepo.delete(user);
        }

        return "redirect:/admin/employees";
    }

    @GetMapping("/assign-manager")
    public String assignManager(Model model){

        Role empRole = roleRepo.findByRoleName("EMPLOYEE");
        Role managerRole = roleRepo.findByRoleName("MANAGER");

        model.addAttribute("employees", userRepo.findByRole(empRole));
        model.addAttribute("managers", userRepo.findByRole(managerRole));

        return "assignManager";
    }

    @PostMapping("/assignManager")
    public String saveAssignment(Long employeeId, Long managerId){

        User employee = userRepo.findById(employeeId).orElse(null);
        User manager = userRepo.findById(managerId).orElse(null);

        EmployeeManager mapping = new EmployeeManager();

        mapping.setEmployee(employee);
        mapping.setManager(manager);

        empManagerRepo.save(mapping);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/manager-leaves")
    public String managerLeaves(Model model){

        List<LeaveRequest> requests =  leaveRequestRepo.findByEmployee_Role_RoleName("MANAGER");

        model.addAttribute("requests", requests);

        return "admin-manager-leaves";
    }

    @PostMapping("/approveManagerLeave")
    public String approveManagerLeave(Long leaveId){

        LeaveRequest req =
                leaveRequestRepo.findById(leaveId).orElse(null);

        if(req != null){

            LeaveBalance balance =
                    leaveBalanceRepo.findByEmployeeAndLeaveType(
                            req.getEmployee(),
                            req.getLeaveType());

            long days =
                    ChronoUnit.DAYS.between(
                            req.getStartDate(),
                            req.getEndDate()) + 1;

            balance.setUsedDays(balance.getUsedDays() + (int)days);
            balance.setRemainingDays(balance.getRemainingDays() - (int)days);

            leaveBalanceRepo.save(balance);

            req.setStatus("APPROVED");

            leaveRequestRepo.save(req);
        }

        return "redirect:/admin/manager-leaves";
    }

    @PostMapping("/rejectManagerLeave")
    public String rejectManagerLeave(Long leaveId, String comment){

        LeaveRequest req =
                leaveRequestRepo.findById(leaveId).orElse(null);

        if(req != null){
            req.setStatus("REJECTED");
            req.setManagerComment(comment);
            leaveRequestRepo.save(req);
        }

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/leave-types")
    public String leaveTypes(Model model){
        model.addAttribute("leaveTypes", leaveTypeRepo.findAll());
        return "leaveTypes";
    }

    @PostMapping("/addLeaveType")
    public String addLeaveType(LeaveType type){
        leaveTypeRepo.save(type);
        return "redirect:/admin/leave-types";
    }

    @GetMapping("/leave-balance")
    public String leaveBalance(Model model){
        model.addAttribute("balances", leaveBalanceRepo.findAll());
        return "leaveBalance";
    }

    @GetMapping("/initialize-balance")
    public String initializeBalancePage(Model model){

        Role employeeRole = roleRepo.findByRoleName("EMPLOYEE");
        Role managerRole = roleRepo.findByRoleName("MANAGER");

        List<User> employees = userRepo.findByRole(employeeRole);
        List<User> managers = userRepo.findByRole(managerRole);

        employees.addAll(managers);

        model.addAttribute("employees", employees);

        model.addAttribute("leaveTypes",
                leaveTypeRepo.findAll());
        
        

        return "initializeLeaveBalance";
    }

    @PostMapping("/initializeLeaveBalance")
    public String initializeBalance(Long employeeId,Long leaveTypeId,int totalDays,int year){

        User employee = userRepo.findById(employeeId).orElse(null);
        LeaveType type = leaveTypeRepo.findById(leaveTypeId).orElse(null);

        if(employee.getRole().getRoleName().equals("ADMIN")){
            throw new RuntimeException("Admin cannot have leave balance");
        }

        LeaveBalance existing =
                leaveBalanceRepo.findByEmployeeAndLeaveType(employee, type);

        if(existing != null){
            throw new RuntimeException(
                "Leave balance already initialized for this employee and leave type");
        }

        LeaveBalance balance = new LeaveBalance();

        balance.setEmployee(employee);
        balance.setLeaveType(type);
        balance.setYear(year);
        balance.setTotalDays(totalDays);
        balance.setRemainingDays(totalDays);
        balance.setUsedDays(0);

        leaveBalanceRepo.save(balance);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/leave-requests")
    public String leaveRequests(Model model){
        model.addAttribute("requests", leaveRequestRepo.findAll());
        return "leaveRequests";
    }


}