package org.example.insurance_card_be.dao;

import org.example.insurance_card_be.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {


    public class CustomerDAO { // Removed 'tatic' keyword

        //... other methods...

        private void printSQLException(SQLException ex) {
            for (Throwable e : ex) {
                if (e instanceof SQLException) {
                    e.printStackTrace(System.err);
                    System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                    System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                    System.err.println("Message: " + e.getMessage());
                    Throwable t = ex.getCause();
                    while (t != null) {
                        System.out.println("Cause: " + t);
                        t = t.getCause();
                    }
                }
            }
        }

        public void saveCustomer(Customer customer) throws SQLException {
            try (Connection connection = DBContext.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {

                preparedStatement.setString(1, customer.getEmail());
                preparedStatement.setString(2, customer.getFullName());
                preparedStatement.setString(3, customer.getDob());
                preparedStatement.setString(4, customer.getGender());
                preparedStatement.setString(5, customer.getAddress());
                preparedStatement.setString(6, customer.getJob());
                preparedStatement.setString(7, customer.getCompany());

                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                this.printSQLException(e); // Call the printSQLException method from the same class
                throw e;
            }
        }
    }
}