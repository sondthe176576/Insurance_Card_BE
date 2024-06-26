package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.model.AccidentHistoryCus;
import org.example.insurance_card_be.service.AccidentHistoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/accidentHistory")
public class AccidentHistoryServlet extends HttpServlet {
    private AccidentHistoryService accidentHistoryService;

    @Override
    public void init() {
        accidentHistoryService = new AccidentHistoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            List<AccidentHistoryCus> list = accidentHistoryService.getAllAccidentHistories();
            request.setAttribute("accidentHistories", list);
            request.getRequestDispatcher("/views/history/accidentHistory.jsp").forward(request, response);
        } else if ("view".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            AccidentHistoryCus accidentHistoryCus = accidentHistoryService.getAccidentHistoryById(id);
            request.setAttribute("accidentHistoryCus", accidentHistoryCus);
            request.getRequestDispatcher("/views/history/viewAccidentHistory.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            AccidentHistoryCus accidentHistoryCus = accidentHistoryService.getAccidentHistoryById(id);
            request.setAttribute("accidentHistoryCus", accidentHistoryCus);
            request.getRequestDispatcher("/views/history/editAccidentHistory.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            String description = request.getParameter("description");
            Date accidentDate = Date.valueOf(request.getParameter("accidentDate"));

            AccidentHistoryCus accidentHistoryCus = new AccidentHistoryCus(0, customerID, description, accidentDate);
            accidentHistoryService.addAccidentHistory(accidentHistoryCus);
            response.sendRedirect(request.getContextPath() + "/views/history/pending.jsp");
        } else if ("update".equals(action)) {
            int accidentID = Integer.parseInt(request.getParameter("accidentID"));
            int customerID = Integer.parseInt(request.getParameter("customerID"));
            String description = request.getParameter("description");
            Date accidentDate = Date.valueOf(request.getParameter("accidentDate"));

            AccidentHistoryCus accidentHistoryCus = new AccidentHistoryCus(accidentID, customerID, description, accidentDate);
            accidentHistoryService.updateAccidentHistory(accidentHistoryCus);
            response.sendRedirect("accidentHistory");
        } else if ("delete".equals(action)) {
            int accidentID = Integer.parseInt(request.getParameter("accidentID"));
            accidentHistoryService.deleteAccidentHistory(accidentID);
            response.sendRedirect("accidentHistory");
        }
    }
}
