<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Admin Dashboard</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f4f6fb;
        margin: 0;
    }

    .page-title {
        text-align: center;
        margin-top: 40px;
        font-size: 28px;
        color: #333;
    }

    .card-container {
        width: 85%;
        margin: 30px auto;
        background: white;
        padding: 25px;
        border-radius: 16px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .card-container:hover {
        transform: translateY(-4px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.12);
    }

    h3 {
        margin-bottom: 10px;
        color: #444;
        text-align: center;
    }
    .admin-links {
        display: flex;
        flex-wrap: wrap;              
        justify-content: center;      
        gap: 16px;
        margin-top: 15px;
    }

    .admin-btn {
        display: block;
        padding: 12px 20px;
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color: white;
        text-decoration: none;
        border-radius: 8px;
        width: 240px;
        text-align: center;
        font-weight: 500;
        letter-spacing: 0.5px;
        transition: all 0.25s ease;
        box-shadow: 0 4px 10px rgba(47,96,211,0.2);
    }

    .admin-btn:hover {
        transform: translateY(-2px) scale(1.03);
        box-shadow: 0 6px 18px rgba(47,96,211,0.3);
    }

    .admin-btn:active {
        transform: scale(0.97);
    }

    .logout-btn {
        background: linear-gradient(135deg, #e74c3c, #ff6b5a);
        box-shadow: 0 4px 10px rgba(231,76,60,0.2);
    }

    .logout-btn:hover {
        box-shadow: 0 6px 18px rgba(231,76,60,0.3);
    }

    .dashboard-links {
        display: flex;
        justify-content: center;
        margin: 30px 0;
    }
</style>

</head>

<body>

<h2 class="page-title">Admin Dashboard</h2>

<jsp:include page="error.jsp"/>
<div class="card-container">
<h3>Employee Management</h3>

<div class="admin-links">

<a class="admin-btn" href="<c:url value='/admin/employees'/>">
Manage Employees
</a>

<a class="admin-btn" href="<c:url value='/admin/assign-manager'/>">
Assign Manager
</a>

</div>

</div>


<div class="card-container">

<h3>Leave Management</h3>

<div class="admin-links">

<a class="admin-btn" href="<c:url value='/admin/leave-types'/>">
Manage Leave Types
</a>

<a class="admin-btn" href="<c:url value='/admin/leave-balance'/>">
View Leave Balance
</a>

<a class="admin-btn" href="<c:url value='/admin/leave-requests'/>">
View Leave Requests
</a>

<a class="admin-btn" href="<c:url value='/admin/manager-leaves'/>">
Manager Leave Requests
</a>

<a class="admin-btn" href="<c:url value='/admin/initialize-balance'/>">
Initialize Leave Balance
</a>

</div>

</div>

<div class="dashboard-links">
    <a class="admin-btn logout-btn" href="<c:url value='/logout'/>">Logout</a>
</div>

</body>
</html>