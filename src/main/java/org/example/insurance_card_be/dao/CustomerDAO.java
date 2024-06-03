package org.example.insurance_card_be.dao;

import org.example.insurance_card_be.model.customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO extends DBContext{
    public List<customer> getAccidentHistory() {
        List<customer> list = new ArrayList<>();
        try {
            String sql = "  select c.*, a.*,u.FullName  from Customers c\n" +
                    "  join Users u on u.UserID = c.UserID\n" +
                    "  join AccidentHistory a on a.CustomerID = c.CustomerID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                customer cs = new customer(
                        rs.getInt("CustomerID"),
                        rs.getInt("UserID"),
                        rs.getString("PersonalInfo"),
                        rs.getString("FullName"),
                        rs.getInt("AccidentId"),
                        rs.getString("Description"),
                        rs.getDate("Date")
                );
                list.add(cs);
            }
        } catch (Exception e) {
        }
        return list;

    }
    public static void main(String[] args) {
        // Create an instance of CustomerDAO
        CustomerDAO customerDAO = new CustomerDAO();

        // Call the method to get the accident history
        List<customer> accidentList = customerDAO.getAccidentHistory();

        // Print the information of each accident
        for (customer c : accidentList) {
            System.out.println("Customer ID: " + c.getCustomerId());
            System.out.println("User ID: " + c.getUserId());
            System.out.println("Personal Info: " + c.getPersonalInfo());
            System.out.println("Full Name: " + c.getFullName());
            System.out.println("Accident ID: " + c.getAccidentId());
            System.out.println("Description: " + c.getDescription());
            System.out.println("Date: " + c.getDate());
            System.out.println("----------------------");
        }
    }
}