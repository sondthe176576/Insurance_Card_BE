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
            int page = 1;
            int limit = 10;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            String status = "Pending";
            String customerName = req.getParameter("customerName");
            String startDate = req.getParameter("startDate");
            String insuranceType = req.getParameter("insuranceType");

            List<Contract> waitingContracts = waitingContractService.getWaitingContracts(status, customerName, startDate, insuranceType, page, limit);
            int totalContracts = waitingContractService.getTotalContractsByStatus(status, customerName, startDate, insuranceType);
            int totalPages = (int) Math.ceil((double) totalContracts / limit);

            req.setAttribute("waitingContracts", waitingContracts);
            req.setAttribute("totalContracts", totalContracts);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("currentPage", page);
            req.setAttribute("customerName", customerName);
            req.setAttribute("startDate", startDate);
            req.setAttribute("insuranceType", insuranceType);
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