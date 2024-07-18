package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.model.CompensationRequests;
import org.example.insurance_card_be.service.CompensationHistoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/compensationHistory")
public class CompensationHistoryServlet extends HttpServlet {
    private CompensationHistoryService compensationHistoryService;
    private static final int RECORDS_PER_PAGE = 10;

    @Override
    public void init() {
        compensationHistoryService = new CompensationHistoryService();
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
                case "addForm":
                    showAddForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
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

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int requestID = Integer.parseInt(request.getParameter("id"));
        CompensationRequests requestDetail = compensationHistoryService.getCompensationRequestById(requestID);
        request.setAttribute("compensationRequest", requestDetail);
        request.getRequestDispatcher("/views/history/editCompensationHistory.jsp").forward(request, response);
    }

    private void viewCompensationRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int requestID = Integer.parseInt(request.getParameter("id"));
        CompensationRequests requestDetail = compensationHistoryService.getCompensationRequestById(requestID);
        if (requestDetail != null) {
            request.setAttribute("compensationRequest", requestDetail);
            request.getRequestDispatcher("/views/history/viewCompensationHistory.jsp").forward(request, response);
        } else {
            response.sendRedirect("errorPage.jsp");
        }
    }

    private void listCompensationRequests(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer customerID = (Integer) request.getSession().getAttribute("customerID");
        if (customerID == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Customer ID is missing. Please log in again.");
            return;
        }

        String pageStr = request.getParameter("page");
        int page = (pageStr == null || pageStr.isEmpty()) ? 1 : Integer.parseInt(pageStr);
        int offset = (page - 1) * RECORDS_PER_PAGE;

        List<CompensationRequests> requests = compensationHistoryService.getCompensationRequestsByCustomerID(customerID, offset, RECORDS_PER_PAGE);
        int totalRecords = compensationHistoryService.getTotalCompensationRequestsByCustomerID(customerID);
        int totalPages = (int) Math.ceil((double) totalRecords / RECORDS_PER_PAGE);

        request.setAttribute("compensationRequests", requests);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
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
        Integer customerID = (Integer) request.getSession().getAttribute("customerID");
        if (customerID == null) {
            request.setAttribute("errorMessage", "Customer ID is missing. Please log in again.");
            showAddForm(request, response);
            return;
        }

        String contractIDStr = request.getParameter("contractID");
        String amountStr = request.getParameter("amount");
        String description = request.getParameter("description");
        String requestDateStr = request.getParameter("requestDate");

        if (contractIDStr == null || contractIDStr.isEmpty() ||
                amountStr == null || amountStr.isEmpty() ||
                description == null || description.isEmpty() ||
                requestDateStr == null || requestDateStr.isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required.");
            showAddForm(request, response);
            return;
        }

        try {
            int contractID = Integer.parseInt(contractIDStr);
            BigDecimal amount = new BigDecimal(amountStr);
            java.sql.Date requestDate = java.sql.Date.valueOf(requestDateStr);
            String status = "Pending";

            if (!compensationHistoryService.isContractValidForCustomer(contractID, customerID)) {
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

            compensationHistoryService.addCompensationRequest(newRequest);
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

        compensationHistoryService.updateCompensationRequest(updatedRequest);
        response.sendRedirect("compensationHistory");
    }

    private void deleteCompensationRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int requestID = Integer.parseInt(request.getParameter("requestID"));
        compensationHistoryService.deleteCompensationRequest(requestID);
        response.sendRedirect("compensationHistory");
    }
}
