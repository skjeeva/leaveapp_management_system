package com.example.leaveapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

import com.example.leaveapp.entity.EmployeeManager;
import com.example.leaveapp.entity.User;

public interface EmployeeManagerRepository extends JpaRepository<EmployeeManager, Long> {

    List<EmployeeManager> findByManager(User manager);

    EmployeeManager findByEmployeeAndManager(User employee, User manager);

}