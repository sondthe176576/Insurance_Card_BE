package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.dao.implement.AccidentHistoryDAO;
import org.example.insurance_card_be.model.Accident;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/accidentHistory")
public class AccidentHistoryServlet extends HttpServlet {
    private AccidentHistoryDAO accidentHistoryDAO;

    @Override
    public void init() {
        accidentHistoryDAO = new AccidentHistoryDAO();
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
                    viewAccident(request, response);
                    break;
                case "addForm":
                    showAddForm(request, response);
                    break;
                default:
                    listAccidents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/history/addAccidentForm.jsp").forward(request, response);
    }

    private void viewAccident(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int accidentID = Integer.parseInt(request.getParameter("id"));
        Accident accident = accidentHistoryDAO.getAccidentById(accidentID);
        request.setAttribute("accident", accident);
        request.getRequestDispatcher("/views/history/viewAccidentHistory.jsp").forward(request, response);
    }

    private void listAccidents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int customerID = (int) request.getSession().getAttribute("customerID");
        List<Accident> accidents = accidentHistoryDAO.getAccidentsByCustomerID(customerID);
        request.setAttribute("accidents", accidents);
        request.getRequestDispatcher("/views/history/accidentHistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    addAccident(request, response);
                    break;
                case "update":
                    updateAccident(request, response);
                    break;
                case "delete":
                    deleteAccident(request, response);
                    break;
                default:
                    listAccidents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void addAccident(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int customerID = (int) request.getSession().getAttribute("customerID");
        String contractIDStr = request.getParameter("contractID");
        String accidentType = request.getParameter("accidentType");
        String description = request.getParameter("description");
        String accidentDateStr = request.getParameter("accidentDate");

        if (contractIDStr == null || contractIDStr.isEmpty() ||
                accidentType == null || accidentType.isEmpty() ||
                description == null || description.isEmpty() ||
                accidentDateStr == null || accidentDateStr.isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required.");
            showAddForm(request, response);
            return;
        }

        try {
            int contractID = Integer.parseInt(contractIDStr);
            java.sql.Date accidentDate = java.sql.Date.valueOf(accidentDateStr);
            String status = "Pending";

            if (!accidentHistoryDAO.isContractValidForCustomer(contractID, customerID)) {
                request.setAttribute("errorMessage", "The provided Contract ID does not belong to the provided Customer ID.");
                showAddForm(request, response);
                return;
            }

            Accident newAccident = new Accident();
            newAccident.setCustomerID(customerID);
            newAccident.setContractID(contractID);
            newAccident.setAccidentType(accidentType);
            newAccident.setAccidentDate(accidentDate);
            newAccident.setDescription(description);
            newAccident.setStatus(status);

            accidentHistoryDAO.addAccident(newAccident);
            response.sendRedirect("accidentHistory");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format.");
            showAddForm(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd.");
            showAddForm(request, response);
        }
    }

    private void updateAccident(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String accidentIDParam = request.getParameter("accidentID");
        String contractIDParam = request.getParameter("contractID");

        if (accidentIDParam == null || accidentIDParam.isEmpty() ||
                contractIDParam == null || contractIDParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Accident ID or Contract ID is missing.");
            return;
        }

        int accidentID = Integer.parseInt(accidentIDParam);
        int contractID = Integer.parseInt(contractIDParam);
        String accidentType = request.getParameter("accidentType");
        String description = request.getParameter("description");
        java.sql.Date accidentDate = java.sql.Date.valueOf(request.getParameter("accidentDate"));
        String status = request.getParameter("status");

        Accident updatedAccident = new Accident();
        updatedAccident.setAccidentID(accidentID);
        updatedAccident.setContractID(contractID);
        updatedAccident.setAccidentType(accidentType);
        updatedAccident.setDescription(description);
        updatedAccident.setAccidentDate(accidentDate);
        updatedAccident.setStatus(status);

        accidentHistoryDAO.updateAccident(updatedAccident);
        response.sendRedirect("accidentHistory");
    }

    private void deleteAccident(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int accidentID = Integer.parseInt(request.getParameter("accidentID"));
        accidentHistoryDAO.deleteAccidentHistory(accidentID);
        response.sendRedirect("accidentHistory");
    }
}
