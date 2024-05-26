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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Chon id cua customer va chuyen sang trang tao contract
        try {
            List<Integer> customerIDs = customerService.getAllCustomers();
            req.setAttribute("customerIDs", customerIDs);
            req.getRequestDispatcher("/views/contract/selectCustomer.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lay id tu service va hien thi len page
        try {
            List<Integer> customerIDs = customerService.getAllCustomers();
            req.setAttribute("customerIDs", customerIDs);
            req.getRequestDispatcher("/views/contract/selectCustomer.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}