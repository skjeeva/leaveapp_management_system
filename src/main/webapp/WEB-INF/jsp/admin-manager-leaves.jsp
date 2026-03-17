<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Manager Leave Requests</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #eef2f7;
        margin: 0;
    }

    .page-title {
        text-align: center;
        margin-top: 40px;
        color: #333;
    }

    .card-container {
        width: 90%;
        margin: 40px auto;
        background: white;
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 6px 25px rgba(0,0,0,0.08);
        transition: 0.25s ease;
    }

    .card-container:hover {
        transform: translateY(-3px);
    }
    .styled-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .styled-table th {
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color: white;
        padding: 14px;
        text-align: left;
    }

    .styled-table td {
        padding: 12px;
        border-bottom: 1px solid #eee;
    }

    .styled-table tr:hover {
        background: #f5f7fb;
    }

    .btn-approve,
    .btn-reject {
        border: none;
        padding: 7px 14px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: 0.2s ease;
    }

    .btn-approve {
        background: linear-gradient(135deg, #28a745, #34d058);
        color: white;
    }

    .btn-approve:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(40,167,69,0.3);
    }

    .btn-reject {
        background: linear-gradient(135deg, #dc3545, #ff6b6b);
        color: white;
        margin-left: 6px;
    }

    .btn-reject:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(220,53,69,0.3);
    }

    input[type="text"] {
        padding: 7px;
        margin-right: 6px;
        border: 1px solid #ccc;
        border-radius: 6px;
        transition: 0.2s ease;
    }

    input[type="text"]:focus {
        border-color: #2f60d3;
        outline: none;
        box-shadow: 0 0 5px rgba(47,96,211,0.3);
    }

    .dashboard-links {
        display: flex;
        justify-content: center;
        margin: 30px 0;
    }

    .dashboard-links a {
        padding: 10px 18px;
        background: #2f60d3;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        transition: 0.2s ease;
    }

    .dashboard-links a:hover {
        background: #254db3;
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
</style>

</head>

<body>



<h2 class="page-title">Manager Leave Requests</h2>

<div class="card-container">
<jsp:include page="error.jsp"/>
<table class="styled-table">

<tr>
<th>Manager</th>
<th>Leave Type</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
<th>Action</th>
</tr>

<c:forEach var="req" items="${requests}">

<tr>

<td>${req.employee.name}</td>

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

<c:when test="${req.status == 'PENDING'}">

<form action="<c:url value='/admin/approveManagerLeave'/>" method="post" style="display:inline;">
    <input type="hidden" name="leaveId" value="${req.leaveId}">
    <button class="btn-approve">Approve</button>
</form>

<form action="<c:url value='/admin/rejectManagerLeave'/>" method="post" style="display:inline;">
    <input type="hidden" name="leaveId" value="${req.leaveId}">
    <input type="text" name="comment" placeholder="Reason" required>
    <button class="btn-reject">Reject</button>
</form>

</c:when>

<c:otherwise>
    Processed
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