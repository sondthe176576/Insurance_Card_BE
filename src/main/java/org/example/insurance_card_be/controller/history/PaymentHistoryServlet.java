package org.example.insurance_card_be.controller.history;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;
import org.example.insurance_card_be.model.PaymentHistory;

import java.io.IOException;
import java.util.List;



@WebServlet("/paymentHistory")
public class PaymentHistoryServlet extends HttpServlet {
    private PaymentHistoryDAO paymentHistoryDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        paymentHistoryDAO = new PaymentHistoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int pageSize = 5;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }

        List<PaymentHistory> payments = paymentHistoryDAO.getPayments(page, pageSize);
        request.setAttribute("listPayment", payments);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
        request.getRequestDispatcher("/views/history/paymentHistory.jsp").forward(request, response);
    }
}
