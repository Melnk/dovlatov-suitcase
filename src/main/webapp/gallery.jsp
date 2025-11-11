<%--
  Created by IntelliJ IDEA.
  User: melni
  Date: 03.11.2025
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Галерея</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>

<body>
<div class="top-controls">
    <button id="menuToggle" class="menu-toggle">☰ Меню</button>
</div>

<nav id="mainNav" class="nav-sidebar">
    <ul>
        <li><a href="index.jsp">Главная</a></li>
        <li><a href="biography">Биография</a></li>
        <li><a href="gallery.jsp">Галерея</a></li>
        <li><a href="products">Товары</a></li>
        <li><a href="cart">Корзина</a></li>
        <li><a href="logout">Выйти</a></li>
    </ul>
    <button class="close-btn">×</button>
</nav>

<div class="container">
    <header>
        <h1>Галерея наслаждения</h1>
    </header>

    <main>
        <div class="gallery-container">
            <img src="static/images/галерея1.jpg" alt="Довлатов">
            <img src="static/images/галерея2.jpg" alt="Довлатов">
            <img src="static/images/галерея3.jpg" alt="Довлатов">
            <img src="static/images/галерея4.jpg" alt="Довлатов">
            <img src="static/images/галерея5.jpg" alt="Довлатов">
            <img src="static/images/галерея6.jpg" alt="Довлатов">
            <img src="static/images/галерея7.jpg" alt="Довлатов">
            <img src="static/images/галерея8.jpg" alt="Довлатов">
            <img src="static/images/галерея9.jpg" alt="Довлатов">
            <img src="static/images/галерея10.jpg" alt="Довлатов">
            <img src="static/images/галерея11.jpg" alt="Довлатов">
            <img src="static/images/галерея12.jpg" alt="Довлатов">
            <img src="static/images/галерея13.jpg" alt="Довлатов">
            <img src="static/images/галерея14.jpg" alt="Довлатов">
        </div>
    </main>
</div>

<script src="static/js/gallery.js"></script>
</body>
</html>
