package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.ContractService;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ViewBillController", urlPatterns = "/viewBill")
public class ViewBillController extends HttpServlet {
    private ContractService contractService;

    @Override
    public void init() throws ServletException {
        this.contractService = new ContractService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contractIDStr = req.getParameter("contractID");
        int contractID = Integer.parseInt(contractIDStr);

        try {
            Contract contract = contractService.getContractByID(contractID);

            req.setAttribute("contract", contract);
            req.setAttribute("message", "Your contract has been created and is pending processing. You will be notified once it is approved.");
            req.getRequestDispatcher("/views/contract/viewBill.jsp").forward(req, resp);
        } catch (Exception e) {
            Logger logger = Logger.getLogger(ViewBillController.class.getName());
            logger.log(Level.SEVERE, "Failed to load contract or payment history!", e);
            req.setAttribute("message", "Failed to load contract or payment history: " + e.getMessage());
            req.setAttribute("status", false);
            req.getRequestDispatcher("/views/contract/viewBill.jsp").forward(req, resp);
        }
    }
}