package com.example.leaveapp.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "USERS")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_seq")
    @SequenceGenerator(
            name = "user_seq",
            sequenceName = "USER_SEQ",
            allocationSize = 1
    )
    @Column(name="USER_ID")
    private Long userId;
    
    @Column(name = "NAME")
    private String name;

    @Column(nullable = false, unique = true)
    private String email;
    @Column(name = "PASSWORD")
    private String password;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATED_AT")
    private Date createdAt;

    @Column(name = "DELETED", nullable = false)
    private Boolean deleted = false;

    @ManyToOne
    @JoinColumn(name = "ROLE_ID")
    private Role role;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isDeleted() {
    return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}