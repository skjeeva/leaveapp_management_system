<%@ page import="java.util.List" %>
<%@ page import="com.example.leaveapp.entity.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
<title>Manage Employees</title>

<style>

    body{
    font-family:"Segoe UI",Arial;
    background:#eef2f7;
    margin:0;
    }

    .container{
    width:85%;
    margin:auto;
    margin-top:40px;
    }

    h2{
    text-align:center;
    margin-bottom:30px;
    color:#333;
    }

    .card{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
    margin-bottom:25px;
    }

    .card h3{
    margin-top:0;
    text-align:center;
    }

    form{
    display:flex;
    flex-direction:column;
    }

    input,select{
    padding:10px;
    margin:8px 0;
    border-radius:6px;
    border:1px solid #ccc;
    }

    button{
    margin-top:10px;
    padding:10px;
    border:none;
    border-radius:6px;
    background:#2563eb;
    color:white;
    font-size:15px;
    cursor:pointer;
    }

    button:hover{
    background:#1e4ed8;
    }

    .table-card{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
    }

    table{
    width:100%;
    border-collapse:collapse;
    }

    th{
    background:#2563eb;
    color:white;
    padding:12px;
    }

    td{
    padding:10px;
    border-bottom:1px solid #ddd;
    text-align:center;
    }

    tr:hover{
    background:#f2f6ff;
    }

    .top-section{
    display:flex;
    gap:20px;
    }

    .filter{
    flex:1;
    }

    .add{
    flex:1;
    }

    .back{
    text-align:center;
    margin-top:25px;
    }

</style>

</head>

<body>

<div class="container">

<h2>Manage Employees</h2>

<div class="top-section">

<div class="card filter">

<form action="/admin/employeesByDepartment" method="get">

    <select name="department">
        <option value="">All Departments</option>
        <option value="IT">IT</option>
        <option value="HR">HR</option>
        <option value="Finance">Finance</option>
    </select>

    <button type="submit">Select Department</button>
</form>

</div>

<div class="card add">

<h3>Add Employee</h3>

<form action="/admin/addEmployee" method="post">

<input type="text" name="name" placeholder="Employee Name" required>

<input type="email" name="email" placeholder="Email Address" required>

<select name="department">
<option value="IT">IT</option>
<option value="HR">HR</option>
<option value="Finance">Finance</option>
</select>

<input type="date" name="dateOfJoining" required>

<button type="submit">Add Employee</button>

</form>

</div>

</div>

<div class="table-card">

<h3 style="text-align:center;">Employee List</h3>
<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Department</th>
<th>Date Of Joining</th>
<th>Action</th>
</tr>

<%
List<Employee> employees = (List<Employee>) request.getAttribute("employees");

int count = 1;

if(employees != null){
for(Employee emp : employees){
%>

<tr>

<form action="/admin/updateEmployee" method="post">

<td>
<input type="hidden" name="id" value="<%= emp.getId() %>">
<%= count++ %>
</td>

<td>
<input type="text" name="name" value="<%= emp.getName() %>">
</td>

<td>
<input type="email" name="email" value="<%= emp.getEmail() %>">
</td>

<td>
<select name="department">
<option value="IT" <%= emp.getDepartment().equals("IT") ? "selected" : "" %>>IT</option>
<option value="HR" <%= emp.getDepartment().equals("HR") ? "selected" : "" %>>HR</option>
<option value="Finance" <%= emp.getDepartment().equals("Finance") ? "selected" : "" %>>Finance</option>
</select>
</td>

<td>
<input type="date" name="dateOfJoining" value="<%= emp.getDateOfJoining() %>">
</td>

<td>

<button type="submit">Update</button>

<a href="/admin/deleteEmployee?id=<%= emp.getId() %>"
onclick="return confirm('Delete this employee?')">
Delete
</a>

</td>

</form>

</tr>

<%
}
}
%>

</table>
</div>

<div class="back">
<a href="/admin/dashboard">⬅ Back to Dashboard</a>
</div>

<br><br><br>
</div>

</body>
</html>