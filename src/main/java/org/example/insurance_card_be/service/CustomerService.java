package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CustomerInfoDAO;
import org.example.insurance_card_be.model.Customers;

import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    private CustomerInfoDAO customerInfoDAO;

    public CustomerService() {
        this.customerInfoDAO = new CustomerInfoDAO();
    }

    public List<Customers> getAllCustomers() {
        return customerInfoDAO.getAllCustomers();
    }
}
