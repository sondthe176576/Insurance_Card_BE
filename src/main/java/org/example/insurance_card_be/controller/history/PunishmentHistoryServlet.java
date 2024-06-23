package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.dao.implement.PunishmentHistoryDAO;
import org.example.insurance_card_be.model.PunishmentHistory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/punishmentHistory")
public class PunishmentHistoryServlet extends HttpServlet {
    private PunishmentHistoryDAO punishmentHistoryDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        punishmentHistoryDAO = new PunishmentHistoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = 1; // Example: Hardcoded customer ID, replace with dynamic value from session or request parameter
        int page = 1; // Default page number
        int pageSize = 5; // Default page size

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        try {
            List<PunishmentHistory> punishmentHistoryList = punishmentHistoryDAO.getAllPunishmentHistoriesForCustomer(customerId, page, pageSize);

            request.setAttribute("punishmentHistoryList", punishmentHistoryList);

            request.getRequestDispatcher("/views/history/punishmentHistory.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void destroy() {
        // Clean up resources if needed
        super.destroy();
    }
}

