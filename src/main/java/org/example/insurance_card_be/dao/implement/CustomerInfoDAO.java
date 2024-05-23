package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerInfoDAO {
    private Connection connection; // Ket noi toi database

    public CustomerInfoDAO() { // Khoi tao ket noi toi database
        this.connection = DBContext.getConnection();
    }

    public List<Customers> getAllCustomers() { // Lay list customer
        List<Customers> customers = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Customers";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Customers customer = new Customers();
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
}