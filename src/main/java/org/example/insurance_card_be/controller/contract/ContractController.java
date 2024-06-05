package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;
import org.example.insurance_card_be.service.ContractService;
import org.example.insurance_card_be.service.CustomerService;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ContractController", urlPatterns = "/createContract")
public class ContractController extends HttpServlet {
    // Khai bao contractService va customerService
    private ContractService contractService;
    private CustomerService customerService;

    // Khoi tao contractService va customerService
    @Override
    public void init() throws ServletException {
        this.contractService = new ContractService();
        this.customerService = new CustomerService();
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
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        String detail = req.getParameter("detail");
        String valueStr = req.getParameter("value");
        String coverage = req.getParameter("coverage");
        String insuranceType = req.getParameter("insuranceType");
        String premiumStr = req.getParameter("premium");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Dinh dang ngay thang
        Contract contract = new Contract();
        try {
            contract.setCustomerID(Integer.parseInt(customerID));
            contract.setContractInfo(contractInfo);
            contract.setStatus(status);
            contract.setStartDate(sdf.parse(startDateStr));
            contract.setEndDate(sdf.parse(endDateStr));
            contract.setDetail(detail);
            contract.setValue(Double.parseDouble(valueStr));
            contract.setCoverage(coverage);
            contract.setInsuranceType(insuranceType);
            contract.setPremium(Double.parseDouble(premiumStr));

            contractService.createContract(contract); // Tao contract
            req.setAttribute("message", "Create contract successfully!");
            req.setAttribute("status", true);
        } catch (ParseException | SQLException e) {
            Logger logger = Logger.getLogger(ContractController.class.getName()); // Log loi
            logger.log(Level.SEVERE, "Create contract failure!", e);
            req.setAttribute("message", "Create contract failure!" + e.getMessage()); // Thong bao loi
            req.setAttribute("status", true); // Thong bao danger
            e.printStackTrace();
        }
        req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
    }
}