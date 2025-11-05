package ru.dovlatov.suitcase.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.dovlatov.suitcase.dao.ProductDao;
import ru.dovlatov.suitcase.model.Cart;
import ru.dovlatov.suitcase.model.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final ProductDao productDao = new ProductDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String productIdStr = req.getParameter("productId");
        if (productIdStr != null) {
            int productId = Integer.parseInt(productIdStr);
            cart.addItem(productId);

            session.setAttribute("successMessage", "Товар добавлен в корзину!");
        }

        resp.sendRedirect("products");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Cart cart = (session != null) ? (Cart) session.getAttribute("cart") : null;

        if (cart == null || cart.isEmpty()) {
            req.setAttribute("products", Collections.emptyList());
            req.setAttribute("quantities", Collections.emptyMap());
        } else {
            Map<Integer, Integer> items = cart.getItems();
            List<Product> products = new ArrayList<>();

            // ИСПРАВЛЕНО: используем entrySet чтобы избежать дублирования
            for (Map.Entry<Integer, Integer> entry : items.entrySet()) {
                productDao.findById(entry.getKey()).ifPresent(products::add);
            }

            req.setAttribute("products", products);
            req.setAttribute("quantities", items);
        }

        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }
}
