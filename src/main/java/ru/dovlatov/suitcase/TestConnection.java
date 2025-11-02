package ru.dovlatov.suitcase;

import ru.dovlatov.suitcase.config.ConnectionManager;
import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        try (Connection conn = ConnectionManager.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("Connection established");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
