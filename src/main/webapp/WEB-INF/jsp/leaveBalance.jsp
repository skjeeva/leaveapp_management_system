<%@ page import="java.util.List" %>
<%@ page import="com.example.leaveapp.entity.LeaveBalance" %>

<!DOCTYPE html>
<html>
<head>
<title>Leave Balance</title>

<style>
    body{font-family:"Segoe UI";background:#eef2f7;margin:0;}
    .container{width:85%;margin:auto;margin-top:40px;}
    .card{background:white;padding:20px;border-radius:10px;box-shadow:0 4px 12px rgba(0,0,0,0.1);}
    table{width:100%;border-collapse:collapse;margin-top:20px;}
    th{background:#2563eb;color:white;padding:10px;}
    td{padding:10px;border-bottom:1px solid #ddd;text-align:center;}
</style>
</head>

<body>

<div class="container">

<h2 style="text-align:center;">Leave Balance</h2>

<div class="card">

<table>

<tr>
<th>Employee</th>
<th>Leave Type</th>
<th>Year</th>
<th>Total</th>
<th>Used</th>
<th>Remaining</th>
</tr>

<%
List<LeaveBalance> balances = (List<LeaveBalance>) request.getAttribute("balances");

if(balances != null){
for(LeaveBalance b : balances){
%>

<tr>

<td><%= b.getEmployee().getName() %></td>
<td><%= b.getLeaveType().getLeaveTypeName() %></td>
<td><%= b.getYear() %></td>
<td><%= b.getTotalDays() %></td>
<td><%= b.getUsedDays() %></td>
<td><%= b.getRemainingDays() %></td>

</tr>

<%
}
}
%>

</table>

</div>

</div>

<br><br>
<div style="justify-content:center;display:flex;">
<a href="/admin/dashboard">Back to Dashboard</a>
</div>
<br><br>

</body>
</html>