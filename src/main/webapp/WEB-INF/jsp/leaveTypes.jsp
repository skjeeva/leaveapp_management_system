<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Leave Types</title>

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
        width:650px;
        margin:40px auto;
        background:white;
        padding:35px;
        border-radius:16px;
        box-shadow:0 6px 25px rgba(0,0,0,0.08);
        transition:0.25s ease;
    }

    .card-container:hover{
        transform:translateY(-3px);
    }

    .form-group{
        margin-bottom:20px;
    }

    label{
        font-weight:600;
        color:#444;
    }

    input{
        width:100%;
        padding:10px;
        margin-top:6px;
        border:1px solid #ccc;
        border-radius:8px;
        transition:0.2s ease;
    }

    input:focus{
        border-color:#2f60d3;
        outline:none;
        box-shadow:0 0 6px rgba(47,96,211,0.3);
    }

    .btn-primary{
        width:100%;
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

    .styled-table{
        width:100%;
        border-collapse:collapse;
        margin-top:20px;
    }

    .styled-table th{
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color:white;
        padding:12px;
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

<h2 class="page-title">Leave Types</h2>

<div class="card-container">
<jsp:include page="error.jsp"/>
<h3>Add Leave Type</h3>

<form action="<c:url value='/admin/addLeaveType'/>" method="post">

<div class="form-group">
<label>Leave Name</label>
<input type="text" name="leaveTypeName" required>
</div>

<div class="form-group">
<label>Max Days Per Year</label>
<input type="number" name="maxDaysPerYear" required>
</div>

<button class="btn-primary" type="submit">
Add Leave Type
</button>

</form>

<hr>

<h3>Existing Leave Types</h3>

<table class="styled-table">

<tr>
<th>ID</th>
<th>Leave Type</th>
<th>Max Days</th>
</tr>

<c:forEach var="t" items="${leaveTypes}">

<tr>

<td>${t.leaveTypeId}</td>

<td>${t.leaveTypeName}</td>

<td>${t.maxDaysPerYear}</td>

</tr>

</c:forEach>

</table>

</div>

<div class="dashboard-links">
<a href="<c:url value='/admin/dashboard'/>">Back to Dashboard</a>
</div>

</body>

</html>