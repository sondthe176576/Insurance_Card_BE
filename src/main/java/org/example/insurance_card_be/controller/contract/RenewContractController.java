package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.RenewContractService;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "RenewContractController", urlPatterns = "/renewContract")
public class RenewContractController extends HttpServlet {
    // Khai bao renewContractService
    private RenewContractService renewContractService;

    // Khoi tao renewContractService
    public RenewContractController() {
        this.renewContractService = new RenewContractService();
    }

    // Ham doGet de hien thi trang renew contract
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        try {
            Contract contract = renewContractService.geContractDetailByID(contractID);
            req.setAttribute("contract", contract);
            req.getRequestDispatcher("/views/contract/renewContract.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Ham doPost de renew contract
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lay thong tin contract tu request
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        String newContractInfo = req.getParameter("newContractInfo");
        String renewalDateStr = req.getParameter("renewalDate");
        double newPremium = Double.parseDouble(req.getParameter("newPremium"));
        String newCoverage = req.getParameter("newCoverage");

        Contract contract = new Contract();
        contract.setContractID(contractID);
        contract.setContractInfo(newContractInfo);
        contract.setPremium(newPremium);
        contract.setCoverage(newCoverage);

        // Xu ly ngay
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.sql.Date newEndDate = new java.sql.Date(formatter.parse(renewalDateStr).getTime());
            contract.setEndDate(newEndDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        try {
            renewContractService.renewContract(contract);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/viewContract?contractID=" + contractID + "&message=Renew+contract+successfully&status=true");
    }
}