package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;
import org.example.insurance_card_be.model.PaymentHistoryCustomer;

import java.util.List;

public class PaymentHistoryService {

    private final PaymentHistoryDAO paymentHistoryDAO;

    public PaymentHistoryService() {
        this.paymentHistoryDAO = new PaymentHistoryDAO();
    }

    public List<PaymentHistoryCustomer> getAllPaymentHistories() {
        return paymentHistoryDAO.getAllPaymentHistories();
    }

    public PaymentHistoryCustomer getPaymentHistoryById(int paymentID) {
        return paymentHistoryDAO.getPaymentHistoryById(paymentID);
    }

    public void addPaymentHistory(PaymentHistoryCustomer paymentHistory) {
        paymentHistoryDAO.addPaymentHistory(paymentHistory);
    }

    public void updatePaymentHistory(PaymentHistoryCustomer paymentHistory) {
        paymentHistoryDAO.updatePaymentHistory(paymentHistory);
    }

    public void deletePaymentHistory(int paymentID) {
        paymentHistoryDAO.deletePaymentHistory(paymentID);
    }
}
