package org.example.insurance_card_be.controller.punishment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.dao.implement.PunishmentDAO;
import org.example.insurance_card_be.model.Punishments;
import org.example.insurance_card_be.service.PunishmentService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "PunishmentController", urlPatterns = "/listPunishment")
public class PunishmentController extends HttpServlet {
    private PunishmentService punishmentService;

    public PunishmentController() {
        Connection connection = DBContext.getConnection();
        this.punishmentService = new PunishmentService(new PunishmentDAO(connection));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        listCancelledContracts(req, resp);
    }

    private void listCancelledContracts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int page = 1;
            int limit = 10;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            String status = req.getParameter("status");
            String customerName = req.getParameter("customerName");

            try {
                List<Punishments> punishments = punishmentService.getCancelledContractsBeforeExpiry(page, limit, status, customerName);
                int totalCancelledContracts = punishmentService.getTotalCancelledContracts();
                int totalPages = (int) Math.ceil((double) totalCancelledContracts / limit);

                req.setAttribute("punishments", punishments);
                req.setAttribute("totalCancelledContracts", totalCancelledContracts);
                req.setAttribute("totalPages", totalPages);
                req.setAttribute("currentPage", page);
                req.setAttribute("status", status);
                req.setAttribute("customerName", customerName);

                req.getRequestDispatcher("/views/punishment/listPunishment.jsp").forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}