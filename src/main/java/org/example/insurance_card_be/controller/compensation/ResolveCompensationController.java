package org.example.insurance_card_be.controller.compensation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.CompensationRequests;
import org.example.insurance_card_be.service.ResolveCompensationService;

import java.io.IOException;

@WebServlet(name = "ResolveCompensationController", urlPatterns = "/resolveCompensation")
public class ResolveCompensationController extends HttpServlet {
    // Khai bao resolveCompensationService
    private ResolveCompensationService resolveCompensationService;

    // Khoi tao resolveCompensationService
    public ResolveCompensationController() {
        resolveCompensationService = new ResolveCompensationService();
    }

    // Ham doGet de hien thi trang resolve compensation
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int compensationID = Integer.parseInt(req.getParameter("compensationID"));
        CompensationRequests compensationRequest = resolveCompensationService.resolveCompensation(compensationID);
        req.setAttribute("compensation", compensationRequest);
        req.getRequestDispatcher("/views/compensation/resolveCompensation.jsp").forward(req, resp);
    }

    // Ham doPost de cap nhat trang thai cua yeu cau boi thuong
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int requestID = Integer.parseInt(req.getParameter("requestID"));
        String status = req.getParameter("status");
        resolveCompensationService.updateCompensationRequestStatus(requestID, status);
        resp.sendRedirect(req.getContextPath() + "/listCompensation");
    }
}