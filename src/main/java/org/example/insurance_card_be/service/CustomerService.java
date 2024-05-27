package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CustomerInfoDAO;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;

import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    // Ham nay se tra ve mot doi tuong Customer tuong ung voi ID truyen vao
    private CustomerInfoDAO customerInfoDAO;

    // Ham nay se tra ve mot doi tuong Customer tuong ung voi ID truyen vao
    public CustomerService() {
        this.customerInfoDAO = new CustomerInfoDAO();
    }

    public Customers getCustomerByID(int customerID) throws SQLException {
        return customerInfoDAO.selectCustomerByID(customerID);
    }

    public List<Motorcycle> getMotorcyclesByCustomerID(int customerID) throws SQLException {
        return customerInfoDAO.selectMotorcyclesByCustomerID(customerID);
    }

    // Return a list of all ID of customers
    public List<Integer> getAllCustomers() throws SQLException {
        return customerInfoDAO.getAllCustomerIDs();
    }

    // Funtion main to test get all customers
    public static void main(String[] args) {
        CustomerService customerService = new CustomerService();
        try {
            List<Integer> customerIDs = customerService.getAllCustomers();
            for (int customerID : customerIDs) {
                System.out.println(customerID);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}