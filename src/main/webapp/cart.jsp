<%@ page import="ru.dovlatov.suitcase.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
            double sum = p.getPrice().doubleValue() * q;
            total += sum;
    %>
    <div class="cart-item">
        <div class="cart-item-info">
            <span><b><%= p.getName() %></b></span><br>
            <span>Цена: <%= p.getPrice() %> $</span><br>
        </div>

        <form action="cart" method="post" style="display:inline;">
            <input type="hidden" name="productId" value="<%= p.getId() %>">
            <input type="hidden" name="action" value="update">
            <input type="number" name="quantity" value="<%= q %>" min="1" style="width:60px;">
            <button type="submit">Обновить</button>
        </form>

        <form action="cart" method="post" style="display:inline;">
            <input type="hidden" name="productId" value="<%= p.getId() %>">
            <input type="hidden" name="action" value="remove">
            <button type="submit" class="remove-btn">Удалить</button>
        </form>

        <div>Сумма: <b><%= String.format("%.2f", sum) %> $</b></div>
    </div>
    <hr>
    <%
        }
    %>
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
