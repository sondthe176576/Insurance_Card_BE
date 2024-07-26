package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.model.PaymentHistoryCustomer;
import org.example.insurance_card_be.service.PaymentHistoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

    private static final Logger logger = LoggerFactory.getLogger(PaymentHistoryServlet.class);
    private static final String ACTION_VIEW = "view";
    private static final String ACTION_EDIT = "edit";
    private static final String ACTION_ADD = "add";
    private static final String ACTION_UPDATE = "update";
    private static final String ACTION_DELETE = "delete";
    private final PaymentHistoryService paymentHistoryService = new PaymentHistoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null || action.isEmpty()) {
                handleListPaymentHistories(request, response);
            } else {
                switch (action) {
                    case ACTION_VIEW:
                        handleViewPaymentHistory(request, response);
                        break;
                    case ACTION_EDIT:
                        handleEditPaymentHistory(request, response);
                        break;
                    case "addForm":
                        showAddForm(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                        break;
                }
            }
        } catch (NumberFormatException e) {
            logger.error("Invalid ID format", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
        } catch (Exception e) {
            logger.error("Error processing GET request", e);
            throw new ServletException("Error processing request", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case ACTION_ADD:
                    handleAddPaymentHistory(request, response);
                    break;
                case ACTION_UPDATE:
                    handleUpdatePaymentHistory(request, response);
                    break;
                case ACTION_DELETE:
                    handleDeletePaymentHistory(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                    break;
            }
        } catch (NumberFormatException e) {
            logger.error("Invalid number format", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        } catch (Exception e) {
            logger.error("Error processing POST request", e);
            throw new ServletException("Error processing request", e);
        }
    }

    private void handleListPaymentHistories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer customerID = (Integer) request.getSession().getAttribute("customerID");
        if (customerID == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Customer ID is missing. Please log in again.");
            return;
        }

        List<PaymentHistoryCustomer> paymentHistories = paymentHistoryService.getPaymentHistoriesByCustomerID(customerID);
        request.setAttribute("paymentHistories", paymentHistories);
        request.getRequestDispatcher("/views/history/paymentHistory.jsp").forward(request, response);
    }

    private void handleViewPaymentHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        PaymentHistoryCustomer paymentHistory = paymentHistoryService.getPaymentHistoryById(paymentID);
        request.setAttribute("paymentHistory", paymentHistory);
        request.getRequestDispatcher("/views/history/viewPaymentHistory.jsp").forward(request, response);
    }

    private void handleEditPaymentHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        PaymentHistoryCustomer paymentHistory = paymentHistoryService.getPaymentHistoryById(paymentID);
        request.setAttribute("paymentHistory", paymentHistory);
        request.getRequestDispatcher("/views/history/editPaymentHistory.jsp").forward(request, response);
    }

    private void handleAddPaymentHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            Date paymentDate = parseDate(request.getParameter("paymentDate"));
            int paymentMethodID = Integer.parseInt(request.getParameter("paymentMethodID"));
            int contractID = Integer.parseInt(request.getParameter("contractID"));

            PaymentHistoryCustomer paymentHistory = new PaymentHistoryCustomer(0, customerID, amount, paymentDate, paymentMethodID, contractID);
            paymentHistoryService.addPaymentHistory(paymentHistory);
            response.sendRedirect("paymentHistory");
        } catch (NumberFormatException e) {
            logger.error("Invalid number format", e);
            request.setAttribute("errorMessage", "Invalid number format. Please ensure all numeric fields are filled correctly.");
            showAddForm(request, response);
        } catch (IllegalArgumentException e) {
            logger.error("Invalid date format", e);
            request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd.");
            showAddForm(request, response);
        }
    }

    private void handleUpdatePaymentHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int paymentID = Integer.parseInt(request.getParameter("paymentID"));
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));
            Date paymentDate = parseDate(request.getParameter("paymentDate"));
            int paymentMethodID = Integer.parseInt(request.getParameter("paymentMethodID"));
            int contractID = Integer.parseInt(request.getParameter("contractID"));

            PaymentHistoryCustomer paymentHistory = new PaymentHistoryCustomer(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID);
            paymentHistoryService.updatePaymentHistory(paymentHistory);
            response.sendRedirect("paymentHistory");
        } catch (NumberFormatException e) {
            logger.error("Invalid number format", e);
            request.setAttribute("errorMessage", "Invalid number format. Please ensure all numeric fields are filled correctly.");
            handleEditPaymentHistory(request, response);
        } catch (IllegalArgumentException e) {
            logger.error("Invalid date format", e);
            request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd.");
            handleEditPaymentHistory(request, response);
        }
    }

    private void handleDeletePaymentHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        paymentHistoryService.deletePaymentHistory(paymentID);
        response.sendRedirect("paymentHistory");
    }

    private Date parseDate(String dateStr) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.parse(dateStr);
        } catch (ParseException e) {
            logger.error("Invalid date format", e);
            throw new IllegalArgumentException("Invalid date format", e);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/history/addPaymentForm.jsp").forward(request, response);
    }
}
