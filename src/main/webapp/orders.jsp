<%@ page import="ru.dovlatov.suitcase.model.OrderView" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: melni
  Date: 06.11.2025
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="static/images/favicon.png">
    <meta charset="UTF-8">
    <title>Мои заказы</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>

<div class="conatiner">
    <nav id="mainNav" class="nav-sidebar">
        <ul>
            <li><a href="index.jsp">Главная</a></li>
            <li><a href="biography">Биография</a></li>
            <li><a href="gallery">Галерея</a></li>
            <li><a href="products">Товары</a></li>
            <li><a href="cart">Корзина</a></li>
            <li><a href="logout">Выйти</a></li>
        </ul>
        <button class="close-btn">×</button>
    </nav>
    <div class="order-history-container">
    <h2>Мои заказы</h2>

        <%
            List<OrderView> orders = (List<OrderView>) request.getAttribute("orders");
            if (orders == null || orders.isEmpty()) {
        %>
        <p>У вас пока нет заказов.</p>
        <%
        } else {
            int currentOrder = -1;
            double total = 0;
            for (OrderView o : orders) {
                if (o.getOrderId() != currentOrder) {
                    if (currentOrder != -1) {
        %>
        </table>
        <p><b>Итого:</b> <%= String.format("%.2f", total) %> $</p>
        <hr>
        <%
            }
            currentOrder = o.getOrderId();
            total = 0;
        %>
        <h3>Заказ №<%= o.getOrderId() %> - <%= o.getCreatedAt() %></h3>
        <table border="1" cellPadding="8" cellspacing="0">
            <tr><th>Товар</th><th>Кол-во</th><th>Цена</th><th>Сумма</th></tr>
            <%
                }
                double sum = o.getPrice().doubleValue() * o.getQuantity();
                total += sum;
            %>
            <tr>
                <td><%= o.getProductName() %></td>
                <td><%= o.getQuantity() %></td>
                <td><%= o.getPrice() %> $</td>
                <td><%= String.format("%.2f", sum) %> $</td>
            </tr>
            <%
                }
            %>
        </table>
        <p><b>Итого:</b> <%= String.format("%.2f", total) %> $</p>
        <%
            }
        %>
        <a href="cart" class="link-orders">Назад</a>
    </div>
</div>

</body>
</html>
