package org.example.insurance_card_be.service;

import java.sql.SQLException;

public class PaymentService {
    private PaymentDAO paymentDAO;

    public PaymentService() {
        this.paymentDAO = new PaymentDAO();
    }

    public int savePaymentMethod(PaymentMethod paymentMethod) throws SQLException {
        return paymentDAO.savePaymentMethod(paymentMethod);
    }

    public void savePaymentHistory(PaymentHistory paymentHistory) throws SQLException {
        paymentDAO.savePaymentHistory(paymentHistory);
    }
}
