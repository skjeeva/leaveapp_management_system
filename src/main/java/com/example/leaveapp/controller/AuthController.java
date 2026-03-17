package com.example.leaveapp.controller;

import com.example.leaveapp.entity.User;
import com.example.leaveapp.service.AuthService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private AuthService authService;

    @GetMapping("/leaveapp")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(String email, String password, HttpSession session) {

        User user = authService.login(email, password);

        if (user == null) {
            return "login";
        }

        session.setAttribute("user", user);
        session.setAttribute("role", user.getRole().getRoleName());

        String role = user.getRole().getRoleName();

        if ("ADMIN".equals(role)) {
            return "redirect:/admin/dashboard";
        }

        if ("MANAGER".equals(role)) {
            return "redirect:/manager/dashboard";
        }

        return "redirect:/employee/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/login";
    }
}