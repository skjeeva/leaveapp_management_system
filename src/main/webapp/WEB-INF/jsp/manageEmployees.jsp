<%@ page import="java.util.*, com.example.leaveapp.entity.User" %>

<html>

<head>
<title>Manage Employees</title>

<style>

    body{
        font-family: Arial, sans-serif;
        background:#eef2f7;
    }

    /* page title */

    .page-title{
        text-align:center;
        margin-top:40px;
    }

    /* card */

    .card-container{
        width:700px;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
    }

    /* form */

    .form-group{
        margin-bottom:16px;
    }

    label{
        font-weight:bold;
    }

    input, select{
        width:100%;
        padding:8px;
        margin-top:5px;
        border:1px solid #ccc;
        border-radius:6px;
    }

    /* button */

    .btn-primary{
        background:#2f60d3;
        color:white;
        border:none;
        padding:10px 16px;
        border-radius:6px;
        cursor:pointer;
    }

    .btn-primary:hover{
        background:#254db3;
    }

    /* table */

    .styled-table{
        width:100%;
        border-collapse:collapse;
        margin-top:20px;
    }

    .styled-table th{
        background:#2f60d3;
        color:white;
        padding:12px;
    }

    .styled-table td{
        padding:10px;
        border-bottom:1px solid #eee;
    }

    .styled-table tr:hover{
        background:#f5f7fb;
    }

    /* delete link */

    .delete-link{
        color:#dc3545;
        text-decoration:none;
    }

    /* dashboard link */

    .dashboard-links{
        text-align:center;
        margin-top:20px;
    }

    .dashboard-links a{
        color:#2f60d3;
        text-decoration:none;
    }

</style>

</head>

<body>

<h2 class="page-title">Manage Employees</h2>

<div class="card-container">

<h3>Add User</h3>

<form action="/admin/addEmployee" method="post">

<div class="form-group">
<label>Name</label>
<input type="text" name="name" required>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" required>
</div>

<div class="form-group">
<label>Role</label>

<select name="roleId">
<option value="3">Employee</option>
<option value="2">Manager</option>
</select>

</div>

<button class="btn-primary" type="submit">
Add User
</button>

</form>

<hr>

<h3>Employee List</h3>

<table class="styled-table">

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Action</th>
</tr>

<%

List<User> employees =
(List<User>) request.getAttribute("employees");

if(employees != null){

for(User emp : employees){

%>

<tr>

<td><%= emp.getUserId() %></td>

<td><%= emp.getName() %></td>

<td><%= emp.getEmail() %></td>

<td>
<a class="delete-link" href="/admin/deleteEmployee?id=<%= emp.getUserId() %>">
Delete
</a>
</td>

</tr>

<%
}
}
%>

</table>

</div>

<div class="dashboard-links">
<a href="/admin/dashboard">Back to Dashboard</a>
</div>

</body>

</html>