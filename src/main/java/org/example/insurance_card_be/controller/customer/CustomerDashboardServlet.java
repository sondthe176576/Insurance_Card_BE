package org.example.insurance_card_be.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/customerDashboard")
public class CustomerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward request to customerDashboard.jsp
        request.getRequestDispatcher("/views/dashboard/customerDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle the search functionality
        String searchQuery = request.getParameter("searchInput");
        
        if (searchQuery != null && !searchQuery.isEmpty()) {
            // For demonstration, we simply add the search query to the request and forward it
            request.setAttribute("searchQuery", searchQuery);
        }
        
        // Forward the request back to the dashboard page with search results
        request.getRequestDispatcher("/views/dashboard/customerDashboard.jsp").forward(request, response);
    }
}
