package com.example.leaveapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.leaveapp.entity.LeaveType;

public interface LeaveTypeRepository extends JpaRepository<LeaveType, Long> {

    LeaveType findByLeaveTypeName(String leaveTypeName);
}
