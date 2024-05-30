package org.example.insurance_card_be.controller.dashboard;

import com.google.gson.Gson;
import org.example.insurance_card_be.model.Customer;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/saveCustomerInfo")
public class CustomerInfoController extends HttpServlet {
    private CustomerService customerService;

    @Override
    public void init() throws ServletException {
        customerService = new CustomerService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve customer information from the request parameters
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String job = request.getParameter("job");
        String company = request.getParameter("company");
        String cardNumber = request.getParameter("cardNumber");
        String issueDate = request.getParameter("issueDate");
        String expiryDate = request.getParameter("expiryDate");

        // Create a new Customer object with the retrieved information
        Customer customer = new Customer(email, fullName, dob, gender, address, job, company, cardNumber, issueDate, expiryDate);

        try {
            // Save the customer information to the database
            customerService.saveCustomer(customer);

            // Set the response content type and encoding
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Write a success response with the saved customer information
            response.getWriter().write("{\"status\": \"success\", \"data\": " + new Gson().toJson(customer) + "}");
        } catch (SQLException e) {
            // Set the response content type and encoding
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Write an error response with the exception message
            response.getWriter().write("{\"status\": \"error\", \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}
