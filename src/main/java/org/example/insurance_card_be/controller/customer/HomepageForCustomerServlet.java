package org.example.insurance_card_be.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/homepageforcustomer")
public class HomepageForCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        // Forward request to customerDashboard.jsp
        request.getRequestDispatcher("/views/dashboard/HomePageForCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        // Handle the search functionality
        String searchQuery = request.getParameter("searchInput");

        if (searchQuery != null && !searchQuery.isEmpty()) {
            // For demonstration, we simply add the search query to the request and forward it
            request.setAttribute("searchQuery", searchQuery);
        }

        // Forward the request back to the dashboard page with search results
        request.getRequestDispatcher("/views/dashboard/HomePageForCus.jsp").forward(request, response);
    }
}
