package org.example.insurance_card_be.controller.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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

        // Here you would typically update the database with the new information
        // For example:
        // CustomerDAO.updateCustomerInfo(email, fullName, dob, gender, address, job, company);

        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\"}");
    }
}
