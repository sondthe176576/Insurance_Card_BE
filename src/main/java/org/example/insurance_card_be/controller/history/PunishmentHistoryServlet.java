package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.model.PunishmentHistoryCus;
import org.example.insurance_card_be.service.PunishmentHistoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/punishmentHistory")
public class PunishmentHistoryServlet extends HttpServlet {
    private PunishmentHistoryService punishmentHistoryService;

    @Override
    public void init() throws ServletException {
        super.init();
        punishmentHistoryService = new PunishmentHistoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null || action.isEmpty()) {
                List<PunishmentHistoryCus> list = punishmentHistoryService.getAllPunishmentHistories();
                request.setAttribute("punishmentHistories", list);
                request.getRequestDispatcher("/views/history/punishmentHistory.jsp").forward(request, response);
            } else if ("view".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                PunishmentHistoryCus punishmentHistoryCus = punishmentHistoryService.getPunishmentHistoryById(id);
                request.setAttribute("punishmentHistory", punishmentHistoryCus);
                request.getRequestDispatcher("/views/history/viewPunishmentHistory.jsp").forward(request, response);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("punishmentID"));
                PunishmentHistoryCus punishmentHistoryCus = punishmentHistoryService.getPunishmentHistoryById(id);
                request.setAttribute("punishmentHistory", punishmentHistoryCus);
                request.getRequestDispatcher("/views/history/editPunishmentHistory.jsp").forward(request, response);
            } else if ("listByCustomerID".equals(action)) {
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                List<PunishmentHistoryCus> list = punishmentHistoryService.getPunishmentHistoriesByCustomerID(customerID);
                request.setAttribute("punishmentHistories", list);
                request.getRequestDispatcher("/views/history/punishmentHistory.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
        } catch (Exception e) {
            throw new ServletException("Error processing request", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            String description = request.getParameter("description");
            Date date = new Date();  // Assuming the current date

            PunishmentHistoryCus punishmentHistoryCus = new PunishmentHistoryCus(0, customerID, description, date);
            punishmentHistoryService.addPunishmentHistory(punishmentHistoryCus);
            response.sendRedirect("punishmentHistory");
        } else if ("update".equals(action)) {
            int punishmentID = Integer.parseInt(request.getParameter("punishmentID"));
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            String description = request.getParameter("description");
            Date date = new Date();  // Assuming the current date

            PunishmentHistoryCus punishmentHistoryCus = new PunishmentHistoryCus(punishmentID, customerID, description, date);
            punishmentHistoryService.updatePunishmentHistory(punishmentHistoryCus);
            response.sendRedirect("punishmentHistory");
        } else if ("delete".equals(action)) {
            int punishmentID = Integer.parseInt(request.getParameter("punishmentID"));
            punishmentHistoryService.deletePunishmentHistory(punishmentID);
            response.sendRedirect("punishmentHistory");
        }
    }

}
