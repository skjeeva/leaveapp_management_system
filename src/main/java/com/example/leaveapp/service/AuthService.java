package com.example.leaveapp.service;

import com.example.leaveapp.entity.User;

public interface AuthService {

    User login(String email, String password);

}