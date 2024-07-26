package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.service.RequestRenewContractService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RequestRenewContractController", urlPatterns = "/requestRenewContract")
public class RequestRenewContractController extends HttpServlet {
    private RequestRenewContractService requestRenewContractService;

    @Override
    public void init() throws ServletException {
        requestRenewContractService = new RequestRenewContractService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contractIdStr = request.getParameter("contractId");
        String renewYearsStr = request.getParameter("renewYears");
        String customerEmail = request.getParameter("customerEmail");

        System.out.println("contractId: " + contractIdStr);
        System.out.println("renewYears: " + renewYearsStr);
        System.out.println("customerEmail: " + customerEmail);

        if (contractIdStr == null || contractIdStr.isEmpty() || renewYearsStr == null || renewYearsStr.isEmpty() || customerEmail == null || customerEmail.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters.");
            return;
        }

        try {
            int contractID = Integer.parseInt(contractIdStr);
            int renewYears = Integer.parseInt(renewYearsStr);

            // Gửi yêu cầu gia hạn hợp đồng
            requestRenewContractService.requestRenewContract(contractID, renewYears, customerEmail);

            // Chuyển hướng đến trang thông báo thành công
            response.sendRedirect(request.getContextPath() + "/views/contract/successRenew.jsp");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to request renew contract.");
        }
    }
}