package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/payments")
public class PaymentHistory extends HttpServlet {

    private PaymentHistoryDAO paymentHistoryDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        paymentHistoryDAO = new PaymentHistoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<org.example.insurance_card_be.model.PaymentHistory> payments = paymentHistoryDAO.getAllPayments();

        // Set content type
        resp.setContentType("text/html");

        // Create HTML response
        StringBuilder htmlResponse = new StringBuilder();
        htmlResponse.append("<html><head><title>Payment History</title></head><body>");
        htmlResponse.append("<h2>Payment History</h2>");
        htmlResponse.append("<table border='1'><tr><th>Payment ID</th><th>Customer ID</th><th>Amount</th><th>Payment Date</th><th>Payment Method ID</th><th>Contract ID</th></tr>");

        for (org.example.insurance_card_be.model.PaymentHistory payment : payments) {
            htmlResponse.append("<tr>");
            htmlResponse.append("<td>").append(payment.getPaymentID()).append("</td>");
            htmlResponse.append("<td>").append(payment.getCustomerID()).append("</td>");
            htmlResponse.append("<td>").append(payment.getAmount()).append("</td>");
            htmlResponse.append("<td>").append(payment.getPaymentDate()).append("</td>");
            htmlResponse.append("<td>").append(payment.getPaymentMethodID()).append("</td>");
            htmlResponse.append("<td>").append(payment.getContractID()).append("</td>");
            htmlResponse.append("</tr>");
        }

        htmlResponse.append("</table>");
        htmlResponse.append("</body></html>");

        // Write HTML response to the output stream
        resp.getWriter().write(htmlResponse.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Handle POST requests if needed
        super.doPost(req, resp);
    }
}
