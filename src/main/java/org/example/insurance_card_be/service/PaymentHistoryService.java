package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;
import org.example.insurance_card_be.model.PaymentHistoryCus;

import java.util.List;

public class PaymentHistoryService {

    private PaymentHistoryDAO paymentHistoryDAO = new PaymentHistoryDAO();

    public List<PaymentHistoryCus> getAllPaymentHistories() {
        return paymentHistoryDAO.getAllPaymentHistories();
    }

    public PaymentHistoryCus getPaymentHistoryById(int paymentID) {
        return paymentHistoryDAO.getPaymentHistoryById(paymentID);
    }

    public void addPaymentHistory(PaymentHistoryCus paymentHistoryCus) {
        paymentHistoryDAO.addPaymentHistory(paymentHistoryCus);
    }

    public void updatePaymentHistory(PaymentHistoryCus paymentHistoryCus) {
        paymentHistoryDAO.updatePaymentHistory(paymentHistoryCus);
    }

    public void deletePaymentHistory(int paymentID) {
        paymentHistoryDAO = new PaymentHistoryDAO();
        paymentHistoryDAO.deletePaymentHistory(paymentID);
    }
}
