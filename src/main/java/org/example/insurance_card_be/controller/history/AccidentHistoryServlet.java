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
    private static final int RECORDS_PER_PAGE = 10;

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
                case "edit":
                    showEditForm(request, response);
                    break;
                default:
                    listAccidents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listAccidents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int customerID = (int) request.getSession().getAttribute("customerID");
        List<Accident> allAccidents = accidentHistoryDAO.getAccidentsByCustomerID(customerID);
        int totalRecords = allAccidents.size();
        int totalPages = (int) Math.ceil((double) totalRecords / RECORDS_PER_PAGE);

        int start = (page - 1) * RECORDS_PER_PAGE;
        int end = Math.min(start + RECORDS_PER_PAGE, totalRecords);
        List<Accident> paginatedAccidents = allAccidents.subList(start, end);

        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("listAccidents", paginatedAccidents);

        request.getRequestDispatcher("/views/history/accidentHistory.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/history/addAccidentForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is missing.");
            return;
        }

        try {
            int accidentID = Integer.parseInt(idParam);
            Accident accident = accidentHistoryDAO.getAccidentById(accidentID);
            if (accident == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Accident not found.");
                return;
            }
            request.setAttribute("accident", accident);
            request.getRequestDispatcher("/views/history/editAccidentHistory.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
        }
    }

    private void viewAccident(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String idParam = request.getParameter("id");
        try {
            int accidentID = Integer.parseInt(idParam);
            Accident accident = accidentHistoryDAO.getAccidentById(accidentID);
            if (accident == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Accident not found.");
                return;
            }
            request.setAttribute("accident", accident);
            request.getRequestDispatcher("/views/history/viewAccidentHistory.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
        }
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
            java.time.LocalDate today = java.time.LocalDate.now();

            // Check if accidentDate is in the future
            if (accidentDate.toLocalDate().isAfter(today)) {
                request.setAttribute("errorMessage", "Accident date cannot be in the future.");
                showAddForm(request, response);
                return;
            }

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

            AccidentHistoryCus accidentHistoryCus = new AccidentHistoryCus(0, customerID, description, accidentDate);
            accidentHistoryService.addAccidentHistory(accidentHistoryCus);
            response.sendRedirect(request.getContextPath() + "/views/history/pendingforCustomer.jsp");
        } else if ("update".equals(action)) {
            int accidentID = Integer.parseInt(request.getParameter("accidentID"));
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            String description = request.getParameter("description");
            Date accidentDate = Date.valueOf(request.getParameter("accidentDate"));

            AccidentHistoryCus accidentHistoryCus = new AccidentHistoryCus(accidentID, customerID, description, accidentDate);
            accidentHistoryService.updateAccidentHistory(accidentHistoryCus);
            response.sendRedirect("accidentHistory");
        } else if ("delete".equals(action)) {
            int accidentID = Integer.parseInt(request.getParameter("accidentID"));
            accidentHistoryService.deleteAccidentHistory(accidentID);
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
        String accidentDateStr = request.getParameter("accidentDate");

        if (accidentIDParam == null || accidentIDParam.isEmpty() ||
                contractIDParam == null || contractIDParam.isEmpty() ||
                accidentDateStr == null || accidentDateStr.isEmpty()) {
            request.setAttribute("errorMessage", "Accident ID, Contract ID, or Accident Date is missing.");
            showEditForm(request, response);
            return;
        }

        try {
            int accidentID = Integer.parseInt(accidentIDParam);
            int contractID = Integer.parseInt(contractIDParam);
            String accidentType = request.getParameter("accidentType");
            String description = request.getParameter("description");
            java.sql.Date accidentDate = java.sql.Date.valueOf(accidentDateStr);
            java.time.LocalDate today = java.time.LocalDate.now();

            // Check if accidentDate is in the future
            if (accidentDate.toLocalDate().isAfter(today)) {
                request.setAttribute("errorMessage", "Accident date cannot be in the future.");
                Accident updatedAccident = new Accident();
                updatedAccident.setAccidentID(accidentID);
                updatedAccident.setContractID(contractID);
                updatedAccident.setAccidentType(accidentType);
                updatedAccident.setDescription(description);
                updatedAccident.setAccidentDate(accidentDate);
                updatedAccident.setStatus(request.getParameter("status"));
                request.setAttribute("accident", updatedAccident);
                request.getRequestDispatcher("/views/history/editAccidentHistory.jsp").forward(request, response);
                return;
            }

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
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format.");
            Accident updatedAccident = new Accident();
            updatedAccident.setAccidentID(Integer.parseInt(accidentIDParam));
            updatedAccident.setContractID(Integer.parseInt(contractIDParam));
            updatedAccident.setAccidentType(request.getParameter("accidentType"));
            updatedAccident.setDescription(request.getParameter("description"));
            updatedAccident.setAccidentDate(java.sql.Date.valueOf(request.getParameter("accidentDate")));
            updatedAccident.setStatus(request.getParameter("status"));
            request.setAttribute("accident", updatedAccident);
            request.getRequestDispatcher("/views/history/editAccidentHistory.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", "Invalid date format. Please use yyyy-MM-dd.");
            Accident updatedAccident = new Accident();
            updatedAccident.setAccidentID(Integer.parseInt(accidentIDParam));
            updatedAccident.setContractID(Integer.parseInt(contractIDParam));
            updatedAccident.setAccidentType(request.getParameter("accidentType"));
            updatedAccident.setDescription(request.getParameter("description"));
            updatedAccident.setAccidentDate(java.sql.Date.valueOf(request.getParameter("accidentDate")));
            updatedAccident.setStatus(request.getParameter("status"));
            request.setAttribute("accident", updatedAccident);
            request.getRequestDispatcher("/views/history/editAccidentHistory.jsp").forward(request, response);
        }
    }

    private void deleteAccident(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int accidentID = Integer.parseInt(request.getParameter("accidentID"));
        accidentHistoryDAO.deleteAccidentHistory(accidentID);
        response.sendRedirect("accidentHistory");
    }
}
