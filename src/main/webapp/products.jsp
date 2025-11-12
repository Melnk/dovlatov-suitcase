<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ru.dovlatov.suitcase.model.Product" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <link rel="icon" type="image/x-icon" href="static/images/favicon.png">
    <meta charset="UTF-8">
    <title>Товары - Сергей Довлатов</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>

<div class="top-controls">
    <button id="menuToggle" class="menu-toggle">☰ Меню</button>
</div>

<%
    String successMessage = (String) session.getAttribute("successMessage");
    if (successMessage != null) {
        session.removeAttribute("successMessage");
%>
<div class="success-message">
    <%= successMessage %>
    <a href="cart" class="view-cart-link">Перейти в корзину</a>
</div>
<% } %>
<nav id="mainNav" class="nav-sidebar">
    <ul>
        <li><a href="index.jsp">Главная</a></li>
        <li><a href="biography">Биография</a></li>
        <li><a href="gallery">Галерея</a></li>
        <li><a href="products.jsp">Товары</a></li>
        <li><a href="cart">Корзина</a></li>
        <li><a href="logout">Выйти</a></li>
    </ul>
    <button class="close-btn">×</button>
</nav>

<div class="container">
    <h2>Книги Сергея Довлатова</h2>

    <%
        // Получаем продукты из request
        List<Product> products = (List<Product>) request.getAttribute("products");

        if (products != null) {
    %>
    <!-- Отладочная информация
    <div style="background: #f8f9fa; padding: 15px; margin: 20px 0; border-radius: 5px;">
        <h4>Общая информация:</h4>
        <p>Количество товаров: <strong><%= products.size() %></strong></p>
        <p>Кодировка страницы: <strong>UTF-8</strong></p>
        <p>Запрошенный URL: <strong><%= request.getRequestURL() %></strong></p>
    </div>-->

    <div class="product-list">
        <%
            for (Product product : products) {
        %>
        <div class="product">
            <% if (product.getImageUrl() != null && !product.getImageUrl().isEmpty()) { %>
            <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" style="width:150px;height:auto;">
            <% } %>
            <h3><%= product.getName() %></h3>
            <p><%= product.getDescription() %></p>
            <p><b><%= product.getPrice() %> $</b></p>
            <form action="cart" method="post">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <button type="submit">В корзину</button>
            </form>
        </div>
        <%
            }
        %>
    </div>
    <%
    } else {
    %>
    <div style="text-align: center; padding: 40px;">
        <h3>Товары временно отсутствуют</h3>
        <p>Попробуйте позже или свяжитесь с администратором</p>
        <p style="color: red;">DEBUG: products = null</p>
    </div>
    <%
        }
    %>
</div>

<%@ include file="includes/footer.jsp" %>
<script src="static/js/script.js"></script>
</body>
</html>
