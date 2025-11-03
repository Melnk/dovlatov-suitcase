package ru.dovlatov.suitcase.dao;

import ru.dovlatov.suitcase.config.ConnectionManager;
import ru.dovlatov.suitcase.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    private static final String FIND_ALL = """
        SELECT * FROM products ORDER BY id;
        """;

    public List<Product> findAll() {
        List<Product> products = new ArrayList<Product>();
        try (Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(FIND_ALL);
        ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                products.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getBigDecimal("price"),
                    rs.getString("image_url")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка загрузки списка продуктов", e);
        }
        return products;
    }
}
