package ru.dovlatov.suitcase.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.dovlatov.suitcase.dao.UserDao;
import ru.dovlatov.suitcase.model.User;
import ru.dovlatov.suitcase.util.PasswordUtils;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    UserDao userDao = new UserDao();
    private static final Pattern EMAIL_PATTERN =
        Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (!isValidEmail(email) || !isValidPassword(password)) {
            System.out.println(email + " " + isValidEmail(email));
            System.out.println(password + " " + isValidPassword(password));
            resp.sendRedirect("register.jsp?error=invalid");
            return;
        }

        if (userDao.findByEmail(email).isPresent()) {
            resp.sendRedirect("register.jsp?error=exists");
            return;
        }

        String hash = PasswordUtils.hashPassword(password);
        User user = new User(email, hash, "user");
        userDao.save(user);

        resp.sendRedirect("login.jsp?success=1");
    }

    private static boolean isValidEmail(String email) {
        return EMAIL_PATTERN.matcher(email).matches();
    }

    private static boolean isValidPassword(String password) {
        return password.length() >= 6;
    }
}
