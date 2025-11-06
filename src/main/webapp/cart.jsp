<%@ page import="ru.dovlatov.suitcase.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: melni
  Date: 03.11.2025
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Корзина</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
<div class="top-controls">
    <button id="menuToggle" class="menu-toggle">☰ Меню</button>
</div>

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
    <h2>Корзина</h2>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        Map<Integer, Integer> quantities = (Map<Integer, Integer>) request.getAttribute("quantities");
        if (products == null || products.isEmpty()) {
    %>
    <p>Ваша корзина пуста.</p>
    <%
    } else {
        double total = 0.0;
        for (Product p : products) {
            int q = quantities.getOrDefault(p.getId(), 1);
            total += p.getPrice().doubleValue() * q;
    %>
    <div class="cart-item">
        <span><%= p.getName() %></span>
        <span>Количество: <%= q %></span>
        <span>Цена: <%= p.getPrice() %> $</span>
    </div>
    <%
        }
    %>
    <hr>
    <h3>Итого: <%= String.format("%.2f", total) %> $</h3>
    <form action="order" method="post">
        <button type="submit">Оформить заказ</button>
    </form>
    <%
        }
    %>
    <a href="orders" class="link-orders">Перейти к моим заказам</a>
</div>


<script src="static/js/script.js"></script>
</body>
</html>
