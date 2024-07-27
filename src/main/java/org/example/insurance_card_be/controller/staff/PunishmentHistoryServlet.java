package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import org.example.insurance_card_be.dao.implement.PunishmentHistoryDAO;
import org.example.insurance_card_be.dao.implement.PunishmentHistoryForStaffDAO;
import org.example.insurance_card_be.model.PunishmentHistoryDTO;

@WebServlet(name = "PunishmentHistoryServlet", urlPatterns = "/punishment-history")
public class PunishmentHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PunishmentHistoryForStaffDAO  dao = new PunishmentHistoryForStaffDAO();
        String customerName = req.getParameter("customerName");
        String sortByDate = req.getParameter("sortByDate");

        try {
            List<PunishmentHistoryDTO> punishmentList;
            if (customerName != null && !customerName.isEmpty()) {
                punishmentList = dao.filterByCustomerName(customerName);
            } else if (sortByDate != null && (sortByDate.equals("asc") || sortByDate.equals("desc"))) {
                punishmentList = dao.sortByDate(sortByDate);
            } else {
                punishmentList = dao.getPunishmentHistories();
            }
            req.setAttribute("punishmentList", punishmentList);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
        }

        req.getRequestDispatcher("/views/staff/PunishmentHistory.jsp").forward(req, resp);
    }
    //
}
