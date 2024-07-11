package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.dao.implement.CompensationHistoryDAO;
import org.example.insurance_card_be.model.CompensationRequests;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet("/compensationHistory")
public class CompensationHistoryServlet extends HttpServlet {
    private CompensationHistoryDAO compensationHistoryDAO;

    @Override
    public void init() {
        compensationHistoryDAO = new CompensationHistoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "view":
                    viewCompensationRequest(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "addForm":
                    showAddForm(request, response);
                    break;
                default:
                    listCompensationRequests(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/history/addCompensationForm.jsp").forward(request, response);
    }

    private void viewCompensationRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int requestID = Integer.parseInt(request.getParameter("id"));
        CompensationRequests requestDetail = compensationHistoryDAO.getCompensationRequestById(requestID);
        request.setAttribute("compensationRequest", requestDetail);
        request.getRequestDispatcher("/views/history/viewCompensationHistory.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int requestID = Integer.parseInt(request.getParameter("id"));
        CompensationRequests compensationRequest = compensationHistoryDAO.getCompensationRequestById(requestID);
        request.setAttribute("compensationRequest", compensationRequest);
        request.getRequestDispatcher("/views/history/editCompensationHistory.jsp").forward(request, response);
    }

    private void listCompensationRequests(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<CompensationRequests> requests = compensationHistoryDAO.getAllCompensationRequests();
        request.setAttribute("compensationRequests", requests);
        request.getRequestDispatcher("/views/history/compensationHistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    addCompensationRequest(request, response);
                    break;
                case "update":
                    updateCompensationRequest(request, response);
                    break;
                case "delete":
                    deleteCompensationRequest(request, response);
                    break;
                default:
                    listCompensationRequests(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void addCompensationRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String customerIDStr = request.getParameter("customerID");
        String contractIDStr = request.getParameter("contractID");
        String amountStr = request.getParameter("amount");
        String description = request.getParameter("description");
        String requestDateStr = request.getParameter("requestDate");

        if (customerIDStr == null || customerIDStr.isEmpty() ||
                contractIDStr == null || contractIDStr.isEmpty() ||
                amountStr == null || amountStr.isEmpty() ||
                description == null || description.isEmpty() ||
                requestDateStr == null || requestDateStr.isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required.");
            showAddForm(request, response);
            return;
        }

        try {
            int customerID = Integer.parseInt(customerIDStr);
            int contractID = Integer.parseInt(contractIDStr);
            BigDecimal amount = new BigDecimal(amountStr);
            java.sql.Date requestDate = java.sql.Date.valueOf(requestDateStr);
            String status = "Pending";

            if (!compensationHistoryDAO.isContractValidForCustomer(contractID, customerID)) {
                request.setAttribute("errorMessage", "The provided Contract ID does not belong to the provided Customer ID.");
                showAddForm(request, response);
                return;
            }

            CompensationRequests newRequest = new CompensationRequests();
            newRequest.setCustomerID(customerID);
            newRequest.setContractID(contractID);
            newRequest.setRequestDate(requestDate);
            newRequest.setDescription(description);
            newRequest.setAmount(amount);
            newRequest.setStatus(status);

            compensationHistoryDAO.addCompensationRequest(newRequest);
            response.sendRedirect("compensationHistory");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format.");
            showAddForm(request, response);
        }
    }

    private void updateCompensationRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String requestIDParam = request.getParameter("requestID");
        String contractIDParam = request.getParameter("contractID");

        if (requestIDParam == null || requestIDParam.isEmpty() ||
                contractIDParam == null || contractIDParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request ID or Contract ID is missing.");
            return;
        }

        int requestID = Integer.parseInt(requestIDParam);
        int contractID = Integer.parseInt(contractIDParam);
        String description = request.getParameter("description");
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        java.sql.Date requestDate = java.sql.Date.valueOf(request.getParameter("requestDate"));
        String status = request.getParameter("status");

        CompensationRequests updatedRequest = new CompensationRequests();
        updatedRequest.setRequestID(requestID);
        updatedRequest.setContractID(contractID);
        updatedRequest.setDescription(description);
        updatedRequest.setAmount(amount);
        updatedRequest.setRequestDate(requestDate);
        updatedRequest.setStatus(status);

        compensationHistoryDAO.updateCompensationRequest(updatedRequest);
        response.sendRedirect("compensationHistory");
    }

    private void deleteCompensationRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int requestID = Integer.parseInt(request.getParameter("requestID"));
        compensationHistoryDAO.deleteCompensationRequest(requestID);
        response.sendRedirect("compensationHistory");
    }
}
