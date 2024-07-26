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
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

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

            // Tinh so ngay con lai cua hop dong
            Date currentDate = new Date();
            long diff = contract.getEndDate().getTime() - currentDate.getTime();
            long diffDays = diff / (24 * 60 * 60 * 1000);

            request.setAttribute("contract", contract);
            request.setAttribute("diffDays", diffDays);
            request.getRequestDispatcher("/views/contract/InformationContract.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to retrieve contract details");
        }
    }
}