<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Admin Dashboard</title>

<style>

.admin-links{
display:flex;
flex-direction:column;
gap:12px;
margin-top:10px;
}

.admin-btn{
display:block;
padding:10px;
background:#2f60d3;
color:white;
text-decoration:none;
border-radius:6px;
width:220px;
text-align:center;
}

.admin-btn:hover{
background:#254db3;
}

.card-container{
width:85%;
margin:30px auto;
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.page-title{
text-align:center;
margin-top:40px;
}

.dashboard-links{
text-align:center;
margin-top:20px;
}

.dashboard-links a{
margin:0 10px;
color:#2f60d3;
text-decoration:none;
}

</style>

</head>

<body>

<h2 class="page-title">Admin Dashboard</h2>

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
<a href="<c:url value='/logout'/>">Logout</a>
</div>

</body>
</html>