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
- Добавление товаров в корзину
- Изменение количества и удаление товаров из корзины
- Оформление заказов
- Просмотр истории заказов

## Развертывание
1. Установи **Apache Tomcat 10**
2. Настрой конфигурацию в **Intellij IDEA** ('Run -> Edit Configurations -> Tomcat Server')
3. Подними локальную PostgreSQL базу и укажи параметры в Util-классе
4. Запусти сервер и перейди по адресу 'http://localhost:8080/'

## Скриншоты

### Аутентификация
<img width="1920" height="1000" alt="image" src="https://github.com/user-attachments/assets/297a7cc5-5939-4a53-bbf6-6554b26e5e64" />

### Главное меню
<img width="1918" height="1002" alt="image" src="https://github.com/user-attachments/assets/7d1778a4-551e-4a24-b1c8-ae9c8142ffe8" />

### Биография
<img width="1920" height="1000" alt="image" src="https://github.com/user-attachments/assets/c480e4b2-f4e2-44c7-b612-ece017b8deb8" />

### Галерея
<img width="1920" height="1000" alt="image" src="https://github.com/user-attachments/assets/4c5cd83d-74b7-467b-8801-93f2a36a6fc5" />

<img width="1917" height="999" alt="image" src="https://github.com/user-attachments/assets/664cc1ce-a606-44be-95ee-10a0044bc74f" />

### Товары
<img width="1917" height="1002" alt="image" src="https://github.com/user-attachments/assets/91e81259-8032-40df-933b-f870c6bd15de" />

### Корзина
<img width="1918" height="995" alt="image" src="https://github.com/user-attachments/assets/a8acc681-9eb4-4d20-9cec-9dc89851588d" />

### История заказов
<img width="1918" height="995" alt="image" src="https://github.com/user-attachments/assets/ecfb6b60-976d-443c-a17f-bdbeff06d14a" />

### Админ-панель
<img width="1920" height="997" alt="image" src="https://github.com/user-attachments/assets/6929152e-338e-498e-a0bc-dfdb778325ae" />


