<%@ page import="java.util.*, com.example.leaveapp.entity.LeaveType" %>

<html>

<head>
<title>Leave Types</title>

<style>

    body{
        font-family: Arial, sans-serif;
        background:#eef2f7;
    }

    .page-title{
        text-align:center;
        margin-top:40px;
    }
    .card-container{
        width:600px;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
    }
    .form-group{
        margin-bottom:18px;
    }

    label{
        font-weight:bold;
    }

    input{
        width:100%;
        padding:8px;
        margin-top:6px;
        border:1px solid #ccc;
        border-radius:6px;
    }

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

<h2 class="page-title">Leave Types</h2>

<div class="card-container">

<h3>Add Leave Type</h3>

<form action="/admin/addLeaveType" method="post">

<div class="form-group">
<label>Leave Name</label>
<input type="text" name="leaveTypeName" required>
</div>

<div class="form-group">
<label>Max Days Per Year</label>
<input type="number" name="maxDaysPerYear" required>
</div>

<button class="btn-primary" type="submit">
Add Leave Type
</button>

</form>

<hr>

<h3>Existing Leave Types</h3>

<table class="styled-table">

<tr>
<th>ID</th>
<th>Leave Type</th>
<th>Max Days</th>
</tr>

<%

List<LeaveType> types =
(List<LeaveType>) request.getAttribute("leaveTypes");

if(types != null){

for(LeaveType t : types){

%>

<tr>

<td><%= t.getLeaveTypeId() %></td>

<td><%= t.getLeaveTypeName() %></td>

<td><%= t.getMaxDaysPerYear() %></td>

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