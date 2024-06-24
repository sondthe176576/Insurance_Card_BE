package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.*;
import org.example.insurance_card_be.service.ContractService;
import org.example.insurance_card_be.service.CustomerService;
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
    // Khai bao contractService va customerService
    private ContractService contractService;
    private CustomerService customerService;
    private PaymentService paymentService;

    // Khoi tao contractService va customerService
    @Override
    public void init() throws ServletException {
        this.contractService = new ContractService();
        this.customerService = new CustomerService();
        this.paymentService = new PaymentService();
    }

    // Ham doGet de hien thi trang tao contract
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerIDstr = req.getParameter("customerID"); // Lay customerID tu request
        int customerID = Integer.parseInt(customerIDstr);

        try {
            Customers customer = customerService.getCustomerByID(customerID); // Lay thong tin customer
            List<Motorcycle> motorcycles = customerService.getMotorcyclesByCustomerID(customerID); // Lay danh sach xe may
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

    // Ham doPost de tao contract
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lay thong tin contract tu request
        String customerID = req.getParameter("customerID");
        String contractInfo = req.getParameter("contractInfo");
        String status = req.getParameter("status");
        String endDateStr = req.getParameter("endDate");
        String detail = req.getParameter("detail");
        String valueStr = req.getParameter("value");
        String coverage = req.getParameter("coverage");
        String insuranceType = req.getParameter("insuranceType");
        String premiumStr = req.getParameter("premium");
        String paymentMethod = req.getParameter("paymentMethod");
        String paymentMethodIDStr = req.getParameter("paymentMethodID");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Contract contract = new Contract();

        try {
            contract.setCustomerID(Integer.parseInt(customerID));
            contract.setContractInfo(contractInfo);
            contract.setStatus(status);
            contract.setStartDate(new Date());
            contract.setEndDate(sdf.parse(endDateStr));
            contract.setDetail(detail);
            contract.setValue(Double.parseDouble(valueStr));
            contract.setCoverage(coverage);
            contract.setInsuranceType(insuranceType);
            contract.setPremium(Double.parseDouble(premiumStr));

            contractService.createContract(contract);

            PaymentMethod paymentMethodObj = new PaymentMethod();
            paymentMethodObj.setCustomerID(Integer.parseInt(customerID));
            paymentMethodObj.setMethodType(paymentMethod);
            paymentMethodObj.setDetails("Payment method details");
            int paymentMethodID = paymentService.savePaymentMethod(paymentMethodObj);

            PaymentHistory paymentHistory = new PaymentHistory();
            paymentHistory.setCustomerID(Integer.parseInt(customerID));
            paymentHistory.setAmount(new BigDecimal(premiumStr));
            paymentHistory.setPaymentDate(new Date());
            paymentHistory.setPaymentMethodID(paymentMethodID);
            paymentHistory.setContractID(contract.getContractID());
            paymentService.savePaymentHistory(paymentHistory);

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