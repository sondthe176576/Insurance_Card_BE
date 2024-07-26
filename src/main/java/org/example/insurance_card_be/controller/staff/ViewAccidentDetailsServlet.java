package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.implement.AccidentHistoryForStaffDAO;
import org.example.insurance_card_be.model.Accident;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ViewAccidentDetailsServlet", urlPatterns = "/viewAccidentDetails")
public class ViewAccidentDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int accidentID = Integer.parseInt(req.getParameter("accidentID"));
        AccidentHistoryForStaffDAO dao = new AccidentHistoryForStaffDAO();

        try {
            Accident accident = dao.getAccidentByID(accidentID);
            if (accident != null) {
                req.setAttribute("accident", accident);
                req.getRequestDispatcher("/views/staff/accidentHistoryDetail.jsp").forward(req, resp);
            } else {
                resp.sendRedirect(req.getContextPath() + "/error.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
    }
}
