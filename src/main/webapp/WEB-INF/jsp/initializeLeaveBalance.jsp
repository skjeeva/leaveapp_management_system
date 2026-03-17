<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Initialize Leave Balance</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f4f6fb;
        margin: 0;
    }

    .page-title {
        text-align: center;
        margin-top: 40px;
        font-size: 28px;
        color: #333;
    }

    .card-container {
        width: 420px;
        margin: 30px auto;
        background: white;
        padding: 25px;
        border-radius: 16px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .card-container:hover {
        transform: translateY(-4px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.12);
    }

    .form-group {
        margin-bottom: 18px;
    }

    label {
        font-weight: 600;
        display: block;
        margin-bottom: 6px;
        color: #444;
    }

    select,
    input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        transition: 0.2s;
        font-size: 14px;
    }

    select:focus,
    input:focus {
        border-color: #2f60d3;
        outline: none;
        box-shadow: 0 0 5px rgba(47,96,211,0.2);
    }

    .btn-primary {
        width: 100%;
        padding: 12px;
        border-radius: 8px;
        border: none;
        background: linear-gradient(135deg, #2f60d3, #4a7df0);
        color: white;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.25s ease;
        box-shadow: 0 4px 10px rgba(47,96,211,0.2);
    }

    .btn-primary:hover {
        transform: translateY(-2px) scale(1.02);
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
<h2 class="page-title">Initialize Leave Balance</h2>

<div class="card-container">
<jsp:include page="error.jsp"/>


<form action="<c:url value='/admin/initializeLeaveBalance'/>" method="post">

<div class="form-group">

<label>Select Employee</label>

<select name="employeeId">

<c:forEach var="emp" items="${employees}">
    <option value="${emp.userId}">
        ${emp.name}
    </option>
</c:forEach>

</select>

</div>

<div class="form-group">

<label>Year</label>

<input type="number" name="year" value="2026" required>

</div>

<button class="btn-primary" type="submit">
Initialize All Leave Types
</button>

</form>

</div>

<div class="dashboard-links">
    <a href="<c:url value='/admin/dashboard'/>">
        Back to Dashboard
    </a>
</div>

</body>

</html>