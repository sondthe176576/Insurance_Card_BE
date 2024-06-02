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
    private ViewContractService viewContractService;

    public ViewContractController() {
        this.viewContractService = new ViewContractService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int contractID = 1;
        Contract contract = viewContractService.getContractDetailByID(contractID);

        // Tinh toan thoi gian con lai cua hop dong
        Date currentDate = new Date();
        long diff = contract.getEndDate().getTime() - currentDate.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        req.setAttribute("diffDays", diffDays);

        req.setAttribute("contract", contract);
        req.getRequestDispatcher("/views/contract/viewContract.jsp").forward(req, resp);
    }
}