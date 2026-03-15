package com.example.leaveapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.leaveapp.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByRoleName(String roleName);

}