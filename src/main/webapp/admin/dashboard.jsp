<%@ page import="ru.dovlatov.suitcase.model.Product" %>
<%@ page import="java.util.List" %><%--
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
    <link rel="stylesheet" href="/static/css/admin.css">
  </head>
  <body>

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
    <input type="text" name="name" placeholder="Название" required><br>
    <textarea name="description" placeHolder="Описание" required></textarea><br>
    <input type="number" step="0.01" name="price" placeholder="Цена" required><br>
    <input type="text" name="imageUrl" placeholder="URL изображение" required><br>
    <button type="submit">Добавить</button>
  </form>

  <hr>

  <h2>Список товаров</h2>

  <%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products == null || products.isEmpty()) {
  %>
  <p>Нет товара.</p>
  <% } else { %>
  <table border="1" cellpadding="8" cellspacing="0">
    <tr><th>ID</th><th>Название</th><th>Цена</th><th>Описание</th><th>Картинка</th></tr>
    <%
      for (Product p : products) {
    %>
    <tr>
      <td><%= p.getId()%></td>
      <td><%= p.getName()%></td>
      <td><%= p.getPrice()%></td>
      <td><%= p.getDescription()%></td>
      <td>
        <% if (p.getImageUrl() != null && !p.getImageUrl().isEmpty()) { %>
        <img src="${pageContext.request.contextPath}/<%= p.getImageUrl() %>" width="80" height="80" alt="<%= p.getName() %>">
        <% } %>
        <p><%=p.getImageUrl()%></p>
      </td>
    </tr>
    <%
      }
    %>
  </table>
  <%
    }
  %>

  </form>


  <script src="static/js/script.js"></script>
  </body>
</html>
