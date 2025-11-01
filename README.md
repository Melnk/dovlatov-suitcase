# Dovlatov Suitcase
Учебный веб-проект на Java(Servlets + JSP/Freemarker) с авторизацией, CRUD, AJAX и хранением данных в PostgreSQL. Построен по MVC-архитектуре и развернут на Tomcat.

## Технологии:
- Java Servlets / JSP / Freemarker
- JDBC + PostgreSQL
- Tomcat 10
- Maven
- MVC architecture
- AJAX + JS
- WebFilter, WebListener
- BCrypt

## Основные сущности
- **User** - пользователь с ролями
- **Product** - товар с описанием и иозображением
- **PickupPoint** - пункт выдачи заказов (связь M2M с товарми)

## Функционал
- Регистрация и авторизация
- Валидация пароля на сложность
- Добавление / удаление / редактирование товара
- Корзина с AJAX-добавлением
- Просмотр заказов
- Сохранение выбранной темы
- Защита от повторной отправки форм
- Валидация данных на сервере
- Галерея изображений

## Развертывание
1. Установи **Apache Tomcat 10**
2. Настрой конфигурацию в **Intellij IDEA** ('Run -> Edit Configurations -> Tomcat Server')
3. Подними локальную PostgreSQL базу и укажи параметры в Util-классе
4. Запусти сервер и перейди по адресу 'http://localhost:8080/'
