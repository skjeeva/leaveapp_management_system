package com.example.leaveapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.leaveapp.entity.Role;
import com.example.leaveapp.entity.User;
import java.util.List;


public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

    List<User> findByRole(Role role);

    List<User> findByRole_RoleNameNot(String roleName);

}