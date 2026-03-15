<%@ page contentType="text/html;charset=UTF-8" %>

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

    /* Card container */

    .card-container{
    width:85%;
    margin:30px auto;
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
    }

    /* Title */

    .page-title{
    text-align:center;
    margin-top:40px;
    }

    /* Logout */

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

<a class="admin-btn" href="/admin/employees">
Manage Employees
</a>

<a class="admin-btn" href="/admin/assign-manager">
Assign Manager
</a>

</div>

</div>


<div class="card-container">

<h3>Leave Management</h3>

<div class="admin-links">

<a class="admin-btn" href="/admin/leave-types">
Manage Leave Types
</a>

<a class="admin-btn" href="/admin/leave-balance">
View Leave Balance
</a>

<a class="admin-btn" href="/admin/leave-requests">
View Employee Leave Requests
</a>

<a class="admin-btn" href="/admin/manager-leaves">
Manager Leave Requests
</a>

<a class="admin-btn" href="/admin/initialize-balance">
Initialize Leave Balance
</a>

</div>

</div>

<div class="dashboard-links">
<a href="/logout">Logout</a>
</div>

</body>
</html>