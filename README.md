# Dovlatov Suitcase
Веб-приложение о Сергее Довлатове - писатель, наблюдатель и ироничный гений советской жизни.
Проект создан как учебная семестровая работа по сервлетам (Java EE) с использованием **Apache Tomcat**, **PostgreSQL**, **JSP**, **MVC**, **AJAX**, **JDBC** и **Maven**.

## Технологии:
- Java 21
- JSP / JSTL
- Servlet API
- HTML + CSS + JS
- JDBC + PostgreSQL
- Apache Tomcat 10
- Maven
- MVC architecture
- AJAX + JS
- WebFilter, WebListener
- BCrypt

## Функционал

### Пользовательская часть
- Регистрация и авторизация (в том числе роль **admin**)
- Валидация данных на клиенте и сервере
- Хэширование паролей через **BCrypt**
- Просмотр товаров (книги Довлатова)

## Развертывание
1. Установи **Apache Tomcat 10**
2. Настрой конфигурацию в **Intellij IDEA** ('Run -> Edit Configurations -> Tomcat Server')
3. Подними локальную PostgreSQL базу и укажи параметры в Util-классе
4. Запусти сервер и перейди по адресу 'http://localhost:8080/'
