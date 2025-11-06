package ru.dovlatov.suitcase.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.dovlatov.suitcase.dao.OrderDao;
import ru.dovlatov.suitcase.model.OrderView;
import ru.dovlatov.suitcase.model.User;
import java.io.IOException;
import java.util.List;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<OrderView> orders = orderDao.findOrdersByUserId(user.getId());

        req.setAttribute("orders", orders);
        req.getRequestDispatcher("orders.jsp").forward(req, resp);
    }
}
