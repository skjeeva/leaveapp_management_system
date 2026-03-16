package com.example.leaveapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

import com.example.leaveapp.entity.LeaveRequest;
import com.example.leaveapp.entity.User;

public interface LeaveRequestRepository extends JpaRepository<LeaveRequest, Long> {

    List<LeaveRequest> findByEmployee(User employee);

    List<LeaveRequest> findByEmployeeIn(List<User> employees);

    List<LeaveRequest> findByEmployeeInAndStatus(List<User> employees, String status);

    List<LeaveRequest> findByEmployee_Role_RoleName(String roleName);

    void deleteByEmployee(User employee);
}