package org.example.insurance_card_be.dao;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerDAO {

    // SQL query to insert a new customer
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customers (email, full_name, dob, gender, address, job, company, card_number, issue_date, expiry_date) VALUES (?,?,?,?,?,?,?,?,?,?)";

    // Method to print SQL exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t!= null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public void insertCustomer(Customer customer) throws SQLException {
        try (Connection connection = DBContext.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {

                // Set the parameters for the SQL query from the customer object
                preparedStatement.setString(1, customer.getEmail());
                preparedStatement.setString(2, customer.getFullName());
                preparedStatement.setString(3, customer.getDob());
                preparedStatement.setString(4, customer.getGender());
                preparedStatement.setString(5, customer.getAddress());
                preparedStatement.setString(6, customer.getJob());
                preparedStatement.setString(7, customer.getCompany());
                preparedStatement.setString(8, customer.getCardNumber());
                preparedStatement.setString(9, customer.getIssueDate());
                preparedStatement.setString(10, customer.getExpiryDate());

                // Execute the SQL query
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            // Handle SQL exceptions
            this.printSQLException(e); // Call the printSQLException method from the same class
            throw e;
        }
    }
}