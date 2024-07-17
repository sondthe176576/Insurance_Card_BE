package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.ViewContractService;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "ViewContractController", urlPatterns = "/viewContract")
public class ViewContractController extends HttpServlet {
    // Khai bao viewContractService
    private ViewContractService viewContractService;

    // Khoi tao viewContractService
    public ViewContractController() {
        this.viewContractService = new ViewContractService();
    }

    // Ham doGet de hien thi trang xem contract
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contractIDStr = req.getParameter("contractID");
        int contractID = Integer.parseInt(contractIDStr);
        Contract contract = viewContractService.getContractDetailByID(contractID);

        // Tinh so ngay con lai cua hop dong
        Date currentDate = new Date();
        long diff = contract.getEndDate().getTime() - currentDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        req.setAttribute("diffDays", diffDays);

        req.setAttribute("contract", contract);
        req.getRequestDispatcher("/views/contract/viewContract.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contractIDStr = req.getParameter("contractID");
        int contractID = Integer.parseInt(contractIDStr);
        Contract contract = viewContractService.getContractDetailByID(contractID);

        boolean isUpdated = viewContractService.updatePaymentDetails(contractID, "Paid", new Date());

        if (isUpdated) {
            viewContractService.sendPaymentConfirmationEmail(contract);

            req.setAttribute("message", "Payment successful and email notification sent to the customer.");
            req.setAttribute("status", true);
        } else {
            req.setAttribute("message", "Payment unsuccessful. Please try again.");
            req.setAttribute("status", false);
        }

        doGet(req, resp);
    }
}