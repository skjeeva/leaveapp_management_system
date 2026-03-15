<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>
<title>Error</title>

<style>

    body{
        font-family: Arial, sans-serif;
        background:#eef2f7;
        display:flex;
        justify-content:center;
        align-items:center;
        height:100vh;
    }

    /* error card */

    .error-card{
        background:white;
        padding:35px;
        border-radius:12px;
        box-shadow:0 4px 20px rgba(0,0,0,0.1);
        text-align:center;
        width:350px;
    }

    /* title */

    .error-title{
        color:#dc3545;
        margin-bottom:15px;
    }

    /* message */

    .error-message{
        color:#333;
        margin-bottom:20px;
    }

    /* button */

    .back-btn{
        display:inline-block;
        padding:10px 16px;
        background:#2f60d3;
        color:white;
        text-decoration:none;
        border-radius:6px;
    }

    .back-btn:hover{
        background:#254db3;
    }

</style>

</head>

<body>

<div class="error-card">

<h2 class="error-title">Oops!</h2>

<p class="error-message">${errorMessage}</p>

<a class="back-btn" href="javascript:history.back()">Go Back</a>

</div>

</body>

</html>