<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Leave Balance</title>

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

    .remaining-high{
        color:#28a745;
        font-weight:bold;
    }

    .remaining-low{
        color:#dc3545;
        font-weight:bold;
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

<h2 class="page-title">Leave Balance</h2>

<div class="card-container">

<table class="styled-table">

<tr>
<th>Employee</th>
<th>Leave Type</th>
<th>Year</th>
<th>Total</th>
<th>Used</th>
<th>Remaining</th>
</tr>

<c:forEach var="b" items="${balances}">

<tr>

<td>${b.employee.name}</td>
<td>${b.leaveType.leaveTypeName}</td>
<td>${b.year}</td>
<td>${b.totalDays}</td>
<td>${b.usedDays}</td>
<td>
<c:choose>
    <c:when test="${b.remainingDays > 5}">
        <span class="remaining-high">${b.remainingDays}</span>
    </c:when>
    <c:otherwise>
        <span class="remaining-low">${b.remainingDays}</span>
    </c:otherwise>
</c:choose>
</td>

</tr>

</c:forEach>

</table>

</div>

<div class="dashboard-links">
    <a href="<c:url value='/admin/dashboard'/>">
        ← Back to Dashboard
    </a>
</div>

</body>
</html>