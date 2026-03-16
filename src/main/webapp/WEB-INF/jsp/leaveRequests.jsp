<%@ page import="java.util.*, com.example.leaveapp.entity.LeaveRequest" %>

<html>

<head>
<title>All Leave Requests</title>

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
        width:85%;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
    }
    .styled-table{
        width:100%;
        border-collapse:collapse;
    }

    .styled-table th{
        background:#2f60d3;
        color:white;
        padding:14px;
    }

    .styled-table td{
        padding:12px;
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

<h2 class="page-title">All Leave Requests</h2>

<div class="card-container">

<table class="styled-table">

<tr>
<th>Employee</th>
<th>Leave Type</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
<th>Manager Comment</th>
</tr>

<%

List<LeaveRequest> requests =
(List<LeaveRequest>) request.getAttribute("requests");

if(requests != null){

for(LeaveRequest r : requests){

%>

<tr>

<td><%= r.getEmployee().getName() %></td>

<td><%= r.getLeaveType().getLeaveTypeName() %></td>

<td><%= r.getStartDate() %></td>

<td><%= r.getEndDate() %></td>

<td><%= r.getStatus() %></td>

<td>
<%= r.getManagerComment() == null ? "" : r.getManagerComment() %>
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