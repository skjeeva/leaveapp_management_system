package com.example.leaveapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "LEAVE_TYPES")
public class LeaveType {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "leave_type_seq")
    @SequenceGenerator(
            name = "leave_type_seq",
            sequenceName = "LEAVE_TYPE_SEQ",
            allocationSize = 1
    )
    @Column(name="LEAVE_TYPE_ID")
    private Long leaveTypeId;

    @Column(name = "LEAVE_TYPE_NAME")
    private String leaveTypeName;

    @Column(name = "MAX_DAYS_PER_YEAR")
    private int maxDaysPerYear;

    public Long getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(Long leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public String getLeaveTypeName() {
        return leaveTypeName;
    }

    public void setLeaveTypeName(String leaveTypeName) {
        this.leaveTypeName = leaveTypeName;
    }

    public int getMaxDaysPerYear() {
        return maxDaysPerYear;
    }

    public void setMaxDaysPerYear(int maxDaysPerYear) {
        this.maxDaysPerYear = maxDaysPerYear;
    }
}