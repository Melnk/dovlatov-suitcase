package ru.dovlatov.suitcase.dao;

import ru.dovlatov.suitcase.config.ConnectionManager;
import ru.dovlatov.suitcase.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductDao {

    private static final String FIND_ALL = """
        SELECT * FROM products ORDER BY id;
        """;

    private static final String FIND_BY_ID = """
        SELECT * FROM products WHERE id = ?;
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

    public Optional<Product> findById(int id) {
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_ALL);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return Optional.of(new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getBigDecimal("price"),
                    rs.getString("image_url"))
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при поиске продукта", e);
        }
        return Optional.empty();
    }
}
