package org.example.insurance_card_be.controller.dashboard;

import org.example.insurance_card_be.dao.CustomerDAO;
import org.example.insurance_card_be.model.Customer;

import java.sql.SQLException;

public class CustomerService {
    private CustomerDAO customerDAO;

    public CustomerService() {
        customerDAO = new CustomerDAO();
    }

    public void saveCustomer(Customer customer) throws SQLException {
        customerDAO.insertCustomer(customer);
    }
}
