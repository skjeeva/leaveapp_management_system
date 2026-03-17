<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<title>Login</title>

<style>
    body{
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #eef2f7, #dbeafe);
    margin:0;
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;
    height:100vh;
}

.app-title{
    font-size:34px;
    font-weight:700;
    margin-bottom:40px;  
    background: linear-gradient(135deg, #3868d6, #4a7df0);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    
}

.card{
    background:white;
    padding:35px;
    border-radius:16px;
    box-shadow:0 8px 25px rgba(0,0,0,0.1);
    width:340px;
    text-align:center;
    transition:0.25s ease;
}

.card:hover{
    transform:translateY(-4px);
}

input{
    width:90%;
    padding:12px;
    margin:10px 0;
    border-radius:8px;
    border:1px solid #ccc;
    transition:0.2s ease;
}

input:focus{
    border-color:#2f60d3;
    outline:none;
    box-shadow:0 0 6px rgba(47,96,211,0.3);
}

button{
    width:100%;
    padding:12px;
    margin-top:10px;
    border:none;
    background: linear-gradient(135deg, #2f60d3, #4a7df0);
    color:white;
    border-radius:8px;
    cursor:pointer;
    transition:0.25s ease;
}

button:hover{
    transform:translateY(-2px);
    box-shadow:0 6px 18px rgba(47,96,211,0.3);
}
</style>

</head>

<body>
<jsp:include page="error.jsp"/>

<h1 class="app-title">Leave Management Application</h1>

        <div class="card">
            <h2>Login</h2>


<form action="<c:url value='/login'/>" method="post">

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Password" required>

<button type="submit">Login</button>

</form>

</div>

</body>

</html>