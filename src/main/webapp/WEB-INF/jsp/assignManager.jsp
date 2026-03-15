<%@ page import="java.util.*, com.example.leaveapp.entity.User" %>

<html>

<head>
<title>Assign Manager</title>

<style>

    body{
        font-family: Arial, sans-serif;
        background:#eef2f7;
    }

    /* title */

    .page-title{
        text-align:center;
        margin-top:40px;
    }

    /* card */

    .card-container{
        width:45%;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
    }

    /* form */

    .form-group{
        margin-bottom:20px;
    }

    select{
        width:100%;
        padding:8px;
        border:1px solid #ccc;
        border-radius:5px;
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

    /* links */

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

<h2 class="page-title">Assign Manager</h2>

<div class="card-container">

<form action="/admin/assignManager" method="post">

<div class="form-group">

<h3>Select Employee</h3>

<select name="employeeId">

<%

List<User> employees =
(List<User>) request.getAttribute("employees");

if(employees != null){

for(User emp : employees){

%>

<option value="<%= emp.getUserId() %>">
<%= emp.getName() %>
</option>

<%
}
}
%>

</select>

</div>


<div class="form-group">

<h3>Select Manager</h3>

<select name="managerId">

<%

List<User> managers =
(List<User>) request.getAttribute("managers");

if(managers != null){

for(User mgr : managers){

%>

<option value="<%= mgr.getUserId() %>">
<%= mgr.getName() %>
</option>

<%
}
}
%>

</select>

</div>

<button class="btn-primary" type="submit">
Assign Manager
</button>

</form>

</div>

<div class="dashboard-links">
<a href="/admin/dashboard">Back to Dashboard</a>
</div>

</body>

</html>