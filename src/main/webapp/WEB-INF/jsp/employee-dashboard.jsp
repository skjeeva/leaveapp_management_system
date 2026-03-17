<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Employee Dashboard</title>

<style>
    body{
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #eef2f7, #dbeafe);
        margin: 0;
    }

    .page-title{
        text-align:center;
        margin-top:40px;
        color:#333;
    }

    .card-container{
        width:85%;
        margin:30px auto;
        background:white;
        padding:25px;
        border-radius:16px;
        box-shadow:0 6px 25px rgba(0,0,0,0.08);
        transition:0.25s ease;
    }

    .card-container:hover{
        transform:translateY(-3px);
    }

    .leave-form{
        display:flex;
        flex-direction:column;
        gap:12px;
        max-width:400px;
    }

    .leave-form input,
    .leave-form select{
        padding:10px;
        border:1px solid #ccc;
        border-radius:8px;
        transition:0.2s ease;
    }

    .leave-form input:focus,
    .leave-form select:focus{
        border-color:#2f60d3;
        outline:none;
        box-shadow:0 0 6px rgba(47,96,211,0.3);
    }

    .btn-primary{
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color:white;
        border:none;
        padding:12px;
        cursor:pointer;
        border-radius:8px;
        transition:0.25s ease;
    }

    .btn-primary:hover{
        transform:translateY(-2px);
        box-shadow:0 6px 18px rgba(47,96,211,0.3);
    }

    .btn-primary:active{
        transform:scale(0.97);
    }

    .styled-table{
        width:100%;
        border-collapse:collapse;
        margin-top:15px;
    }

    .styled-table th{
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color:white;
        padding:12px;
    }

    .styled-table td{
        padding:12px;
        border-bottom:1px solid #eee;
    }

    .styled-table tr:hover{
        background:#f5f7fb;
    }

    .status{
        padding:5px 12px;
        border-radius:20px;
        font-size:12px;
        font-weight:600;
    }

    .status.approved{
        background:#d4edda;
        color:#155724;
    }

    .status.rejected{
        background:#f8d7da;
        color:#721c24;
    }

    .status.pending{
        background:#fff3cd;
        color:#856404;
    }

    .dashboard-links{
        display:flex;
        justify-content:center;
        gap:15px;
        margin-top:25px;
    }

    .dashboard-links a{
        padding:10px 18px;
        background:#2f60d3;
        color:white;
        text-decoration:none;
        border-radius:8px;
        transition:0.2s ease;
    }

    .dashboard-links a:hover{
        background:#254db3;
    }
</style>

</head>

<body>

<h2 class="page-title">Employee Dashboard</h2>

<jsp:include page="error.jsp"/>

<div class="card-container">

<h3>Apply Leave</h3>

<form class="leave-form" action="<c:url value='/employee/applyLeave'/>" method="post">

<label>Leave Type</label>

<select name="leaveType.leaveTypeId" required>
<option value="">Select Leave Type</option>

<c:forEach var="t" items="${leaveTypes}">
    <option value="${t.leaveTypeId}">
        ${t.leaveTypeName}
    </option>
</c:forEach>

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

<c:forEach var="req" items="${leaveRequests}">

<tr>

<td>${req.leaveType.leaveTypeName}</td>
<td>${req.startDate}</td>
<td>${req.endDate}</td>

<td>
<c:choose>
    <c:when test="${req.status == 'APPROVED'}">
        <span class="status approved">Approved</span>
    </c:when>
    <c:when test="${req.status == 'REJECTED'}">
        <span class="status rejected">Rejected</span>
    </c:when>
    <c:otherwise>
        <span class="status pending">Pending</span>
    </c:otherwise>
</c:choose>
</td>

<td>
<c:choose>
    <c:when test="${not empty req.managerComment}">
        ${req.managerComment}
    </c:when>
    <c:otherwise>
        -
    </c:otherwise>
</c:choose>
</td>

</tr>

</c:forEach>

</table>

</div>

<div class="card-container">

<h3>Your Leave Balance</h3>

<table class="styled-table">

<tr>
<th>Leave Type</th>
<th>Remaining Days</th>
</tr>

<c:forEach var="bal" items="${balances}">

<tr>

<td>${bal.leaveType.leaveTypeName}</td>
<td>${bal.remainingDays}</td>

</tr>

</c:forEach>

</table>

</div>

<div class="dashboard-links">
<a href="<c:url value='/employee/dashboard'/>">Refresh</a>
<a href="<c:url value='/logout'/>">Logout</a>
</div>

<br><br>

</body>
</html>