package org.example.insurance_card_be.controller.compensation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.service.CompensationService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CompensationController", urlPatterns = "/listCompensation")
public class CompensationController extends HttpServlet {
    // Khai bao compensationService
    private CompensationService compensationService;

    // Khoi tao compensationService
    public CompensationController() {
        Connection connection = DBContext.getConnection();
        this.compensationService = new CompensationService(connection);
    }

    // Ham doGet de hien thi trang list compensation
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath(); // Lay path
        if ("/listCompensation".equals(path)) { // Neu path la /listCompensation
            listCompensation(req, resp); // Goi ham listCompensation
        }
    }

    // Ham listCompensation de hien thi danh sach cac yeu cau boi thuong
    private void listCompensation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        int limit = 10;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String status = req.getParameter("status");
        String customerName = req.getParameter("customerName");
        try {
            List<CompensationRequests> requests = compensationService.getAllCompensationRequests(page, limit, status, customerName);
            int totalRequests = compensationService.getTotalCompensationRequests(status, customerName);
            int totalPages = (int) Math.ceil((double) totalRequests / limit);
            req.setAttribute("requests", requests);
            req.setAttribute("totalRequests", totalRequests);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("currentPage", page);
            req.setAttribute("customerName", customerName); // Add this line to pass customerName to the JSP
            req.getRequestDispatcher("/views/compensation/listCompensation.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Ham doPost de cap nhat trang thai cua yeu cau boi thuong
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int requestID = Integer.parseInt(req.getParameter("requestID"));
        String status = req.getParameter("status");
        try {
            compensationService.updateCompensationRequestStatus(requestID, status);
            resp.sendRedirect(req.getContextPath() + "/listCompensation");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}