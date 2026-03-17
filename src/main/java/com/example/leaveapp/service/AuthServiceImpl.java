package com.example.leaveapp.service;

import com.example.leaveapp.entity.User;
import com.example.leaveapp.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UserRepository userRepo;

    @Override
    public User login(String email, String password){

        User user = userRepo.findByEmailAndDeletedFalse(email);

        if(user == null){
            throw new RuntimeException("Invalid email or user deleted");
        }

        if(!user.getPassword().equals(password)){
            throw new RuntimeException("Invalid password");
        }

        return user;
    }
}