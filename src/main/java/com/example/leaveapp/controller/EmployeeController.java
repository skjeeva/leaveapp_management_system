package com.example.leaveapp.controller;

import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.User;
import com.example.leaveapp.service.EmployeeService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("leaveRequests",
                employeeService.getLeaveRequests(user));

        model.addAttribute("balances",
                employeeService.getLeaveBalances(user));

        model.addAttribute("leaveTypes",
                employeeService.getLeaveTypes(user));

        return "employee-dashboard";
    }

    @PostMapping("/applyLeave")
    public String applyLeave(LeaveRequest request, HttpSession session) {

        User user = (User) session.getAttribute("user");

        employeeService.applyLeave(request, user);

        return "redirect:/employee/dashboard";
    }

    @PostMapping("/cancelLeave")
    public String cancelLeave(Long leaveId, HttpSession session) {

        User user = (User) session.getAttribute("user");

        employeeService.cancelLeave(leaveId, user);

        return "redirect:/employee/dashboard";
    }
}