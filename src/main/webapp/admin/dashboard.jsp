<%--
  Created by IntelliJ IDEA.
  User: melni
  Date: 06.11.2025
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
  <head>
    <meta charset="UTF-8">
    <title>Админ-панель</title>
    <link rel="stylesheet" href="/static/css/style.css">
  </head>
  <body>

  <nav id="mainNav" class="nav-sidebar">
    <ul>
      <li><a href="index.jsp">Главная</a></li>
      <li><a href="biography.jsp">Биография</a></li>
      <li><a href="gallery.jsp">Галерея</a></li>
      <li><a href="products">Товары</a></li>
      <li><a href="cart">Корзина</a></li>
      <li><a href="logout">Выйти</a></li>
    </ul>
    <button class="close-btn">×</button>
  </nav>

  <div class="container">
    <h1>Админ-панель</h1>

    <div class="stats">
      <p><b>Количество товаров:</b><%= request.getAttribute("productCount")%></p>
      <p><b>Количество заказов:</b><%= request.getAttribute("orderCount")%></p>
    </div>

    <hr>
  </div>

  <h2>Добавить товар</h2>
  <form method="post" action="dashboard">
    
  </form>


  <script src="static/js/script.js"></script>
  </body>
</html>
