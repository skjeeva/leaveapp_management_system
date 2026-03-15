<%@ page import="java.util.*,com.example.leaveapp.entity.LeaveRequest" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>
<title>Manager Dashboard</title>

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

    /* action links */

    .manager-actions{
        text-align:center;
        margin-top:20px;
    }

    .manager-actions a{
        display:inline-block;
        margin:10px;
        padding:10px 18px;
        background:#2f60d3;
        color:white;
        text-decoration:none;
        border-radius:6px;
    }

    .manager-actions a:hover{
        background:#254db3;
    }

    /* card */

    .card-container{
        width:85%;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
    }

    /* table */

    .styled-table{
        width:100%;
        border-collapse:collapse;
        margin-top:15px;
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

    /* buttons */

    .inline-form{
        display:inline-block;
    }

    .btn-approve{
        background:#28a745;
        color:white;
        border:none;
        padding:6px 12px;
        cursor:pointer;
    }

    .btn-reject{
        background:#dc3545;
        color:white;
        border:none;
        padding:6px 12px;
        cursor:pointer;
    }

    .comment-box{
        padding:5px;
    }

    /* flash messages */

    .flash-success{
        background:#d4edda;
        color:#155724;
        padding:10px;
        margin-bottom:15px;
    }

    .flash-error{
        background:#f8d7da;
        color:#721c24;
        padding:10px;
        margin-bottom:15px;
    }

    .processed{
        color:gray;
    }

    /* bottom links */

    .dashboard-links{
        text-align:center;
        margin-top:25px;
    }

    .dashboard-links a{
        margin:0 10px;
    }

</style>

</head>

<body>

<h2 class="page-title">Manager Dashboard</h2>

<div class="manager-actions">

<a href="/manager/apply-leave">Apply Leave</a>



</div>


<div class="card-container">

<h3>Team Leave Requests</h3>

<%
String success = (String) request.getAttribute("successMessage");
String error = (String) request.getAttribute("errorMessage");
%>

<% if(success != null){ %>
<div class="flash-success"><%= success %></div>
<% } %>

<% if(error != null){ %>
<div class="flash-error"><%= error %></div>
<% } %>

<table class="styled-table">

<tr>
<th>Employee</th>
<th>Leave Type</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
<th>Manager Comment</th>
<th>Action</th>
</tr>

<%
List<LeaveRequest> requests =
(List<LeaveRequest>) request.getAttribute("leaveRequests");

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
<%= req.getManagerComment() == null ? "" : req.getManagerComment() %>
</td>

<td>

<% if("PENDING".equals(req.getStatus())){ %>

<form class="inline-form" action="/manager/approveLeave" method="post">

<input type="hidden" name="leaveId" value="<%= req.getLeaveId() %>">

<button class="btn-approve">Approve</button>

</form>

<form class="inline-form" action="/manager/rejectLeave" method="post">

<input type="hidden" name="leaveId" value="<%= req.getLeaveId() %>">

<input class="comment-box" type="text" name="comment" placeholder="Reason" required>

<button class="btn-reject">Reject</button>

</form>

<% } else { %>

<span class="processed">Processed</span>

<% } %>

</td>

</tr>

<%
}
}
%>

</table>

</div>


<div class="card-container">

<h3>My Leave Requests</h3>

<table class="styled-table">

<tr>
<th>Leave Type</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
<th>Admin Comment</th>
</tr>

<%
List<LeaveRequest> myLeaves =
(List<LeaveRequest>) request.getAttribute("myLeaves");

if(myLeaves != null){
for(LeaveRequest req : myLeaves){
%>

<tr>

<td><%= req.getLeaveType().getLeaveTypeName() %></td>

<td><%= req.getStartDate() %></td>

<td><%= req.getEndDate() %></td>

<td><%= req.getStatus() %></td>

<td>
<%= req.getManagerComment() == null ? "" : req.getManagerComment() %>
</td>

</tr>

<%
}
}
%>

</table>

</div>


<div class="dashboard-links">

<a href="/manager/dashboard">Refresh</a>

<a href="/logout">Logout</a>

<br><br>
</div>

</body>

</html>