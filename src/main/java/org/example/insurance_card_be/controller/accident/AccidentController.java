package org.example.insurance_card_be.controller.accident;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.service.AccidentService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AccidentController", urlPatterns = "/listAccident")
public class AccidentController extends HttpServlet {
    private AccidentService accidentService;

    public AccidentController() {
        Connection connection = DBContext.getConnection();
        this.accidentService = new AccidentService(connection);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/listAccident".equals(path)) {
            listAccident(req, resp);
        } else if ("/accident/view".equals(path)) {
            viewAccident(req, resp);
        }
    }

    private void listAccident(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int page = 1;
            int limit = 10;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            String status = req.getParameter("status");
            String customerName = req.getParameter("customerName");
            try {
                List<Accident> accidents = accidentService.getAllAccidents(page, limit, status, customerName);
                int totalAccidents = accidentService.getTotalAccidents(status, customerName);
                int totalPages = (int) Math.ceil((double) totalAccidents / limit);
                req.setAttribute("accidents", accidents);
                req.setAttribute("totalAccidents", totalAccidents);
                req.setAttribute("totalPages", totalPages);
                req.setAttribute("currentPage", page);
                req.setAttribute("customerName", customerName);
                req.getRequestDispatcher("/views/accident/listAccident.jsp").forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void viewAccident(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int accidentID = Integer.parseInt(req.getParameter("accidentID"));
        String status = req.getParameter("status");
        try {
            accidentService.updateAccidentStatus(accidentID, status);
            resp.sendRedirect(req.getContextPath() + "/listAccident");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}