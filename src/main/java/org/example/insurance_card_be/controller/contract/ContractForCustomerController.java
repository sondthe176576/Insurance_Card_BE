package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.ContractDetailDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Users;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/contractForCustomer")
public class ContractForCustomerController extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ContractForCustomerController.class.getName());
    private ContractDetailDAO contractDetailDAO = new ContractDetailDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        Users user = (Users) session.getAttribute("user");
        int customerID = (int) session.getAttribute("customerID");

//        try {
////            List<Contract> contracts = contractDetailDAO.getContractsByCustomerID(customerID);
////            request.setAttribute("contracts", contracts);
//            request.getRequestDispatcher("/views/contract/contractForCustomer.jsp").forward(request, response);
////        } catch (SQLException e) {
//            LOGGER.severe("Failed to retrieve contract details: " + e.getMessage());
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to retrieve contract details");
//        }
    }
}