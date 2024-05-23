package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.service.ContractService;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ContractController", urlPatterns = "/createContract")
public class ContractController extends HttpServlet {
    // Controller dung de xu ly request cua contract
    private ContractService contractService;

    // Khoi tao contractService
    @Override
    public void init() throws ServletException {
        this.contractService = new ContractService();
    }

    // Ham get de hien thi trang tao contract
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
    }

    // Ham post de tao contract
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lay thong tin tu request
        String customerID = req.getParameter("customerID");
        String contractInfo = req.getParameter("contractInfo");
        String status = req.getParameter("status");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        String detail = req.getParameter("detail");
        String valueStr = req.getParameter("value");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Format date
        Contract contract = new Contract();
        try {
            contract.setCustomerID(Integer.parseInt(customerID));
            contract.setContractInfo(contractInfo);
            contract.setStatus(status);
            contract.setStartDate(sdf.parse(startDateStr));
            contract.setEndDate(sdf.parse(endDateStr));
            contract.setDetail(detail);
            contract.setValue(Double.parseDouble(valueStr));


            contractService.createContract(contract); // Tao contract
            req.setAttribute("message", "Create contract successfully!");
            req.setAttribute("status", "success");
        } catch (ParseException | SQLException e) {
            Logger logger = Logger.getLogger(ContractController.class.getName()); // Log loi
            logger.log(Level.SEVERE, "Create contract failure!", e);
            req.setAttribute("message", "Create contract failure!" + e.getMessage()); // Thong bao loi
            req.setAttribute("status", "danger"); // Thong bao danger
            e.printStackTrace();
        }
        req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
    }
}