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
        try {
            List<Punishments> punishments = punishmentService.getAllPunishments();
            req.setAttribute("punishments", punishments);
            req.getRequestDispatcher("/views/punishment/listPunishment.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}