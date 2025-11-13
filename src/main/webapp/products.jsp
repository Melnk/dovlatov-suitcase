<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ru.dovlatov.suitcase.model.Product" %>
<%@ page import="ru.dovlatov.suitcase.model.PickupPoint" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <link rel="icon" type="image/x-icon" href="static/images/favicon.png">
    <meta charset="UTF-8">
    <title>Товары - Сергей Довлатов</title>
    <link rel="stylesheet" href="static/css/style.css">
    <style>
        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .product {
            width: 300px;
            min-height: 500px;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            display: flex;
            flex-direction: column;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .product img {
            width: 150px;
            height: auto;
            margin: 0 auto 15px;
            display: block;
        }

        .product h3 {
            margin: 10px 0;
            min-height: 40px;
            display: flex;
            align-items: center;
        }

        .product p {
            margin: 8px 0;
            flex-grow: 1;
        }

        .product ul {
            margin: 5px 0;
            padding-left: 15px;
        }

        .product form {
            margin-top: auto;
        }

        .pickup-points {
            max-height: 120px;
            overflow: hidden;
        }

        .more-points {
            color: #666;
            font-style: italic;
            margin-top: 5px;
        }
    </style>
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
        <li><a href="index">Главная</a></li>
        <li><a href="biography">Биография</a></li>
        <li><a href="gallery">Галерея</a></li>
        <li><a href="products">Товары</a></li>
        <li><a href="cart">Корзина</a></li>
        <li><a href="logout">Выйти</a></li>
    </ul>
    <button class="close-btn">×</button>
</nav>

<div class="container">
    <h2>Книги Сергея Довлатова</h2>

    <%
        List<Product> products = (List<Product>) request.getAttribute("products");

        if (products != null) {
    %>

    <div class="product-list">
        <%
            for (Product product : products) {
                List<PickupPoint> pickupPoints = product.getPickupPoints();
                int totalPoints = pickupPoints != null ? pickupPoints.size() : 0;
                int showPoints = Math.min(totalPoints, 3);
                int remainingPoints = Math.max(0, totalPoints - 3);
        %>
        <div class="product">
            <% if (product.getImageUrl() != null && !product.getImageUrl().isEmpty()) { %>
            <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
            <% } %>
            <h3><%= product.getName() %></h3>
            <p><%= product.getDescription() %></p>

            <div class="pickup-points">
                <% if (pickupPoints != null && !pickupPoints.isEmpty()) { %>
                <p><b>Доступно в ПВЗ:</b></p>
                <ul>
                    <% for (int i = 0; i < showPoints; i++) {
                        PickupPoint point = pickupPoints.get(i);
                    %>
                    <li><%= point.getCity() %>, <%= point.getAddress() %></li>
                    <% } %>
                </ul>
                <% if (remainingPoints > 0) { %>
                <p class="more-points">и другие (<%= remainingPoints %>)</p>
                <% } %>
                <% } else { %>
                <p><i>Нет доступных пунктов выдачи</i></p>
                <% } %>
            </div>

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
