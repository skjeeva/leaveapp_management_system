# Leave Management System

A role-based Leave Management System built using Java and JSP that helps organizations manage employee leave requests efficiently.

---

## 🚀 Features

### 👤 Employee
- Apply for leave
- View leave request status (Pending / Approved / Rejected)
- Check leave balance
- View manager comments

### 👨‍💼 Manager
- Approve or reject employee leave requests
- Provide comments while rejecting
- View team leave requests
- Apply leave

### 🛠 Admin
- Add and manage employees
- Assign managers to employees
- Manage leave types
- Initialize leave balances
- View all leave requests
- Handle manager leave approvals

---

## 🧰 Tech Stack

- **Backend:** Java, Spring Boot
- **Frontend:** JSP, HTML, CSS
- **Database:** MySQL
- **Build Tool:** Maven
- **Server:** Embedded Tomcat

---

## 📂 Project Structure

src/
└── main/
├── java/com/example/leaveapp/
│ ├── config/
│ ├── controller/
│ ├── entity/
│ ├── exception/
│ ├── interceptor/
│ ├── repository/
│ ├── service/
│ └── LeaveappApplication.java ==> main function
│
├── resources/
│
└── webapp/WEB-INF/jsp/ ==> jsp files


## ⚙️ Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/skjeeva/leaveapp_management_system.git
cd leaveapp_management_system
```

## 2. Configure Database

Create an Oracle database
Update your DB credentials in:
application.properties

## 3. Run the application

mvn spring-boot:run

## 4. Open in browser

http://localhost:8080/
