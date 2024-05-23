package org.example.insurance_card_be.controller.contract;


import java.io.IOException;
import java.util.List;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.service.CustomerService;

@WebServlet(name = "SelectCustomerController", urlPatterns = "/selectCustomer")
public class SelectCustomerController extends HttpServlet {
    public CustomerService customerService;

    public void init() throws ServletException {
        this.customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customers> customers = customerService.getAllCustomers();
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("/views/contract/selectCustomer.jsp").forward(req, resp);
    }
}