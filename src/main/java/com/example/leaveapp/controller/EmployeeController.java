package com.example.leaveapp.controller;

import com.example.leaveapp.entity.LeaveBalance;
import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.LeaveType;
import com.example.leaveapp.entity.User;
import com.example.leaveapp.repository.LeaveRequestRepository;
import com.example.leaveapp.repository.LeaveBalanceRepository;
import com.example.leaveapp.service.LeaveService;

import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private LeaveRequestRepository leaveRepo;

    @Autowired
    private LeaveBalanceRepository balanceRepo;

    @Autowired
    private LeaveService leaveService;


    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model){

        User user = (User) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        model.addAttribute("leaveRequests",
                leaveRepo.findByEmployee(user));

        model.addAttribute("balances",
                balanceRepo.findByEmployee(user));

        List<LeaveBalance> balances =
        balanceRepo.findByEmployee(user);

        List<LeaveType> leaveTypes =
                balances.stream()
                        .map(LeaveBalance::getLeaveType)
                        .toList();

        model.addAttribute("leaveTypes", leaveTypes);

        return "employee-dashboard";
    }

    @PostMapping("/applyLeave")
    public String applyLeave(LeaveRequest request, HttpSession session){

        User user = (User) session.getAttribute("user");

        request.setEmployee(user);

        leaveService.applyLeave(request);

        return "redirect:/employee/dashboard";
    }

    @PostMapping("/cancelLeave")
    public String cancelLeave(Long leaveId, HttpSession session){

        User user = (User) session.getAttribute("user");

        LeaveRequest request =
                leaveRepo.findById(leaveId).orElse(null);

        if(request != null &&
        request.getEmployee().getUserId().equals(user.getUserId()) &&
        request.getStatus().equals("PENDING")){

            request.setStatus("CANCELLED");

            leaveRepo.save(request);
        }

        return "redirect:/employee/dashboard";
    }

}