<%--Главная страница--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Сергей Довлатов</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>

<div class="top-controls">
    <button id="menuToggle" class="menu-toggle">☰ Меню</button>
</div>

<nav id="mainNav" class="nav-sidebar">
    <ul>
        <li><a href="index.html">Главная</a></li>
        <li><a href="biography.jsp">Биография</a></li>
        <li><a href="gallery.jsp">Галерея</a></li>
        <li><a href="products">Товары</a></li>
        <li><a href="cart.jsp">Корзина</a></li>
        <li><a href="logout">Выйти</a></li>
    </ul>
    <button class="close-btn">×</button>
</nav>


<div class="container">
    <div class="content">
        <h1>Сайт о Сергее Довлатове</h1>
        <p>Писатель, наблюдатель, гений, ироничный литописец советской жизни и просто красавчик</p>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

<script src="script.js"></script>
</body>
</html>
