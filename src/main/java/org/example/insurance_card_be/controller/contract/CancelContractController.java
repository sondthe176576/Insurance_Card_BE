package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.service.CancelContractService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "CancelContractController", urlPatterns = "/cancelContract")
public class CancelContractController extends HttpServlet {
    private CancelContractService cancelContractService;

    @Override
    public void init() throws ServletException {
        // Khởi tạo CancelContractService mà không cần truyền kết nối
        cancelContractService = new CancelContractService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contractID = Integer.parseInt(request.getParameter("contractId"));
        double contractValue = Double.parseDouble(request.getParameter("contractValue"));

        try {
            cancelContractService.cancelContract(contractID, contractValue);
            response.sendRedirect(request.getContextPath() + "/views/contract/cancelContract.jsp"); // Chuyển hướng đến trang cancelContract.jsp
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}