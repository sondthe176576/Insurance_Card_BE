package org.example.insurance_card_be.controller.punishment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Punishments;
import org.example.insurance_card_be.service.ResolvePunishmentService;

import java.io.IOException;

@WebServlet(name = "ResolvePunishmentController", value = "/resolvePunishment")
public class ResolvePunishmentController extends HttpServlet {
    private ResolvePunishmentService resolvePunishmentService;

    public ResolvePunishmentController() {
        resolvePunishmentService = new ResolvePunishmentService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int punishmentID = Integer.parseInt(req.getParameter("punishmentID"));
        Punishments punishment = resolvePunishmentService.getPunishmentByID(punishmentID);
        if (punishment != null) {
            req.setAttribute("punishment", punishment);
            req.getRequestDispatcher("/views/punishment/resolvePunishment.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Punishment not found with ID " + punishmentID);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int punishmentID = Integer.parseInt(req.getParameter("punishmentID"));
        String status = req.getParameter("status");
        resolvePunishmentService.updatePunishmentStatus(punishmentID, status);
        resp.sendRedirect(req.getContextPath() + "/listPunishment");
    }
}