package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import org.example.insurance_card_be.dao.implement.AccidentHistoryDAO;
import org.example.insurance_card_be.dao.implement.AccidentHistoryForStaffDAO;
import org.example.insurance_card_be.model.AccidentHistory;

@WebServlet(name = "AccidentHistoryServlet", urlPatterns = "/accident-history")
public class AccidentHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccidentHistoryForStaffDAO dao = new AccidentHistoryForStaffDAO();
        String customerName = req.getParameter("customerName");
        String sortByDate = req.getParameter("sortByDate");

        try {
            List<AccidentHistory> accidentList;
            if (customerName != null && !customerName.isEmpty()) {
                accidentList = dao.filterByCustomerName(customerName);
            } else if (sortByDate != null && (sortByDate.equals("asc") || sortByDate.equals("desc"))) {
                accidentList = dao.sortByDate(sortByDate);
            } else {
                accidentList = dao.getApprovedAccidentHistories();
            }
            req.setAttribute("accidentList", accidentList);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
        }

        req.getRequestDispatcher("/views/staff/AccidentHistory.jsp").forward(req, resp);
    }
}
