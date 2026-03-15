<%@ page import="java.util.*,com.example.leaveapp.entity.LeaveType" %>

<html>

<head>
<title>Manager Apply Leave</title>

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
        width:420px;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
    }

    /* form */

    .leave-form{
        display:flex;
        flex-direction:column;
    }

    .leave-form label{
        font-weight:bold;
        margin-top:12px;
    }

    .leave-form input,
    .leave-form select{
        padding:8px;
        margin-top:5px;
        border:1px solid #ccc;
        border-radius:6px;
    }

    /* button */

    .btn-primary{
        margin-top:18px;
        background:#2f60d3;
        color:white;
        border:none;
        padding:10px;
        border-radius:6px;
        cursor:pointer;
    }

    .btn-primary:hover{
        background:#254db3;
    }

    /* back link */

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

<h2 class="page-title">Apply Leave (Manager)</h2>

<div class="card-container">

<form class="leave-form" action="/manager/applyLeave" method="post">

<label>Leave Type</label>

<select name="leaveType.leaveTypeId" required>

<option value="">Select Leave Type</option>

<%
List<LeaveType> types =
(List<LeaveType>) request.getAttribute("leaveTypes");

if(types != null){
for(LeaveType t : types){
%>

<option value="<%= t.getLeaveTypeId() %>">
<%= t.getLeaveTypeName() %>
</option>

<%
}
}
%>

</select>

<label>Start Date</label>
<input type="date" name="startDate" required>

<label>End Date</label>
<input type="date" name="endDate" required>

<label>Reason</label>
<input type="text" name="reason" required>

<button class="btn-primary" type="submit">
Apply Leave
</button>

</form>

</div>

<div class="dashboard-links">
<a href="/manager/dashboard">Back to Dashboard</a>
</div>

</body>
</html>