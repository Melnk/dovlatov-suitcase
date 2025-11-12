package ru.dovlatov.suitcase.dao;

import ru.dovlatov.suitcase.config.ConnectionManager;
import ru.dovlatov.suitcase.model.PickupPoint;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PickupPointDao {
    public List<PickupPoint> findAll() {
        List<PickupPoint> points = new ArrayList<>();
        String sql = "SELECT * FROM pickup_points ORDER BY city";

        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                points.add(new PickupPoint(
                    rs.getInt("id"),
                    rs.getString("city"),
                    rs.getString("address")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return points;
    }

    public List<PickupPoint> findByProductId(int productId) {
        List<PickupPoint> list = new ArrayList<>();
        String sql = """
        SELECT p.id, p.city, p.address
        from pickup_points p
        JOIN product_pickup pp ON p.id = pp.pickup_id
        WHERE pp.product_id = ?
        """;

        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new PickupPoint(
                    rs.getInt("id"),
                    rs.getString("city"),
                    rs.getString("address")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
