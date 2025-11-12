package ru.dovlatov.suitcase.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.dovlatov.suitcase.dao.PickupPointDao;
import java.io.IOException;

@WebServlet("/pickup")
public class PickupListServlet extends HttpServlet {
    private final PickupPointDao pickupDAO = new PickupPointDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setAttribute("pickupPoints", pickupDAO.findAll());
        req.getRequestDispatcher("pickup.jsp").forward(req, resp);
    }
}
