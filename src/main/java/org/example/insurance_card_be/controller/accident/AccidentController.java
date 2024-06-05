package org.example.insurance_card_be.controller.accident;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Accident;
import org.example.insurance_card_be.service.AccidentService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AccidentController", urlPatterns = "/listAccident")
public class AccidentController extends HttpServlet {
    // Khai bao accidentService
    private AccidentService accidentService;

    // Khoi tao accidentService
    public AccidentController() {
        Connection connection = DBContext.getConnection();
        this.accidentService = new AccidentService(connection);
    }

    // Ham doGet de hien thi trang list accident
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/listAccident".equals(path)) {
            listAccident(req, resp);
        } else if ("/accident/view".equals(path)) {
            viewAccident(req, resp);
        }
    }

    // Ham listAccident de hien thi danh sach cac tai nan
    private void listAccident(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int page = 1;
            int limit = 10;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            if (req.getParameter("limit") != null) {
                limit = Integer.parseInt(req.getParameter("limit"));
            }
            String status = req.getParameter("status");
            String customerName = req.getParameter("customerName");
            List<Accident> accidents = accidentService.getAllAccidents(page, limit, status, customerName);
            int totalAccidents = accidentService.getTotalAccidents(status, customerName);
            int totalPages = (int) Math.ceil((double) totalAccidents / limit);
            req.setAttribute("accidents", accidents);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("currentPage", page);
            req.setAttribute("status", status);
            req.setAttribute("customerName", customerName); // Add this line to pass customerName to the JSP
            req.getRequestDispatcher("/views/accident/listAccident.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Ham viewAccident de hien thi thong tin cua mot tai nan
    private void viewAccident(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int accidentID = Integer.parseInt(req.getParameter("accidentID"));
            Accident accident = accidentService.getAccidentByID(accidentID);
            req.setAttribute("accident", accident);
            req.getRequestDispatcher("/views/accident/viewAccident.jsp").forward(req, resp);
        } catch (SQLException | ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
