package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.implement.AccidentHistoryForStaffDAO;
import org.example.insurance_card_be.model.Accident;
import org.example.insurance_card_be.model.AccidentHistoryDTO;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ViewAccidentDetailsServlet", urlPatterns = "/viewAccidentDetails")
public class ViewAccidentDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int accidentID = Integer.parseInt(req.getParameter("accidentID"));


        try {
            AccidentHistoryForStaffDAO dao = new AccidentHistoryForStaffDAO();
            AccidentHistoryDTO accidentHistory = dao.getAccidentByID(accidentID);
            if (accidentHistory != null) {
                req.setAttribute("accidentHistories", accidentHistory);
                req.getRequestDispatcher("/views/staff/accidentHistoryDetail.jsp").forward(req, resp);
            } else {
                System.out.println("No accident history found for ID: " + accidentID);
                resp.sendRedirect(req.getContextPath() + "/error.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
    //
}
