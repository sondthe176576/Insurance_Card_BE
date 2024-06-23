package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.model.CompensationHistoryCus;
import org.example.insurance_card_be.service.CompensationHistoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

    @WebServlet("/compensationHistory")
    public class CompensationHistoryServlet extends HttpServlet {
        private CompensationHistoryService compensationHistoryService;

        @Override
        public void init() {
            compensationHistoryService = new CompensationHistoryService();
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");

            if (action == null || action.isEmpty()) {
                List<CompensationHistoryCus> list = compensationHistoryService.getAllCompensationHistories();
                request.setAttribute("compensationHistories", list);
                request.getRequestDispatcher("/views/history/compensationHistory.jsp").forward(request, response);
            } else if ("view".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                CompensationHistoryCus compensationHistoryCus = compensationHistoryService.getCompensationHistoryById(id);
                request.setAttribute("compensationHistory", compensationHistoryCus);
                request.getRequestDispatcher("/views/history/compensationHistory.jsp").forward(request, response);
            } else if ("listByCustomerID".equals(action)) {
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                List<CompensationHistoryCus> list = compensationHistoryService.getCompensationHistoriesByCustomerID(customerID);
                request.setAttribute("compensationHistories", list);
                request.getRequestDispatcher("/views/history/compensationHistory.jsp").forward(request, response);
            }
        }


        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String action = request.getParameter("action");

            if ("add".equals(action)) {
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                BigDecimal amount = new BigDecimal(request.getParameter("amount"));
                Date date = new Date();  // Assuming the current date

                CompensationHistoryCus compensationHistoryCus = new CompensationHistoryCus(0, customerID, amount, date);
                compensationHistoryService.addCompensationHistory(compensationHistoryCus);
                response.sendRedirect("compensationHistory");
            } else if ("update".equals(action)) {
                int compensationID = Integer.parseInt(request.getParameter("compensationID"));
                int customerID = Integer.parseInt(request.getParameter("customerID"));
                BigDecimal amount = new BigDecimal(request.getParameter("amount"));
                Date date = new Date();  // Assuming the current date

                CompensationHistoryCus compensationHistoryCus = new CompensationHistoryCus(compensationID, customerID, amount, date);
                compensationHistoryService.updateCompensationHistory(compensationHistoryCus);
                response.sendRedirect("compensationHistory");
            } else if ("delete".equals(action)) {
                int compensationID = Integer.parseInt(request.getParameter("compensationID"));
                compensationHistoryService.deleteCompensationHistory(compensationID);
                response.sendRedirect("compensationHistory");
            }
        }
    }

