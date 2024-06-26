package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;

@WebServlet(name = "CustomerViewServlet", urlPatterns = "/customer-view")
public class CustomerViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userIDStr = req.getParameter("userID");
        if (userIDStr == null || userIDStr.isEmpty()) {
            req.setAttribute("error", "User ID is missing.");
            req.getRequestDispatcher("/views/staff/ErrorPage.jsp").forward(req, resp);
            return;
        }

        try {
            int userID = Integer.parseInt(userIDStr);
            CustomerDAO dao = new CustomerDAO();
            Users customer = dao.findById(userID);

            if (customer == null) {
                req.setAttribute("error", "Customer not found.");
                req.getRequestDispatcher("/views/staff/ErrorPage.jsp").forward(req, resp);
                return;
            }

            req.setAttribute("customer", customer);
            req.getRequestDispatcher("/views/staff/viewCustomer.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid User ID format.");
            req.getRequestDispatcher("/views/staff/ErrorPage.jsp").forward(req, resp);
        }
    }
}
