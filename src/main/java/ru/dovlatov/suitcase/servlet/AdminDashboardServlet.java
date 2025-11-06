package ru.dovlatov.suitcase.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.dovlatov.suitcase.dao.OrderDao;
import ru.dovlatov.suitcase.dao.ProductDao;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private final ProductDao productDao = new ProductDao();
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        var user = (ru.dovlatov.suitcase.model.User) session.getAttribute("user");
        //int orderCount = orderDao.countOrders();
        //TODO
    }
}
