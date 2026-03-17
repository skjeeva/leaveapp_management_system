package com.example.leaveapp.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "LEAVE_REQUESTS")
public class LeaveRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "leave_req_seq")
    @SequenceGenerator(
            name = "leave_req_seq",
            sequenceName = "LEAVE_REQ_SEQ",
            allocationSize = 1
    )
    @Column(name="LEAVE_ID")
    private Long leaveId;
    
    @ManyToOne
    @JoinColumn(name = "EMPLOYEE_ID")
    private User employee;

    @ManyToOne
    @JoinColumn(name = "LEAVE_TYPE_ID")
    private LeaveType leaveType;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "START_DATE")
    private LocalDate startDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "END_DATE")
    private LocalDate endDate;

    @Column(name="REASON")
    private String reason;

    @Column(name="STATUS")
    private String status;

    @Column(name = "MANAGER_COMMENT")
    private String managerComment;

    @Column(name = "APPLIED_DATE")
    private LocalDate appliedDate;

    public Long getLeaveId() {
        return leaveId;
    }

    public void setLeaveId(Long leaveId) {
        this.leaveId = leaveId;
    }

    public User getEmployee() {
        return employee;
    }

    public void setEmployee(User employee) {
        this.employee = employee;
    }

    public LeaveType getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(LeaveType leaveType) {
        this.leaveType = leaveType;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getManagerComment() {
        return managerComment;
    }

    public void setManagerComment(String managerComment) {
        this.managerComment = managerComment;
    }

    public LocalDate getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(LocalDate appliedDate) {
        this.appliedDate = appliedDate;
    }

}

