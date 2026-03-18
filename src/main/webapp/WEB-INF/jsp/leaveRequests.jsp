<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>All Leave Requests</title>

<style>
    body{
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #eef2f7, #dbeafe);
        margin:0;
    }

    .page-title{
        text-align:center;
        margin-top:40px;
        color:#333;
    }

    .card-container{
        width:90%;
        margin:40px auto;
        background:white;
        padding:30px;
        border-radius:16px;
        box-shadow:0 6px 25px rgba(0,0,0,0.08);
        transition:0.25s ease;
    }

    .card-container:hover{
        transform:translateY(-3px);
    }

    .styled-table{
        width:100%;
        border-collapse:collapse;
        margin-top:15px;
    }

    .styled-table th{
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color:white;
        padding:14px;
        text-align:center;
    }

    .styled-table td{
        padding:12px;
        border-bottom:1px solid #eee;
        text-align:center;
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
        margin:30px 0;
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
<jsp:include page="error.jsp"/>

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

<c:forEach var="r" items="${requests}">

<tr>

<td>${r.employee.name}</td>

<td>${r.leaveType.leaveTypeName}</td>

<td>${r.startDate}</td>

<td>${r.endDate}</td>

<td>
<c:choose>
    <c:when test="${r.status == 'APPROVED'}">
        <span class="status approved">Approved</span>
    </c:when>
    <c:when test="${r.status == 'REJECTED'}">
        <span class="status rejected">Rejected</span>
    </c:when>
    <c:otherwise>
        <span class="status pending">Pending</span>
    </c:otherwise>
</c:choose>
</td>

<td>
<c:choose>
    <c:when test="${not empty r.managerComment}">
        ${r.managerComment}
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

<div class="dashboard-links">
<a href="<c:url value='/admin/dashboard'/>">Back to Dashboard</a>
</div>

</body>

</html>