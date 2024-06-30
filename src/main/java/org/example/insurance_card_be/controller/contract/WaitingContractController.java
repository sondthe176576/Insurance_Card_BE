package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.WaitingContractService;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "WaitingContractController", urlPatterns = "/listWaitingContract")
public class WaitingContractController extends HttpServlet {
    private WaitingContractService waitingContractService;

    @Override
    public void init() throws ServletException {
        this.waitingContractService = new WaitingContractService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Contract> waitingContracts = waitingContractService.getWaitingContracts();
            req.setAttribute("waitingContracts", waitingContracts);
            req.getRequestDispatcher("/views/contract/waitingContracts.jsp").forward(req, resp);
        } catch (Exception e) {
            Logger logger = Logger.getLogger(WaitingContractController.class.getName());
            logger.log(Level.SEVERE, "Failed to load waiting contracts!", e);
            req.setAttribute("message", "Failed to load waiting contracts: " + e.getMessage());
            req.setAttribute("status", false);
            req.getRequestDispatcher("/views/contract/waitingContracts.jsp").forward(req, resp);
        }
    }
}