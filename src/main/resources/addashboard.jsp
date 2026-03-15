<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>
<head>
<title>Admin Dashboard</title>

<style>

    body{
        font-family: Arial;
        background:#f4f4f4;
        text-align:center;
        margin-top:60px;
    }

    h1{
        margin-bottom:40px;
    }

    .container{
        display:flex;
        justify-content:center;
        flex-wrap:wrap;
    }

    .card{
        background:white;
        width:220px;
        margin:15px;
        padding:20px;
        border-radius:8px;
        box-shadow:0 2px 6px rgba(0,0,0,0.2);
    }

    .card a{
        text-decoration:none;
        font-size:16px;
        color:#333;
        font-weight:bold;
    }

    .card:hover{
        background:#e6f2ff;
    }

    .top{
        position:absolute;
        top:20px;
        left:20px;
    }

    .top a{
        text-decoration:none;
        color:#007BFF;
        font-weight:bold;
    }

</style>

</head>

<body>

<div class="top">
<a href="/login">⬅ Home</a>
</div>

<h1>Admin Dashboard</h1>

<div class="container">

<div class="card">
<a href="/admin/employees">Manage Employees</a>
</div>

<div class="card">
<a href="/admin/leave-types">Configure Leave Types</a>
</div>

<div class="card">
<a href="/admin/assign-manager">Assign Employees to Managers</a>
</div>

<div class="card">
<a href="/admin/leave-balance">Initialize Leave Balance</a>
</div>

<div class="card">
<a href="/admin/leave-requests">View Leave Requests</a>
</div>

</div>

</body>
</html>