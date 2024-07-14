package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.utils.DateUtils;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.ResolveWaitingContractsService;
import org.example.insurance_card_be.service.ViewContractService;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@WebServlet(name = "ResolveWaitingContractController", urlPatterns = "/resolveWaitingContract")
public class ResolveWaitingContractController extends HttpServlet {
    private ResolveWaitingContractsService resolveWaitingContractsService;

    public ResolveWaitingContractController() {
        this.resolveWaitingContractsService = new ResolveWaitingContractsService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contractIDStr = req.getParameter("contractID");
        int contractID = Integer.parseInt(contractIDStr);
        Contract contract = resolveWaitingContractsService.getContractDetailByID(contractID);

        // Tính toán số ngày còn lại
        Date endDate = contract.getEndDate();
        LocalDate endLocalDate = Instant.ofEpochMilli(endDate.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate currentDate = LocalDate.now();
        long diffDays = ChronoUnit.DAYS.between(currentDate, endLocalDate);

        // Truyền diffDays và contract đến JSP
        req.setAttribute("diffDays", diffDays);
        req.setAttribute("contract", contract);
        req.getRequestDispatcher("/views/contract/resolveWaitingContracts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        String contractIDStr = req.getParameter("contractID");
        int contractID = Integer.parseInt(contractIDStr);

        if ("accept".equals(action)) {
            resolveWaitingContractsService.updateContractStatus(contractID, "Accepted", session);
        } else if ("reject".equals(action)) {
            resolveWaitingContractsService.updateContractStatus(contractID, "Rejected", session);
        }

        resp.sendRedirect(req.getContextPath() + "/listWaitingContract");
    }
}