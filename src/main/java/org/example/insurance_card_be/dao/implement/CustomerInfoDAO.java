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
    // SQL query to get customer information based on ID
    String sql = "SELECT c.CustomerID, c.PersonalInfo, " +
            "u.UserID, u.Username, u.Password, u.Role, u.Email, u.Mobile, u.Full_name, u.Gender, " +
            "u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date " +
            "FROM dbo.Customers c " +
            "JOIN dbo.Users u ON c.UserID = u.UserID " +
            "WHERE c.CustomerID = ?";
    private static final String SELECT_MOTORCYCLES_BY_CUSTOMER_ID = "SELECT * FROM Motorcycles WHERE CustomerID = ?";

    // Get customer information based on ID
    public Customers selectCustomerByID(int customerID) {
        Customers customer = null;
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Users user = new Users(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        rs.getString("Mobile"),
                        rs.getString("Full_name"),
                        rs.getString("Gender"),
                        rs.getInt("Province"),
                        rs.getInt("District"),
                        rs.getInt("Country"),
                        rs.getString("First_name"),
                        rs.getString("Last_name"),
                        rs.getDate("Birth_date")
                );
                customer = new Customers(
                        rs.getInt("CustomerID"),
                        user,
                        rs.getString("PersonalInfo")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    // Get list of motorcycles based on customer ID
    public List<Motorcycle> selectMotorcyclesByCustomerID(int customerID) {
        List<Motorcycle> motorcycles = new ArrayList<>();
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_MOTORCYCLES_BY_CUSTOMER_ID)) {
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customers customer = selectCustomerByID(customerID);
                Motorcycle motorcycle = new Motorcycle(
                        rs.getInt("MotorcycleID"),
                        customer,
                        rs.getString("LicensePlate"),
                        rs.getString("Brand"),
                        rs.getString("Model"),
                        rs.getString("FrameNumber"),
                        rs.getString("EngineNumber"),
                        rs.getInt("YearOfManufacture"),
                        rs.getString("Color")
                );
                motorcycles.add(motorcycle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return motorcycles;
    }

    // Get list of all customer IDs
    public List<Customers> getAllCustomerIDs() throws SQLException {
        List<Customers> customers = new ArrayList<>();
        String sql = "SELECT c.CustomerID, u.Full_name FROM Customers c JOIN Users u ON c.UserID = u.UserID";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customers customer = new Customers();
                customer.setCustomerID(rs.getInt("CustomerID"));
                Users user = new Users();
                user.setFullName(rs.getString("Full_name"));
                customer.setUser(user);
                customers.add(customer);
            }
        }
        return customers;
    }

    // Ham main de test lay danh sach customerID va name
    public static void main(String[] args) {
        CustomerInfoDAO customerInfoDAO = new CustomerInfoDAO();
        try {
            List<Customers> customers = customerInfoDAO.getAllCustomerIDs();
            for (Customers customer : customers) {
                // Replace 'getFullName' with the actual method name in your Users class
                System.out.println(customer.getCustomerID() + " - " + customer.getUser().getFullName());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
