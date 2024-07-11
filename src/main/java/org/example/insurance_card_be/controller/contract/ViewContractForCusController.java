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

@WebServlet(name = "ViewContractForCusController", urlPatterns = "/viewContractForCus")
public class ViewContractForCusController extends HttpServlet {
    private ViewContractService viewContractService;

    public ViewContractForCusController() {
        this.viewContractService = new ViewContractService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contractIDStr = req.getParameter("contractID");
        int contractID = Integer.parseInt(contractIDStr);
        Contract contract = viewContractService.getContractDetailByID(contractID);

        // Tính số ngày còn lại của hợp đồng
        Date currentDate = new Date();
        long diff = contract.getEndDate().getTime() - currentDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        req.setAttribute("diffDays", diffDays);

        req.setAttribute("contract", contract);
        req.getRequestDispatcher("/views/contract/viewContractForCustomer.jsp").forward(req, resp);
    }
}
