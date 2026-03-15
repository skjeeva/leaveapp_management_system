<%@ page import="java.util.*,com.example.leaveapp.entity.LeaveRequest,com.example.leaveapp.entity.LeaveBalance,com.example.leaveapp.entity.LeaveType" %>
<html>

<head>
<title>Employee Dashboard</title>
</head>

<style>
        /* form layout */

    .leave-form{
        display:flex;
        flex-direction:column;
        gap:10px;
        max-width:400px;
    }

    .leave-form input,
    .leave-form select{
        padding:8px;
        border:1px solid #ccc;
        border-radius:4px;
    }

    /* buttons */

    .btn-primary{
        background:#2f60d3;
        color:white;
        border:none;
        padding:10px;
        cursor:pointer;
        border-radius:5px;
    }

    .btn-primary:hover{
        background:#254db3;
    }

    /* table style */

    .styled-table{
        width:100%;
        border-collapse:collapse;
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

    /* card container */

    .card-container{
        width:85%;
        margin:30px auto;
        background:white;
        padding:25px;
        border-radius:12px;
        box-shadow:0 4px 15px rgba(0,0,0,0.1);
    }

    /* page title */

    .page-title{
        text-align:center;
        margin-top:40px;
    }

    /* links */

    .dashboard-links{
        text-align:center;
        margin-top:20px;
    }

    .dashboard-links a{
        margin:0 10px;
    }
</style>

<body>

<h2 class="page-title">Employee Dashboard</h2>

<div class="card-container">

<h3>Apply Leave</h3>

<form class="leave-form" action="/employee/applyLeave" method="post">

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
<input type="text" name="reason" placeholder="Enter reason" required>

<button class="btn-primary" type="submit">Apply Leave</button>

</form>

</div>


<div class="card-container">

<h3>Your Leave Requests</h3>

<table class="styled-table">

<tr>
<th>Leave Type</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
<th>Manager Comment</th>
</tr>

<%
List<LeaveRequest> requests =
(List<LeaveRequest>) request.getAttribute("leaveRequests");

if(requests != null){
for(LeaveRequest req : requests){
%>

<tr>

<td><%= req.getLeaveType().getLeaveTypeName() %></td>
<td><%= req.getStartDate() %></td>
<td><%= req.getEndDate() %></td>
<td><%= req.getStatus() %></td>
<td><%= req.getManagerComment() == null ? "" : req.getManagerComment() %></td>

</tr>

<%
}
}
%>

</table>

</div>


<div class="card-container">

<h3>Your Leave Balance</h3>

<table class="styled-table">

<tr>
<th>Leave Type</th>
<th>Remaining Days</th>
</tr>

<%
List<LeaveBalance> balances =
(List<LeaveBalance>) request.getAttribute("balances");

if(balances != null){
for(LeaveBalance bal : balances){
%>

<tr>

<td><%= bal.getLeaveType().getLeaveTypeName() %></td>
<td><%= bal.getRemainingDays() %></td>

</tr>

<%
}
}
%>

</table>

</div>


<div class="dashboard-links">
<a href="/employee/dashboard">Refresh</a>
<a href="/logout">Logout</a>
</div>

<br><br>
</body>

</html>