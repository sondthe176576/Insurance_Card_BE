package org.example.insurance_card_be.controller.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.CustomerDAO;
import org.example.insurance_card_be.model.Customer;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/saveCustomerInfo")
public class SaveCustomerInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String job = request.getParameter("job");
        String company = request.getParameter("company");

        Customer customer = new Customer(email, fullName, dob, gender, address, job, company);
        CustomerDAO customerDAO = new CustomerDAO();

        try {
            customerDAO.saveCustomer(customer);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\"}");
        }
    }
}
