package com.example.leaveapp.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "EMPLOYEES")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    private String email;
    private String department;
    
    @Column(name = "DATE_OF_JOINING")
    private LocalDate dateOfJoining;

    public Employee() {
    }

    public Employee(String name, String email, String department, LocalDate dateOfJoining) {
        this.name = name;
        this.email = email;
        this.department = department;
        this.dateOfJoining = dateOfJoining;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public LocalDate getDateOfJoining() {
        return dateOfJoining;
    }

    public void setDateOfJoining(LocalDate dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }
}
