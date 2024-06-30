package org.example.insurance_card_be.controller.contract;

import org.example.insurance_card_be.dao.implement.ContractDetailDAO;
import org.example.insurance_card_be.model.Contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ContractDetailServlet", urlPatterns = {"/contractDetail/*"})
public class ContractDetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.isEmpty() || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Contract ID parameter is missing");
            return;
        }
        String contractIdString = pathInfo.substring(1);
        int contractId;
        try {
            contractId = Integer.parseInt(contractIdString);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid contract ID");
            return;
        }

        ContractDetailDAO contractDetailDAO = new ContractDetailDAO();
        try {
            Contract contract = contractDetailDAO.getContractDetailById(contractId);
            if (contract == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Contract not found");
                return;
            }

            request.setAttribute("contract", contract);
            request.getRequestDispatcher("/views/contract/InformationContract.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to retrieve contract details");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("renew".equals(action)) {
            // Logic to handle renewing the contract
            int contractId = Integer.parseInt(request.getParameter("contractId"));
            // Implement your logic here

            // Redirect to pending.jsp after processing
            response.sendRedirect(request.getContextPath() + "/views/history/pending.jsp");
        } else if ("cancel".equals(action)) {
            // Logic to handle cancelling the contract
            int contractId = Integer.parseInt(request.getParameter("contractId"));
            // Implement your logic here
            response.sendRedirect(request.getContextPath() + "/contractDetail/" + contractId);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }
}
