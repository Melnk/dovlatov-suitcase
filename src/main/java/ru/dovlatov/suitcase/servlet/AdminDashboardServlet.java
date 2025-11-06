package ru.dovlatov.suitcase.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.dovlatov.suitcase.dao.OrderDao;
import ru.dovlatov.suitcase.dao.ProductDao;
import ru.dovlatov.suitcase.model.Product;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private final ProductDao productDao = new ProductDao();
    private final OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        var user = (ru.dovlatov.suitcase.model.User) session.getAttribute("user");
        if (!"admin".equals(user.getRole())) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Доступ запрещен!");
            return;
        }

        List<Product> products = productDao.findAll();
        int orderCount = orderDao.countOrders();
        int productCount = productDao.countProducts();

        req.setAttribute("products", products);
        req.setAttribute("orderCount", orderCount);
        req.setAttribute("productCount", productCount);

        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String image = req.getParameter("imageUrl");

        try {
            double price = Double.parseDouble(priceStr);
            productDao.save(new Product(name, description, new BigDecimal(price), image));
        } catch (Exception e) {
            req.setAttribute("error", "Ошибка при добавлении товара: " + e.getMessage());
        }
    }
}
