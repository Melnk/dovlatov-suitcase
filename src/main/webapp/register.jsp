<%--
  Created by IntelliJ IDEA.
  User: melni
  Date: 03.11.2025
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="static/images/favicon.png">
    <meta charset="UTF-8">
    <title>Регистрация</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
<h2>Регистрация</h2>

<% String error = request.getParameter("error"); %>
<% if ("invalid".equals(error)) { %>
<p style="color:red;">Некорректный email или пароль</p>
<% } else if ("exists".equals(error)) { %>
<p style="color:red;">Email уже зарегистрирован</p>
<% } %>

<form action="register" method="post">
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="password" placeholder="Пароль" required><br>
    <button type="submit">Зарегистрироваться</button>
</form>

<br>
<form action="login" method="get">
    <button type="submit" class="back-btn">← Назад</button>
</form>
</body>
</html>
