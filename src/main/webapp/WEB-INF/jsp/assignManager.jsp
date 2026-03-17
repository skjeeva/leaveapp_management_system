<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Assign Manager</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #eef2f7, #dbeafe);
        margin: 0;
        position: relative;
    }
    .page-title {
        text-align: center;
        margin-top: 40px;
        color: #333;
    }
    .card-container {
        width: 40%;
        margin: 50px auto;
        background: white;
        padding: 35px;
        border-radius: 16px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        transition: 0.25s ease;
    }

    .card-container:hover {
        transform: translateY(-4px);
    }

    .form-group {
        margin-bottom: 25px;
    }
    .form-group h3 {
        margin-bottom: 8px;
        color: #444;
        font-size: 16px;
    }
    select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background: #f9fafc;
        transition: 0.2s ease;
        cursor: pointer;
    }

    select:focus {
        border-color: #2f60d3;
        outline: none;
        box-shadow: 0 0 6px rgba(47,96,211,0.3);
    }

    .btn-primary {
        width: 100%;
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color: white;
        border: none;
        padding: 12px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 15px;
        transition: all 0.25s ease;
        margin-top: 10px;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 18px rgba(47,96,211,0.3);
    }

    .btn-primary:active {
        transform: scale(0.97);
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

</style>

</head>

<body>


<h2 class="page-title">Assign Manager</h2>
<jsp:include page="error.jsp"/>
<div class="card-container">

<form action="<c:url value='/admin/assignManager'/>" method="post">

<div class="form-group">

<h3>Select Employee</h3>

<select name="employeeId">

<c:forEach var="emp" items="${employees}">
    <option value="${emp.userId}">
        ${emp.name}
    </option>
</c:forEach>

</select>

</div>


<div class="form-group">

<h3>Select Manager</h3>

<select name="managerId">

<c:forEach var="mgr" items="${managers}">
    <option value="${mgr.userId}">
        ${mgr.name}
    </option>
</c:forEach>

</select>

</div>

<button class="btn-primary" type="submit">
Assign Manager
</button>

</form>

</div>

<div class="dashboard-links">
<a href="<c:url value='/admin/dashboard'/>">Back to Dashboard</a>
</div>

</body>

</html>