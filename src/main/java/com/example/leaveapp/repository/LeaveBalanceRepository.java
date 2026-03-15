package com.example.leaveapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

import com.example.leaveapp.entity.LeaveBalance;
import com.example.leaveapp.entity.LeaveType;
import com.example.leaveapp.entity.User;

public interface LeaveBalanceRepository extends JpaRepository<LeaveBalance, Long> {

    List<LeaveBalance> findByEmployee(User employee);

    LeaveBalance findByEmployeeAndLeaveType(User employee, LeaveType leaveType);

}