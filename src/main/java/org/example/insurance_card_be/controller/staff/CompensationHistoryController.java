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
        int page = 1;
        int pageSize = 10;
        String customerName = "";
        String sortOrder = "ASC";

        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        if (req.getParameter("customerName") != null) {
            customerName = req.getParameter("customerName");
        }
        if (req.getParameter("sortOrder") != null) {
            sortOrder = req.getParameter("sortOrder");
        }

        try {
            List<CompensationHistoryDTO> histories = compensationHistoryDAO.getAllCompensationHistories(page, pageSize, customerName, sortOrder);
            int totalHistories = compensationHistoryDAO.getTotalCompensationHistories(customerName);
            int noOfPages = (int) Math.ceil(totalHistories * 1.0 / pageSize);

            req.setAttribute("histories", histories);
            req.setAttribute("noOfPages", noOfPages);
            req.setAttribute("currentPage", page);
            req.setAttribute("customerName", customerName);
            req.setAttribute("sortOrder", sortOrder);
        } catch (SQLException e) {
            throw new ServletException("Cannot obtain compensation histories from DB", e);
        }

        req.getRequestDispatcher("/views/staff/listCompensationHistory.jsp").forward(req, resp);
    }
}