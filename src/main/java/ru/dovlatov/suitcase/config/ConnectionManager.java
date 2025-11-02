package ru.dovlatov.suitcase.config;

import java.io.IOException;
import java.io.InputStream;

public class ConnectionManager {
    private static final String PROPERTIES_FILE = "db.properties";
    private static String url;
    private static String username;
    private static String password;

    static {
        try (InputStream input = ConnectionManager.class.getClassLoader().getResourceAsStream(PROPERTIES_FILE)) {

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
