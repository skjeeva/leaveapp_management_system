<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Manage Employees</title>

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
        width:55%;
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
        margin-bottom:18px;
    }

    label{
        font-weight:600;
        color:#444;
    }

    input, select{
        width:100%;
        padding:10px;
        margin-top:6px;
        border:1px solid #ccc;
        border-radius:8px;
        transition:0.2s ease;
    }

    input:focus, select:focus{
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

    .btn-update{
        background: linear-gradient(135deg, #28a745, #34d058);
        color:white;
        padding:6px 12px;
        border:none;
        border-radius:6px;
        cursor:pointer;
        transition:0.2s ease;
    }

    .btn-update:hover{
        transform:scale(1.05);
        box-shadow:0 4px 10px rgba(40,167,69,0.3);
    }

    .btn-delete{
        background: linear-gradient(135deg, #dc3545, #ff6b6b);
        color:white;
        padding:6px 12px;
        border:none;
        border-radius:6px;
        cursor:pointer;
        transition:0.2s ease;
    }

    .btn-delete:hover{
        transform:scale(1.05);
        box-shadow:0 4px 10px rgba(40,167,69,0.3);
    }

    .styled-table{
        width:100%;
        border-collapse:collapse;
        margin-top:20px;
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

<h2 class="page-title">Manage Employees</h2>

<div class="card-container">
<jsp:include page="error.jsp"/>
<h3>Add Employee</h3>

<form action="<c:url value='/admin/addEmployee'/>" method="post">

<div class="form-group">
<label>Name</label>
<input type="text" name="name" required>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" required>
</div>

<div class="form-group">
<label>Role</label>

<select name="roleId" required>
    <option value="">-- Select Role --</option>
    <option value="3">Employee</option>
    <option value="2">Manager</option>
</select>

</div>

<button class="btn-primary" type="submit">Add Employee</button>

</form>

<hr>

<h3>Employee List</h3>

<table class="styled-table">

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Role</th>
<th>Actions</th>
</tr>

<c:forEach var="emp" items="${employees}">

<tr>

<form action="<c:url value='/admin/updateEmployee'/>" method="post">

<td>
${emp.userId}
<input type="hidden" name="userId" value="${emp.userId}">
</td>

<td>
<input type="text" name="name" value="${emp.name}" required>
</td>

<td>
<input type="email" name="email" value="${emp.email}" required>
</td>

<td>
<select name="roleId">

<c:forEach var="role" items="${roles}">
    <option value="${role.roleId}"
        <c:if test="${role.roleId == emp.role.roleId}">selected</c:if>>
        ${role.roleName}
    </option>
</c:forEach>

</select>
</td>

<td>

<button class="btn-update" type="submit">
Update
</button>

<button class="btn-delete"
href="<c:url value='/admin/deleteEmployee?id=${emp.userId}'/>"
onclick="return confirm('Delete this employee?');">
Delete
</button>

</td>

</form>

</tr>

</c:forEach>

</table>

</div>

<div class="dashboard-links">
<a href="<c:url value='/admin/dashboard'/>">Back to Dashboard</a>
</div>

</body>

</html>