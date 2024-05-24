package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;
import org.example.insurance_card_be.model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerInfoDAO {
    String sql = "SELECT c.CustomerID, c.PersonalInfo, " +
            "u.UserID, u.Username, u.Password, u.Role, u.Email, u.Mobile, u.Address, u.FullName, u.Gender " +
            "FROM dbo.Customers c " +
            "JOIN dbo.Users u ON c.UserID = u.UserID " +
            "WHERE c.CustomerID = ?";
    private static final String SELECT_MOTORCYCLES_BY_CUSTOMER_ID = "SELECT * FROM Motorcycles WHERE CustomerID = ?";

    // Load a customer from the database by ID
    public Customers selectCustomerByID(int customerID) {
        Customers customer = null;
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Users user = new Users(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("Role"), rs.getString("Email"), rs.getString("Mobile"), rs.getString("Address"),
                        rs.getString("FullName"), rs.getString("Gender"));
                customer = new Customers(rs.getInt("CustomerID"), user, rs.getString("PersonalInfo"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    // Load motorcycles of a customer from the database by ID
    public List<Motorcycle> selectMotorcyclesByCustomerID(int customerID) {
        List<Motorcycle> motorcycles = new ArrayList<>();
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_MOTORCYCLES_BY_CUSTOMER_ID)) {
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customers customer = selectCustomerByID(customerID);
                Motorcycle motorcycle = new Motorcycle(rs.getInt("MotorcycleID"), customer, rs.getString("LicensePlate"),
                        rs.getString("Brand"), rs.getString("Model"), rs.getString("FrameNumber"), rs.getString("EngineNumber"),
                        rs.getInt("YearOfManufacture"), rs.getString("Color"));
                motorcycles.add(motorcycle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return motorcycles;
    }

    // Load all ID of customers from the database
    public List<Integer> getAllCustomerIDs() throws SQLException {
        List<Integer> customerIDs = new ArrayList<>();
        String sql = "SELECT CustomerID FROM Customers";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customerIDs.add(rs.getInt("CustomerID"));
            }

        }
        return customerIDs;
    }

    // Function main check selectCustomerByID have been implemented correctly
    public static void main(String[] args) {
        CustomerInfoDAO customerInfoDAO = new CustomerInfoDAO();
        Customers customer = customerInfoDAO.selectCustomerByID(1);
        System.out.println(customer);
    }
}
