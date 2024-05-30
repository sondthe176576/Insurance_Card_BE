package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CustomerInfoDAO;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;

import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    // Khai bao mot doi tuong CustomerInfoDAO de truy cap vao CSDL
    private CustomerInfoDAO customerInfoDAO;

    // Ham khoi tao khong doi so
    public CustomerService() {
        this.customerInfoDAO = new CustomerInfoDAO();
    }

    // Ham lay thong tin cua customer theo ID
    public Customers getCustomerByID(int customerID) throws SQLException {
        return customerInfoDAO.selectCustomerByID(customerID);
    }

    // Ham lay danh sach cac xe may cua mot customer theo ID
    public List<Motorcycle> getMotorcyclesByCustomerID(int customerID) throws SQLException {
        return customerInfoDAO.selectMotorcyclesByCustomerID(customerID);
    }

    // Ham lay danh sach tat ca cac customerID
    public List<Integer> getAllCustomers() throws SQLException {
        return customerInfoDAO.getAllCustomerIDs();
    }
}