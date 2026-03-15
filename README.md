🗂 Leave Management System

A Leave Management System built using Java Spring Boot, Maven, JSP, and MySQL.

This application helps organizations manage employee leave requests efficiently. Employees can apply for leave, managers can review and approve requests, and administrators can manage employees and leave policies.

---

# 🚀 Features

## 👩‍💼 Employee

* Apply for leave
* View available leave balance
* Track the status of submitted leave requests

## 👨‍💼 Manager

* Approve or reject employee leave requests
* View leave requests submitted by employees

## 🛠 Admin

* Manage employee records
* Manage leave types
* Monitor overall leave records

---

# 🧰 Tech Stack

## Backend

* Java
* Spring Boot
* Spring MVC
* Spring Data JPA

## Frontend

* JSP
* HTML
* CSS

## Database

* Oracle DB

## Database Tool

* Oracle SQL Developer

## Build Tool

* Maven

---

# 📂 Project Structure

```
leaveapp_management_system
│
├── controller      # Handles HTTP requests
├── entity          # Database entities
├── repository      # JPA repositories
├── service         # Business logic layer
├── exception       # Global exception handling
│
├── resources
│   ├── application.properties
│   └── WEBAPP / WEB-INF / jsp     #jsp pages
│
└── Leaveapp.sql    # Database schema
```

---

# ⚙️ Installation & Setup

## 1️⃣ Clone the repository

```bash
git clone https://github.com/skjeeva/leaveapp_management_system.git
```

---

## 2️⃣ Navigate to the project directory

```bash
cd leaveapp_management_system
```

---

# Database Setup

1️⃣ Open Oracle SQL Developer

# Connect to your Oracle Database using SQL Developer.

2️⃣ Import the SQL file

# Run the script:

Leaveapp.sql

This will create the required tables.

3️⃣ Configure database connection

# Update application.properties

spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.datasource.driver-class-name=oracle.jdbc.driver.OracleDriver
spring.jpa.database-platform=org.hibernate.dialect.OracleDialect


## 4️⃣ Run the Application

Using Maven:

```bash
mvn spring-boot:run
```

Or run the main class:

```
LeaveappApplication.java
```

---

# 📦 Application Modules

| Module             | Description                       |
| ------------------ | --------------------------------- |
| AuthController     | Handles authentication and login  |
| EmployeeController | Handles employee leave operations |
| ManagerController  | Handles manager approval workflow |
| AdminController    | Handles admin management features |

---

# 🗄 Database Entities

* User
* Role
* Employee
* LeaveRequest
* LeaveBalance
* LeaveType
* EmployeeManager


* architecture diagram
* API endpoints section.
