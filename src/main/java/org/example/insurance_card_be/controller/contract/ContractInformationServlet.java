package org.example.insurance_card_be.controller.contract;

import org.example.insurance_card_be.model.ContractInformation;
import org.example.insurance_card_be.service.ContractInformationService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/contracts")
public class ContractInformationServlet extends HttpServlet {
    private ContractInformationService contractInformationService;

    @Override
    public void init() {
        contractInformationService = new ContractInformationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            List<ContractInformation> contracts = contractInformationService.getAllContracts();
            request.setAttribute("contracts", contracts);
            request.getRequestDispatcher("/views/contract/ContractList.jsp").forward(request, response);
        } else if ("view".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractInformation contract = contractInformationService.getContractById(id);
            request.setAttribute("contract", contract);
            request.getRequestDispatcher("/views/contract/InformationContract.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            ContractInformation contract = contractInformationService.getContractById(id);
            request.setAttribute("contract", contract);
            request.getRequestDispatcher("/views/contract/EditContract.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            String contractInfo = request.getParameter("contractInfo");
            String status = request.getParameter("status");
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));

            ContractInformation contract = new ContractInformation(0, customerId, contractInfo, status, startDate, endDate);
            contractInformationService.addContract(contract);
            response.sendRedirect("contracts");
        } else if ("update".equals(action)) {
            int contractId = Integer.parseInt(request.getParameter("contractId"));
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            String contractInfo = request.getParameter("contractInfo");
            String status = request.getParameter("status");
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));

            ContractInformation contract = new ContractInformation(contractId, customerId, contractInfo, status, startDate, endDate);
            contractInformationService.updateContract(contract);
            response.sendRedirect("contracts");
        } else if ("delete".equals(action)) {
            int contractId = Integer.parseInt(request.getParameter("contractId"));
            contractInformationService.deleteContract(contractId);
            response.sendRedirect("contracts");
        }
    }
}

