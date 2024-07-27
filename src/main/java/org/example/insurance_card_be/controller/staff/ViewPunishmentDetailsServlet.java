package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.implement.PunishmentHistoryForStaffDAO;
import org.example.insurance_card_be.model.Punishments;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ViewPunishmentDetailsServlet", urlPatterns = "/viewPunishmentDetails")
public class ViewPunishmentDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int punishmentID = Integer.parseInt(req.getParameter("punishmentID"));
            PunishmentHistoryForStaffDAO dao = new PunishmentHistoryForStaffDAO();
            Punishments punishment = PunishmentHistoryForStaffDAO.getPunishmentByID(punishmentID);

            if (punishment != null) {
                req.setAttribute("punishment", punishment);
                req.getRequestDispatcher("/views/staff/punishmentDetail.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Punishment not found.");
                req.getRequestDispatcher("/views/staff/punishmentDetail.jsp").forward(req, resp);
            }
        } catch (NumberFormatException | SQLException e) {
            req.setAttribute("error", "Error retrieving punishment details: " + e.getMessage());
            req.getRequestDispatcher("/views/staff/punishmentDetail.jsp").forward(req, resp);
        }
    }
    //
}
