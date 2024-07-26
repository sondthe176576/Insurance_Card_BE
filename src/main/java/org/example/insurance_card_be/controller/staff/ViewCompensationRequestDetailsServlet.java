package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.implement.CompensationHistoryForStaffDAO;
import org.example.insurance_card_be.model.CompensationHistoryDTO;


import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ViewCompensationRequestDetailsServlet", urlPatterns = "/viewCompensationRequest")
public class ViewCompensationRequestDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int compensationID = Integer.parseInt(req.getParameter("compensationID"));
            CompensationHistoryForStaffDAO dao = new CompensationHistoryForStaffDAO();
            CompensationHistoryDTO details = dao.getCompensationRequestDetails(compensationID);

            if (details != null) {
                req.setAttribute("details", details);
                req.getRequestDispatcher("/views/staff/viewCompensationRequest.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Compensation request not found.");
                req.getRequestDispatcher("/views/staff/viewCompensationRequest.jsp").forward(req, resp);
            }
        } catch (NumberFormatException | SQLException e) {
            req.setAttribute("error", "Error retrieving compensation request details: " + e.getMessage());
            req.getRequestDispatcher("/views/staff/viewCompensationRequest.jsp").forward(req, resp);
        }
    }
}