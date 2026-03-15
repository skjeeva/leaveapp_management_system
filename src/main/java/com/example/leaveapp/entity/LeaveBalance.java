package com.example.leaveapp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "LEAVE_BALANCE")
public class LeaveBalance {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "leave_bal_seq")
    @SequenceGenerator(
            name = "leave_bal_seq",
            sequenceName = "LEAVE_BAL_SEQ",
            allocationSize = 1
    )
    @Column(name="BALANCE_ID")
    private Long balanceId;

    @ManyToOne
    @JoinColumn(name = "EMPLOYEE_ID")
    private User employee;

    @ManyToOne
    @JoinColumn(name = "LEAVE_TYPE_ID")
    private LeaveType leaveType;

    private int year;

    @Column(name = "TOTAL_DAYS")
    private int totalDays;

    @Column(name = "USED_DAYS")
    private int usedDays;

    @Column(name = "REMAINING_DAYS")
    private int remainingDays;

    public Long getBalanceId() {
        return balanceId;
    }

    public void setBalanceId(Long balanceId) {
        this.balanceId = balanceId;
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

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getTotalDays() {
        return totalDays;
    }

    public void setTotalDays(int totalDays) {
        this.totalDays = totalDays;
    }

    public int getUsedDays() {
        return usedDays;
    }

    public void setUsedDays(int usedDays) {
        this.usedDays = usedDays;
    }

    public int getRemainingDays() {
        return remainingDays;
    }

    public void setRemainingDays(int remainingDays) {
        this.remainingDays = remainingDays;
    }
}