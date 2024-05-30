package org.example.insurance_card_be.controller.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.InsuranceCardDAO;
import org.example.insurance_card_be.model.InsuranceCard;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/saveInsuranceCardInfo")
public class SaveInsuranceCardInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cardNumber = request.getParameter("cardNumber");
        String issueDate = request.getParameter("issueDate");
        String expiryDate = request.getParameter("expiryDate");

        InsuranceCard insuranceCard = new InsuranceCard(cardNumber, issueDate, expiryDate);
        InsuranceCardDAO insuranceCardDAO = new InsuranceCardDAO();

        try {
            insuranceCardDAO.insertInsuranceCard(insuranceCard);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\", \"data\":" + insuranceCard.toJson() + "}");
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\"}");
        }
    }
}
