package org.example.insurance_card_be.controller.compensation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.CompensationRequests;
import org.example.insurance_card_be.service.CompensationService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CompensationController", urlPatterns = "/listCompensation")
public class CompensationController extends HttpServlet {
    private CompensationService compensationService;

    public CompensationController() {
        Connection connection = DBContext.getConnection();
        this.compensationService = new CompensationService(connection);
    }

    // Ham doGet de hien thi danh sach yeu cau boi thuong
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int page = 1;
            int limit = 10;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            if (req.getParameter("limit") != null) {
                limit = Integer.parseInt(req.getParameter("limit"));
            }
            List<CompensationRequests> requests = compensationService.getAllCompensationRequests(page, limit);
            int totalRequests = compensationService.getTotalCompensationRequests();
            int totalPages = (int) Math.ceil((double) totalRequests / limit);
            req.setAttribute("requests", requests);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("currentPage", page);
            req.getRequestDispatcher("/views/compensation/listCompensation.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}