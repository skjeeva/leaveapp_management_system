<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

<title>Login</title>

<style>

    body{
    font-family:Arial;
    background:#eef2f7;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    }

    .card{
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.2);
    width:320px;
    text-align:center;
    }

    h2{
    margin-bottom:20px;
    }

    input{
    width:100%;
    padding:10px;
    margin:8px 0;
    border-radius:6px;
    border:1px solid #ccc;
    }

    button{
    width:100%;
    padding:10px;
    border:none;
    background:#2563eb;
    color:white;
    font-size:16px;
    border-radius:6px;
    cursor:pointer;
    }

    button:hover{
    background:#1e4ed8;
    }

    .error{
    color:red;
    margin-bottom:10px;
    }

</style>

</head>

<body>

<div class="card">

<h2>Login</h2>

<%
String error = request.getParameter("error");

if(error != null){
%>

<div class="error">
Invalid Email or Password
</div>

<%
}
%>

<form action="/login" method="post">

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Password" required>

<button type="submit">Login</button>

</form>

</div>

</body>

</html>