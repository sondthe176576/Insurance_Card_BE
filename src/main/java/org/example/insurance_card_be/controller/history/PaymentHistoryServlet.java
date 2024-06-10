package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;
import org.example.insurance_card_be.model.PaymentHistory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/payments")
public class PaymentHistoryServlet extends HttpServlet {
    private final PaymentHistoryDAO paymentHistoryDAO;

    public PaymentHistoryServlet() {
        this.paymentHistoryDAO = new PaymentHistoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<PaymentHistory> payments = paymentHistoryDAO.getAllPayments();
        req.setAttribute("listPayment", payments); // Set the attribute

        // Forward the request to the JSP
        req.getRequestDispatcher("/views/history/paymentHistory.jsp").forward(req, resp);
    }
}
