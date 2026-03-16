package com.example.leaveapp.controller;

import com.example.leaveapp.entity.LeaveBalance;
import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.LeaveType;
import com.example.leaveapp.entity.User;
import com.example.leaveapp.repository.LeaveBalanceRepository;
import com.example.leaveapp.repository.LeaveRequestRepository;
import com.example.leaveapp.service.LeaveService;
import com.example.leaveapp.service.ManagerService;

import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @Autowired
    private LeaveBalanceRepository balanceRepo;

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private LeaveRequestRepository leaveRepo;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model){

        User manager = (User) session.getAttribute("user");

        if(manager == null){
            return "redirect:/login";
        }

        model.addAttribute("leaveRequests", managerService.getTeamLeaveRequests(manager));

        model.addAttribute("myLeaves", leaveRepo.findByEmployee(manager));

        return "manager-dashboard";
    }

    @PostMapping("/approveLeave")
    public String approveLeave(@RequestParam Long leaveId,
                            HttpSession session,
                            RedirectAttributes redirectAttributes){

        User manager = (User) session.getAttribute("user");

        try{
            managerService.approveLeave(leaveId, manager);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Leave approved successfully");

        }catch(RuntimeException ex){
            redirectAttributes.addFlashAttribute("errorMessage",
                    ex.getMessage());
        }

        return "redirect:/manager/dashboard";
    }

    @PostMapping("/rejectLeave")
    public String rejectLeave(@RequestParam Long leaveId,
                            @RequestParam String comment,
                            HttpSession session,
                            RedirectAttributes redirectAttributes){

        User manager = (User) session.getAttribute("user");

        try{
            managerService.rejectLeave(leaveId, comment, manager);
            redirectAttributes.addFlashAttribute("successMessage",
                    "Leave rejected");

        }catch(RuntimeException ex){
            redirectAttributes.addFlashAttribute("errorMessage",
                    ex.getMessage());
        }

        return "redirect:/manager/dashboard";
    }

    @GetMapping("/apply-leave")
    public String applyLeavePage(HttpSession session, Model model){

        User manager = (User) session.getAttribute("user");

        if(manager == null){
            return "redirect:/login";
        }

        List<LeaveBalance> balances =
                balanceRepo.findByEmployee(manager);

        List<LeaveType> leaveTypes =
                balances.stream()
                        .map(LeaveBalance::getLeaveType)
                        .toList();

        model.addAttribute("leaveTypes", leaveTypes);

        return "manager-apply-leave";
    }

    @PostMapping("/applyLeave")
    public String applyLeave(LeaveRequest request, HttpSession session){

        User manager = (User) session.getAttribute("user");

        request.setEmployee(manager);

        leaveService.applyLeave(request);

        return "redirect:/manager/dashboard";
    }
}