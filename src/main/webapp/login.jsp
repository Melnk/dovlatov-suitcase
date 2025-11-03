<%--
  Created by IntelliJ IDEA.
  User: melni
  Date: 03.11.2025
  Time: 0:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Вход</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Вход в аккаунт</h2>
    <% String error = request.getParameter("error"); %>
    <% if ("notfound".equals(error)) { %>
    <p style="color:red;">Пользователь не найден</p>
    <% } else if ("wrongpass".equals(error)) { %>
    <p style="color:red;">Неверный пароль</p>
    <% } %>

    <form action="login" method="post">
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Пароль" required><br>
        <button type="submit">Войти</button>
    </form>

</body>
</html>
