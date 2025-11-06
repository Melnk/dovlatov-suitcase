<%--Главная страница--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Сергей Довлатов</title>
    <link rel="stylesheet" href="/static/css/style.css">

    <style>
        .debug-info {
            position: fixed;
            top: 10px;
            right: 10px;
            background: red;
            color: white;
            padding: 10px;
            z-index: 10000;
            font-size: 12px;
        }
    </style>
</head>
<body>

<div class="debug-info">
    Context Path: <%= contextPath %><br>
    Request URI: <%= request.getRequestURI() %>
</div>

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
    <header>
        <h1>Сергей Довлатов</h1>
        <p>Писатель, журналист, мастер короткого рассказа и просто красавчик</p>
    </header>

    <main>
        <div class="content-text">
            <p>Добро пожаловать на сайт, посвященный творчеству Сергея Довлатова.</p>
        </div>
    </main>
</div>

<%@ include file="includes/footer.jsp" %>
<script src="/static/js/script.js"></script>
</body>
</html>
