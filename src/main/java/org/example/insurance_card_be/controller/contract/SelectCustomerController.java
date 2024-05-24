package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.service.CustomerService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SelectCustomerController", urlPatterns = "/selectCustomer")
public class SelectCustomerController extends HttpServlet {
    public CustomerService customerService;

    public void init() throws ServletException {
        this.customerService = new CustomerService();
    }

    // This method is called when the user navigates to the selectCustomer page
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // From ID of Customer chosen by user, get the Customer to display in the form of contract
        int customerID = Integer.parseInt(req.getParameter("customerID"));
        Customers customer = null;
        try {
            customer = customerService.getCustomerByID(customerID);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("customer", customer);
        req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
    }


    // This method is called when the user selects a customer and submits the form
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get all ID of Customers from database to display in the dropdown list
        List<Integer> customerIDs = null;
        try {
            customerIDs = customerService.getAllCustomers();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("customerIDs", customerIDs);
        req.getRequestDispatcher("/views/contract/selectCustomer.jsp").forward(req, resp);
    }
}