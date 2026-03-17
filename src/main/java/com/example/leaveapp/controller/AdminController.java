package com.example.leaveapp.controller;

import com.example.leaveapp.entity.*;
import com.example.leaveapp.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/dashboard")
    public String dashboard() {
        return "admin-dashboard";
    }

    @GetMapping("/employees")
    public String employees(Model model) {

        model.addAttribute("employees", adminService.getEmployees());
        model.addAttribute("roles", adminService.getRoles());

        return "manageEmployees";
    }

    @PostMapping("/addEmployee")
    public String addEmployee(User user,Long roleId,RedirectAttributes redirectAttributes){

        try{

            adminService.addEmployee(user, roleId);

            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Employee added successfully");

        }catch(RuntimeException ex){

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    ex.getMessage());
        }

        return "redirect:/admin/employees";
    }

    @GetMapping("/editEmployee")
    public String editEmployee(Long id, Model model){

        User user = adminService.getEmployeeById(id);

        model.addAttribute("user", user);
        model.addAttribute("roles", adminService.getRoles());

        return "editEmployee";
    }

    @PostMapping("/updateEmployee")
    public String updateEmployee(User user,
                                Long roleId,
                                RedirectAttributes redirectAttributes){

        try{

            adminService.updateEmployee(user, roleId);

            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Employee updated successfully");

            redirectAttributes.addFlashAttribute(
                    "successUserId",
                    user.getUserId());

        }catch(RuntimeException ex){

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    ex.getMessage());

            redirectAttributes.addFlashAttribute(
                    "errorUserId",
                    user.getUserId());
        }

        return "redirect:/admin/employees";
    }

    @GetMapping("/deleteEmployee")
    public String deleteEmployee(Long id,
                                 RedirectAttributes redirectAttributes) {

        try{

            adminService.deleteEmployee(id);

            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Employee deleted successfully");

        }catch(RuntimeException ex){

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    ex.getMessage());
        }

        return "redirect:/admin/employees";
    }

    @GetMapping("/assign-manager")
    public String assignManager(Model model) {

        model.addAttribute("employees",
                adminService.getEmployeesForManagerAssignment());

        model.addAttribute("managers",
                adminService.getManagers());

        return "assignManager";
    }

    @PostMapping("/assignManager")
    public String saveAssignment(Long employeeId, Long managerId) {

        adminService.assignManager(employeeId, managerId);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/manager-leaves")
    public String managerLeaves(Model model) {

        model.addAttribute("requests",
                adminService.getManagerLeaveRequests());

        return "admin-manager-leaves";
    }

    @PostMapping("/approveManagerLeave")
    public String approveManagerLeave(Long leaveId) {

        adminService.approveManagerLeave(leaveId);

        return "redirect:/admin/manager-leaves";
    }

    @PostMapping("/rejectManagerLeave")
    public String rejectManagerLeave(Long leaveId, String comment) {

        adminService.rejectManagerLeave(leaveId, comment);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/leave-types")
    public String leaveTypes(Model model) {

        model.addAttribute("leaveTypes",
                adminService.getLeaveTypes());

        return "leaveTypes";
    }

    @PostMapping("/addLeaveType")
    public String addLeaveType(LeaveType type) {

        adminService.addLeaveType(type);

        return "redirect:/admin/leave-types";
    }

    @GetMapping("/leave-balance")
    public String leaveBalance(Model model) {

        model.addAttribute("balances",
                adminService.getLeaveBalances());

        return "leaveBalance";
    }

    @GetMapping("/initialize-balance")
    public String initializeBalancePage(Model model) {

        model.addAttribute("employees",
                adminService.getEmployeesForBalanceInitialization());

        model.addAttribute("leaveTypes",
                adminService.getAllLeaveTypes());

        return "initializeLeaveBalance";
    }

    @PostMapping("/initializeLeaveBalance")
    public String initializeBalance(Long employeeId, int year) {

        adminService.initializeLeaveBalance(employeeId, year);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/leave-requests")
    public String leaveRequests(Model model) {

        model.addAttribute("requests",
                adminService.getAllLeaveRequests());

        return "leaveRequests";
    }
}