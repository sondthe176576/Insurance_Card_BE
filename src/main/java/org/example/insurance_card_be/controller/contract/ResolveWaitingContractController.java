package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.ResolveWaitingContractsService;
import org.example.insurance_card_be.service.ViewContractService;

import java.io.IOException;
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

        Date currentDate = new Date();
        long diff = contract.getEndDate().getTime() - currentDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        req.setAttribute("diffDays", diffDays);

        req.setAttribute("contract", contract);
        req.getRequestDispatcher("/views/contract/resolveWaitingContracts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String contractIDStr = req.getParameter("contractID");
        int contractID = Integer.parseInt(contractIDStr);

        if ("accept".equals(action)) {
            resolveWaitingContractsService.updateContractStatus(contractID, "Accepted");
        } else if ("reject".equals(action)) {
            resolveWaitingContractsService.updateContractStatus(contractID, "Rejected");
        }

        resp.sendRedirect(req.getContextPath() + "/listContracts");
    }
}