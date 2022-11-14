package utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseUtils {
    private static DatabaseUtils dbInstance;
    private static Connection con;

    public static DatabaseUtils getInstance() {
        if (dbInstance == null) {
            dbInstance = new DatabaseUtils();
        }
        return dbInstance;
    }
    public static void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getDatabaseConnection() {
        try {
            Properties properties = new Properties();
            // Đọc những thông tin trong file
            properties.load(Files.newInputStream(Paths.get("src/main/resources/database.properties")));
            String databaseUrl = properties.getProperty("databaseUrl");
            String userName = properties.getProperty("username");
            String password = properties.getProperty("password");
            Class.forName("com.mysql.cj.jdbc.Driver");
            if (con == null) {
                con = DriverManager.getConnection(databaseUrl,userName,password);
                con.setAutoCommit(false);
                System.out.println("Connect to database success");
                return con;
            }
        } catch (ClassNotFoundException|SQLException| IOException e) {
            e.printStackTrace();
        }
        return con;
    }
}
