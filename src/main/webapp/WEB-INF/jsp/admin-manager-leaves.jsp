<%@ page import="java.util.*,com.example.leaveapp.entity.LeaveRequest" %>

<html>

<head>
<title>Manager Leave Requests</title>

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

    .btn-approve{
        background:#28a745;
        color:white;
        border:none;
        padding:6px 12px;
        border-radius:4px;
        cursor:pointer;
    }

    .btn-reject{
        background:#dc3545;
        color:white;
        border:none;
        padding:6px 12px;
        border-radius:4px;
        cursor:pointer;
    }

    .btn-approve:hover{
        background:#218838;
    }

    .btn-reject:hover{
        background:#c82333;
    }

    input[type="text"]{
        padding:5px;
        margin:4px;
        border:1px solid #ccc;
        border-radius:4px;
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

<h2 class="page-title">Manager Leave Requests</h2>

<div class="card-container">

<table class="styled-table">

<tr>
<th>Manager</th>
<th>Leave Type</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
List<LeaveRequest> requests =
(List<LeaveRequest>) request.getAttribute("requests");

if(requests != null){
for(LeaveRequest req : requests){
%>

<tr>

<td><%= req.getEmployee().getName() %></td>

<td><%= req.getLeaveType().getLeaveTypeName() %></td>

<td><%= req.getStartDate() %></td>

<td><%= req.getEndDate() %></td>

<td><%= req.getStatus() %></td>

<td>

<% if("PENDING".equals(req.getStatus())){ %>

<form action="/admin/approveManagerLeave" method="post" style="display:inline;">

<input type="hidden" name="leaveId" value="<%= req.getLeaveId() %>">

<button class="btn-approve">Approve</button>

</form>

<form action="/admin/rejectManagerLeave" method="post" style="display:inline;">

<input type="hidden" name="leaveId" value="<%= req.getLeaveId() %>">

<input type="text" name="comment" placeholder="Reason">

<button class="btn-reject">Reject</button>

</form>

<% } else { %>

Processed

<% } %>

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