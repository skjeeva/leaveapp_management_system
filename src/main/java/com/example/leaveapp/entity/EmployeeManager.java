package com.example.leaveapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "EMPLOYEE_MANAGER")
public class EmployeeManager {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "emp_mgr_seq")
    @SequenceGenerator(
            name = "emp_mgr_seq",
            sequenceName = "EMP_MANAGER_SEQ",
            allocationSize = 1
    )
    @Column(name="ID")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "EMPLOYEE_ID")
    private User employee;

    @ManyToOne
    @JoinColumn(name = "MANAGER_ID")
    private User manager;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getEmployee() {
        return employee;
    }

    public void setEmployee(User employee) {
        this.employee = employee;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }
}