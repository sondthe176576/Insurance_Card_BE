package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.ListRenewContractService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListRenewContractController", urlPatterns = "/listRenewContract")
public class ListRenewContractController extends HttpServlet {
    private ListRenewContractService listRenewContractService;

    public ListRenewContractController() {
        this.listRenewContractService = new ListRenewContractService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/listRenewContract".equals(path)) {
            listRenewContracts(req, resp);
        } else if ("/contract/renew".equals(path)) {
            renewContract(req, resp);
        }
    }

    private void listRenewContracts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int page = 1;
            int limit = 10;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            String customerName = req.getParameter("customerName");
            Map<Contract, Integer> contractDaysOverdueMap = listRenewContractService.getExpiredContracts(page, limit, customerName);
            int totalContracts = listRenewContractService.getTotalExpiredContracts(customerName);
            int totalPages = (int) Math.ceil((double) totalContracts / limit);
            req.setAttribute("contractDaysOverdueMap", contractDaysOverdueMap);
            req.setAttribute("totalContracts", totalContracts);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("currentPage", page);
            req.setAttribute("customerName", customerName);
            req.getRequestDispatcher("/views/contract/listRenewContract.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void renewContract(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Implement logic to renew contract here
    }
}