package ru.dovlatov.suitcase.dao;

import ru.dovlatov.suitcase.config.ConnectionManager;
import ru.dovlatov.suitcase.model.OrderView;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderDao {

    public void saveOrder(int userId, Map<Integer, Integer> items) {
        String insertOrder = "INSERT INTO orders (user_id) VALUES (?) RETURNING id";
        String insertItem = "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)"; // ИСПРАВЛЕНО

        try (Connection conn = ConnectionManager.getConnection()) {
            conn.setAutoCommit(false);

            int orderId;
            try (PreparedStatement ps = conn.prepareStatement(insertOrder)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                rs.next();
                orderId = rs.getInt(1);
            }

            try (PreparedStatement ps = conn.prepareStatement(insertItem)) {
                for (Map.Entry<Integer, Integer> entry : items.entrySet()) {
                    ps.setInt(1, orderId);  // ИСПРАВЛЕНО: используем orderId, а не userId
                    ps.setInt(2, entry.getKey());
                    ps.setInt(3, entry.getValue());
                    ps.addBatch();
                }
                ps.executeBatch();  // ДОБАВЛЕНО: выполняем batch
                conn.commit();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка сохранения заказа", e);
        }
    }

    public List<OrderView> findOrdersByUserId(int userId) {
        String sql = """
        SELECT o.id AS order_id,
            o.created_at,
            p.name AS product_name,
            oi.quantity,
            p.price
        FROM orders o
        JOIN order_items oi ON o.id = oi.order_id
        JOIN products p ON p.id = oi.product_id
        WHERE o.user_id = ?
        ORDER BY o.created_at DESC
        """;  // УБРАТЬ точку с запятой здесь

        List<OrderView> result = new ArrayList<>();

        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderView item = new OrderView();
                item.setOrderId(rs.getInt("order_id"));
                item.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                item.setProductName(rs.getString("product_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getBigDecimal("price"));
                result.add(item);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка загрузки заказов пользователя: " + userId, e);
        }
        return result;
    }
}
