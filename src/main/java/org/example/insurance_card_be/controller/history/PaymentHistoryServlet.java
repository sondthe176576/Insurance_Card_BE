package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.model.PaymentHistory;
import org.example.insurance_card_be.service.PaymentHistoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@WebServlet("/paymentHistory")
public class PaymentHistoryServlet extends HttpServlet {

    private final PaymentHistoryService paymentHistoryService = new PaymentHistoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null || action.isEmpty()) {
                List<PaymentHistory> paymentHistories = paymentHistoryService.getAllPaymentHistories();
                request.setAttribute("paymentHistories", paymentHistories);
                request.getRequestDispatcher("/views/history/paymentHistory.jsp").forward(request, response);
            } else if ("view".equals(action)) {
                int paymentID = Integer.parseInt(request.getParameter("paymentID"));
                PaymentHistory paymentHistory = paymentHistoryService.getPaymentHistoryById(paymentID);
                request.setAttribute("paymentHistoryCus", paymentHistory);
                request.getRequestDispatcher("/views/history/viewPaymentHistory.jsp").forward(request, response);
            } else if ("edit".equals(action)) {
                int paymentID = Integer.parseInt(request.getParameter("paymentID"));
                PaymentHistory paymentHistory = paymentHistoryService.getPaymentHistoryById(paymentID);
                request.setAttribute("paymentHistory", paymentHistory);
                request.getRequestDispatcher("/views/history/editPaymentHistory.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
        } catch (Exception e) {
            throw new ServletException("Error processing request", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                BigDecimal amount = new BigDecimal(request.getParameter("amount"));
                Date paymentDate = new Date();  // Assuming the current date
                int paymentMethodID = Integer.parseInt(request.getParameter("paymentMethodID"));
                int contractID = Integer.parseInt(request.getParameter("contractID"));

                PaymentHistory paymentHistory = new PaymentHistory(0, customerID, amount, paymentDate, paymentMethodID, contractID);
                paymentHistoryService.addPaymentHistory(paymentHistory);
                response.sendRedirect("paymentHistory");
            } else if ("update".equals(action)) {
                int paymentID = Integer.parseInt(request.getParameter("paymentID"));
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                BigDecimal amount = new BigDecimal(request.getParameter("amount"));
                Date paymentDate = new Date();  // Assuming the current date
                int paymentMethodID = Integer.parseInt(request.getParameter("paymentMethodID"));
                int contractID = Integer.parseInt(request.getParameter("contractID"));

                PaymentHistory paymentHistory = new PaymentHistory(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID);
                paymentHistoryService.updatePaymentHistory(paymentHistory);
                response.sendRedirect("paymentHistory");
            } else if ("delete".equals(action)) {
                int paymentID = Integer.parseInt(request.getParameter("paymentID"));
                paymentHistoryService.deletePaymentHistory(paymentID);
                response.sendRedirect("paymentHistory");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        } catch (Exception e) {
            throw new ServletException("Error processing request", e);
        }
    }
}
