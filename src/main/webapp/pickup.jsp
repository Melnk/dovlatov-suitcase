<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
  <link rel="icon" type="image/x-icon" href="static/images/favicon.png">
  <meta charset="UTF-8">
  <title>Пункты выдачи</title>
  <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
<div class="container">
  <h2>Пункты выдачи заказов</h2>
  <ul>
    <c:forEach var="p" items="${pickupPoints}">
      <li>${p.city}, ${p.address}</li>
    </c:forEach>
  </ul>
</div>
</body>
</html>
