package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.model.PaymentHistoryCus;
import org.example.insurance_card_be.service.PaymentHistoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/paymentHistory")
public class PaymentHistoryServlet extends HttpServlet {

    private PaymentHistoryService paymentHistoryService = new PaymentHistoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null || action.isEmpty()) {
                List<PaymentHistoryCus> paymentHistories = paymentHistoryService.getAllPaymentHistories();
                request.setAttribute("paymentHistories", paymentHistories);
                request.getRequestDispatcher("/views/history/paymentHistory.jsp").forward(request, response);
            } else if ("view".equals(action)) {
                int paymentID = Integer.parseInt(request.getParameter("paymentID"));
                PaymentHistoryCus paymentHistory = paymentHistoryService.getPaymentHistoryById(paymentID);
                request.setAttribute("paymentHistoryCus", paymentHistory);
                request.getRequestDispatcher("/views/history/viewPaymentHistory.jsp").forward(request, response);
            } else if ("edit".equals(action)) {
                int paymentID = Integer.parseInt(request.getParameter("paymentID"));
                PaymentHistoryCus paymentHistory = paymentHistoryService.getPaymentHistoryById(paymentID);
                request.setAttribute("paymentHistoryCus", paymentHistory);
                request.getRequestDispatcher("/views/history/editPaymentHistory.jsp").forward(request, response);
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

        if ("add".equals(action)) {
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            Date paymentDate = null;
            try {
                paymentDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("paymentDate"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            int paymentMethodID = Integer.parseInt(request.getParameter("paymentMethodID"));
            int contractID = Integer.parseInt(request.getParameter("contractID"));

            PaymentHistoryCus paymentHistoryCus = new PaymentHistoryCus(0, customerID, amount, paymentDate, paymentMethodID, contractID);
            paymentHistoryService.addPaymentHistory(paymentHistoryCus);

            response.sendRedirect(request.getContextPath() + "/paymentHistory");
        } else if ("update".equals(action)) {
            int paymentID = Integer.parseInt(request.getParameter("paymentID"));
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            Date paymentDate = null;
            try {
                paymentDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("paymentDate"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            int paymentMethodID = Integer.parseInt(request.getParameter("paymentMethodID"));
            int contractID = Integer.parseInt(request.getParameter("contractID"));

            PaymentHistoryCus paymentHistoryCus = new PaymentHistoryCus(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID);
            paymentHistoryService.updatePaymentHistory(paymentHistoryCus);

            response.sendRedirect(request.getContextPath() + "/paymentHistory");
        } else if ("delete".equals(action)) {
            int paymentID = Integer.parseInt(request.getParameter("paymentID"));
            paymentHistoryService.deletePaymentHistory(paymentID);

            response.sendRedirect(request.getContextPath() + "/paymentHistory");
        }
    }
}
