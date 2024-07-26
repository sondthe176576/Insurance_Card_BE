package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.RenewContractService;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "RenewContractController", urlPatterns = "/renewContract")
public class RenewContractController extends HttpServlet {
    private RenewContractService renewContractService;

    public RenewContractController() {
        this.renewContractService = new RenewContractService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        try {
            Contract contract = renewContractService.getContractDetailByID(contractID);
            req.setAttribute("contract", contract);
            req.getRequestDispatcher("/views/contract/renewContract.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("renew".equals(action)) {
            renewContract(req, resp);
        } else if ("expire".equals(action)) {
            sendExpirationNotification(req, resp);
        } else if ("confirmExpiration".equals(action)) {
            confirmContractExpiration(req, resp);
        }
    }

    private void renewContract(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        int renewalYears = Integer.parseInt(req.getParameter("renewalYears"));
        double premium = Double.parseDouble(req.getParameter("premium"));
        String newCoverage = req.getParameter("newCoverage");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.sql.Date newStartDate = new java.sql.Date(formatter.parse(req.getParameter("newStartDate")).getTime());

            Contract existingContract = renewContractService.getContractDetailByID(contractID);
            if (existingContract != null) {
                Contract contract = new Contract();
                contract.setContractID(contractID);
                contract.setCustomerID(existingContract.getCustomerID());
                contract.setContractInfo(existingContract.getContractInfo());
                contract.setStatus(existingContract.getStatus());
                contract.setStartDate(newStartDate);

                java.util.Calendar cal = java.util.Calendar.getInstance();
                cal.setTime(newStartDate);
                cal.add(java.util.Calendar.YEAR, renewalYears);
                java.sql.Date newEndDate = new java.sql.Date(cal.getTime().getTime());
                contract.setEndDate(newEndDate);

                double value = premium * renewalYears;
                contract.setValue(value);

                contract.setCoverage(newCoverage);
                contract.setInsuranceType(existingContract.getInsuranceType());
                contract.setPremium(premium);
                contract.setDetail(existingContract.getDetail());
                contract.setCustomer(existingContract.getCustomer());
                contract.setMotorcycle(existingContract.getMotorcycle());

                renewContractService.renewContract(contract);
                String customerName = contract.getCustomer().getUser().getFullName();
                String message = "The contract for customer " + customerName + " has been successfully renewed";
                String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8.toString());
                resp.sendRedirect(req.getContextPath() + "/listRenewContract?message=" + encodedMessage + "&status=true");
            } else {
                resp.sendRedirect(req.getContextPath() + "/listRenewContract?message=Contract+not+found&status=false");
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sendExpirationNotification(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        try {
            Contract contract = renewContractService.getContractDetailByID(contractID);
            if (contract != null) {
                renewContractService.sendExpirationNotification(contract);
                String message = "Expiration notification has been sent to the customer.";
                String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8.toString());
                resp.sendRedirect(req.getContextPath() + "/listRenewContract?message=" + encodedMessage + "&status=true");
            } else {
                resp.sendRedirect(req.getContextPath() + "/listRenewContract?message=Contract+not+found&status=false");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void confirmContractExpiration(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        try {
            Contract contract = renewContractService.getContractDetailByID(contractID);
            if (contract != null) {
                renewContractService.confirmContractExpiration(contract);
                renewContractService.sendExpirationConfirmationEmail(contract);
                String message = "The contract has been marked as expired.";
                String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8.toString());
                resp.sendRedirect(req.getContextPath() + "/listRenewContract?message=" + encodedMessage + "&status=true");
            } else {
                resp.sendRedirect(req.getContextPath() + "/listRenewContract?message=Contract+not+found&status=false");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}