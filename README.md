Leave Management System

A Leave Management System built using Java Spring Boot, Maven, JSP, and MySQL.
This application allows employees to apply for leave, managers to review requests, and administrators to manage employees and leave policies.

Features
Employee

Apply for leave

View leave balance

Track leave request status

Manager

Approve or reject leave requests

View employee leave requests

Admin

Manage employees

Manage leave types

Monitor leave records

Tech Stack

Backend

Java

Spring Boot

Spring MVC

Spring Data JPA

Frontend

JSP

HTML

CSS

Database

MySQL

Build Tool

Maven

Project Structure
leaveapp_management_system
│
├── controller        # Handles HTTP requests
├── entity            # Database entities
├── repository        # JPA repositories
├── service           # Business logic
├── exception         # Global exception handling
│
├── resources
│   ├── application.properties
│   └── JSP pages
│
└── Leaveapp.sql      # Database schema
Installation & Setup
1. Clone the repository
git clone https://github.com/skjeeva/leaveapp_management_system.git
2. Navigate to project folder
cd leaveapp_management_system
3. Configure database

Create a MySQL database and import:

Leaveapp.sql

Update application.properties

spring.datasource.url=jdbc:mysql://localhost:3306/leaveapp
spring.datasource.username=your_username
spring.datasource.password=your_password
4. Run the application

Using Maven:

mvn spring-boot:run

Or run the main class:

LeaveappApplication.java
Application Modules
Module	Description
AuthController	Handles login and authentication
EmployeeController	Employee leave operations
ManagerController	Manager approval workflow
AdminController	Admin management features
Database Entities

User

Role

Employee

LeaveRequest

LeaveBalance

LeaveType

EmployeeManager
