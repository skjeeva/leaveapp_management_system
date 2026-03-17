<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Manager Apply Leave</title>

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
        width:420px;
        margin:50px auto;
        background:white;
        padding:35px;
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
    }

    .leave-form label{
        font-weight:600;
        color:#444;
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
        margin-top:10px;
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color:white;
        border:none;
        padding:12px;
        border-radius:8px;
        cursor:pointer;
        transition:0.25s ease;
    }

    .btn-primary:hover{
        transform:translateY(-2px);
        box-shadow:0 6px 18px rgba(47,96,211,0.3);
    }

    .btn-primary:active{
        transform:scale(0.97);
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


<h2 class="page-title">Apply Leave (Manager)</h2>

<div class="card-container">
<jsp:include page="error.jsp"/>
<form class="leave-form" action="<c:url value='/manager/applyLeave'/>" method="post">

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
<input type="text" name="reason" required>

<button class="btn-primary" type="submit">
Apply Leave
</button>

</form>

</div>

<div class="dashboard-links">
<a href="<c:url value='/manager/dashboard'/>">Back to Dashboard</a>
</div>

</body>
</html>