package ru.dovlatov.suitcase.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import ru.dovlatov.suitcase.dao.UserDao;
import ru.dovlatov.suitcase.model.User;
import ru.dovlatov.suitcase.util.PasswordUtils;

@WebListener
public class AppStartupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        UserDao userDao = new UserDao();
        String adminEmail = "admin@dovlatov.com";
        String adminPassword = "dovlatov";

        userDao.findByEmail(adminEmail).ifPresentOrElse(
            u -> System.out.println("Админ уже существует."),
            () -> {
                String hash = PasswordUtils.hashPassword(adminPassword);
                User admin = new User(adminEmail, hash, "admin");
                userDao.save(admin);
                System.out.println("Админ создан");
            });
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {}

}
