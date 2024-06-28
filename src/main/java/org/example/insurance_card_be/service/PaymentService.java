package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.PaymentDAO;
import org.example.insurance_card_be.model.PaymentHistory;
import org.example.insurance_card_be.model.PaymentMethod;

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