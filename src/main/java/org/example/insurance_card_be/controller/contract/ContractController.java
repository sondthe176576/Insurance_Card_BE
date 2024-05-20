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

@WebServlet(name = "ContractController", urlPatterns = "/createContract")
public class ContractController extends HttpServlet {
    private ContractService contractService;

    @Override
    public void init() throws ServletException {
        this.contractService = new ContractService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customerID = req.getParameter("customerID");
        String contractInfo = req.getParameter("contractInfo");
        String status = req.getParameter("status");
        String startDateStr = req.getParameter("startDate");
        String endDateStr = req.getParameter("endDate");
        String detail = req.getParameter("detail");
        String valueStr = req.getParameter("value");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Contract contract = new Contract();
        contract.setCustomerID(Integer.parseInt(customerID));
        contract.setContractInfo(contractInfo);
        contract.setStatus(status);
        try {
            contract.setStartDate(sdf.parse(startDateStr));
            contract.setEndDate(sdf.parse(endDateStr));
            contract.setDetail(detail);
            contract.setValue(Double.parseDouble(valueStr));
            contractService.createContract(contract);
            req.setAttribute("message", "Create contract successfully!");
            req.setAttribute("status", "success");
        } catch (ParseException | SQLException e) {
            req.setAttribute("message", "Create contract failure!" + e.getMessage());
            req.setAttribute("status", "danger");
            e.printStackTrace();
        }
        req.getRequestDispatcher("/views/contract/createContract.jsp").forward(req, resp);
    }
}