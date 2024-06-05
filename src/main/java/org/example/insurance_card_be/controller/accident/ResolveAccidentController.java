package org.example.insurance_card_be.controller.accident;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Accident;
import org.example.insurance_card_be.service.ResolveAccidentService;

import java.io.IOException;

@WebServlet(name = "ResolveAccidentController", urlPatterns = "/resolveAccident")
public class ResolveAccidentController extends HttpServlet {
    // Khai bao resolveAccidentService
    private ResolveAccidentService resolveAccidentService;

    // Khoi tao resolveAccidentService
    public ResolveAccidentController() {
        resolveAccidentService = new ResolveAccidentService();
    }

    // Ham doGet de hien thi trang resolve accident
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int accidentID = Integer.parseInt(req.getParameter("accidentID"));
        Accident accident = resolveAccidentService.getAccidentByID(accidentID);
        req.setAttribute("accident", accident);
        req.getRequestDispatcher("/views/accident/resolveAccident.jsp").forward(req, resp);
    }

    // Ham doPost de cap nhat trang thai tai nan
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int accidentID = Integer.parseInt(req.getParameter("accidentID"));
        String status = req.getParameter("status");
        resolveAccidentService.updateAccidentStatus(accidentID, status);
        resp.sendRedirect(req.getContextPath() + "/listAccident");
    }
}
