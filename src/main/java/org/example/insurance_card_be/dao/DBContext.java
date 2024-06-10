package org.example.insurance_card_be.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    private Connection connection;

    public DBContext() {
        try {
            // Edit URL, username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=Database_New";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace(); // Handle this exception appropriately
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle this exception appropriately
            }
        }
    }

    public static void main(String[] args) {
        DBContext dbContext = new DBContext(); // Create an instance of DBContext
        Connection conn = dbContext.getConnection(); // Call getConnection() on the instance
        if (conn != null) {
            System.out.println("Connect successfully!");
        } else {
            System.out.println("Connect failure!");
        }
        dbContext.closeConnection(); // Close the connection
    }
}
