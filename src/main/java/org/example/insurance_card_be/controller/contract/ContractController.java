package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.model.*;
import org.example.insurance_card_be.service.ContractService;
import org.example.insurance_card_be.service.CustomerService;
import org.example.insurance_card_be.service.NotificationService;
import org.example.insurance_card_be.service.PaymentService;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ContractController", urlPatterns = "/createContract")
public class ContractController extends HttpServlet {
    private ContractService contractService;
    private CustomerService customerService;
    private PaymentService paymentService;
    private NotificationService notificationService;

    @Override
    public void init() throws ServletException {
        this.contractService = new ContractService();
        this.customerService = new CustomerService();
        this.paymentService = new PaymentService();
        this.notificationService = new NotificationService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int customerID = (int) session.getAttribute("customerID");

        // Check if customerID is provided in request parameter
        String customerIDStr = req.getParameter("customerID");
        if (customerIDStr != null) {
            customerID = Integer.parseInt(customerIDStr);
        }

        try {
            Customers customer = customerService.getCustomerByID(customerID);
            List<Motorcycle> motorcycles = customerService.getMotorcyclesByCustomerID(customerID);
            req.setAttribute("customer", customer);
            req.setAttribute("motorcycles", motorcycles);
            req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
        } catch (SQLException e) {
            Logger logger = Logger.getLogger(ContractController.class.getName());
            logger.log(Level.SEVERE, "Failed to load customer or motorcycles!", e);
            req.setAttribute("message", "Failed to load customer or motorcycles: " + e.getMessage());
            req.setAttribute("status", false);
            req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int customerID = (int) session.getAttribute("customerID");

        String contractYearsStr = req.getParameter("contractYears");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        String insuranceType = req.getParameter("insuranceType");
        String contractInfo = req.getParameter("contractInfo");
        String valueStr = req.getParameter("value");
        String detail = req.getParameter("detail");
        String coverage = req.getParameter("coverage");
        String premiumStr = req.getParameter("premium");
        String paymentMethod = req.getParameter("paymentMethod");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Contract contract = new Contract();

        try {
            contract.setCustomerID(customerID);
            contract.setContractInfo(contractInfo);
            contract.setStatus("Pending");
            contract.setStartDate(new Date());
            contract.setEndDate(sdf.parse(endDateStr));
            contract.setDetail(detail);
            contract.setValue(Double.parseDouble(valueStr));
            contract.setCoverage(coverage);
            contract.setInsuranceType(insuranceType);
            contract.setPremium(Double.parseDouble(premiumStr));

            // Tạo contract và cập nhật PaymentMethod, PaymentHistory
            contractService.createContract(contract, paymentMethod);

            // Kiểm tra phương thức thanh toán
            if ("cash".equals(paymentMethod)) {
                resp.sendRedirect(req.getContextPath() + "/viewBill?contractID=" + contract.getContractID());
            } else if ("bankTransfer".equals(paymentMethod)) {
                resp.sendRedirect(req.getContextPath() + "/viewBill?contractID=" + contract.getContractID());
            } else {
                resp.sendRedirect(req.getContextPath() + "/contracts");
            }

        } catch (Exception e) {
            Logger logger = Logger.getLogger(ContractController.class.getName());
            logger.log(Level.SEVERE, "Failed to create contract!", e);
            req.setAttribute("message", "Failed to create contract: " + e.getMessage());
            req.setAttribute("status", false);
            req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
        }
    }
}