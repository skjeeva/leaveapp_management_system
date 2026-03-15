<%@ page import="java.util.*, com.example.leaveapp.entity.User, com.example.leaveapp.entity.LeaveType" %>

<html>

<head>
<title>Initialize Leave Balance</title>

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

    /* card container */

    .card-container{
        width:420px;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
    }

    /* form */

    .form-group{
        margin-bottom:18px;
    }

    label{
        font-weight:bold;
    }

    select,
    input{
        width:100%;
        padding:8px;
        margin-top:6px;
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

<h2 class="page-title">Initialize Leave Balance</h2>

<div class="card-container">

<form action="/admin/initializeLeaveBalance" method="post">

<div class="form-group">

<label>Select Employee</label>

<select name="employeeId">

<%
List<User> employees = (List<User>) request.getAttribute("employees");

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

<label>Select Leave Type</label>

<select name="leaveTypeId">

<%
List<LeaveType> leaveTypes = (List<LeaveType>) request.getAttribute("leaveTypes");

if(leaveTypes != null){
for(LeaveType type : leaveTypes){
%>

<option value="<%= type.getLeaveTypeId() %>">
<%= type.getLeaveTypeName() %>
</option>

<%
}
}
%>

</select>

</div>


<div class="form-group">

<label>Year</label>

<input type="number" name="year" value="2026">

</div>


<div class="form-group">

<label>Total Days</label>

<input type="number" name="totalDays">

</div>

<button class="btn-primary" type="submit">
Initialize Balance
</button>

</form>

</div>

<div class="dashboard-links">
<a href="/admin/dashboard">Back to Dashboard</a>
</div>

</body>

</html>