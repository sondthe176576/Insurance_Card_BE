package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CustomerInfoDAO;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;

import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    // Khai bao customerInfoDAO
    private CustomerInfoDAO customerInfoDAO;

    // Khoi tao customerInfoDAO
    public CustomerService() {
        this.customerInfoDAO = new CustomerInfoDAO();
    }

    // Ham lay thong tin cua mot customer theo ID
    public Customers getCustomerByID(int customerID) throws SQLException {
        return customerInfoDAO.selectCustomerByID(customerID);
    }

    // Ham lay danh sach cac xe may cua mot customer theo ID
    public List<Motorcycle> getMotorcyclesByCustomerID(int customerID) throws SQLException {
        return customerInfoDAO.selectMotorcyclesByCustomerID(customerID);
    }

    // Ham lay danh sach cac customerID
    public List<Customers> getAllCustomers() throws SQLException {
        return customerInfoDAO.getAllCustomerIDs();
    }
}