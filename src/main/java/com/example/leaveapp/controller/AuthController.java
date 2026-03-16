package com.example.leaveapp.controller;

import com.example.leaveapp.entity.User;
import com.example.leaveapp.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller

public class AuthController {

    @Autowired
    private UserRepository userRepo;

    @GetMapping("/leaveapp")
    public String home(){
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @PostMapping("/login")
    public String login(String email, String password, HttpSession session){

        User user = userRepo.findByEmail(email);

        if(user == null || !user.getPassword().equals(password)){
            return "login";
        }

        session.setAttribute("user", user);

        String role = user.getRole().getRoleName();

        if(role.equals("ADMIN")){
            return "redirect:/admin/dashboard";
        }

        if(role.equals("MANAGER")){
            return "redirect:/manager/dashboard";
        }

        return "redirect:/employee/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }
}