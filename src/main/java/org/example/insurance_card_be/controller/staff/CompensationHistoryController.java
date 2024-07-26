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
import java.util.List;

@WebServlet(name = "CompensationHistoryController", urlPatterns = "/listCompensationHistory")
public class CompensationHistoryController extends HttpServlet {
    private CompensationHistoryForStaffDAO compensationHistoryDAO;

    public CompensationHistoryController() {
        this.compensationHistoryDAO = new CompensationHistoryForStaffDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerName = req.getParameter("customerName");
        String sortOrder = req.getParameter("sortOrder");
        int page = 1;
        int recordsPerPage = 10;
        if (req.getParameter("page") != null)
            page = Integer.parseInt(req.getParameter("page"));

        List<CompensationHistoryDTO> histories;
        int noOfRecords;
        try {
            histories = compensationHistoryDAO.getCompensationHistories((page - 1) * recordsPerPage, recordsPerPage);
            noOfRecords = compensationHistoryDAO.getTotalCompensationHistories();
        } catch (SQLException e) {
            throw new ServletException("Cannot obtain compensation histories from DB", e);
        }

        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        req.setAttribute("histories", histories);
        req.setAttribute("noOfPages", noOfPages);
        req.setAttribute("currentPage", page);

        req.getRequestDispatcher("/views/staff/listCompensationHistory.jsp").forward(req, resp);
    }
}