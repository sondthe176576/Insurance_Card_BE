package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;
import org.example.insurance_card_be.model.PaymentHistoryCustomer;

import java.util.List;

public class PaymentHistoryService {

    private final PaymentHistoryDAO paymentHistoryDAO = new PaymentHistoryDAO();

    public List<PaymentHistoryCustomer> getAllPaymentHistories() {
        return paymentHistoryDAO.getAllPaymentHistories();
    }

    public List<PaymentHistoryCustomer> getPaymentHistoriesByCustomerID(int customerID) {
        return paymentHistoryDAO.getPaymentHistoriesByCustomerID(customerID);
    }

    public PaymentHistoryCustomer getPaymentHistoryById(int paymentID) {
        return paymentHistoryDAO.getPaymentHistoryById(paymentID);
    }

    public void addPaymentHistory(PaymentHistoryCustomer paymentHistoryCustomer) {
        paymentHistoryDAO.addPaymentHistory(paymentHistoryCustomer);
    }

    public void updatePaymentHistory(PaymentHistoryCustomer paymentHistoryCustomer) {
        paymentHistoryDAO.updatePaymentHistory(paymentHistoryCustomer);
    }

    public void deletePaymentHistory(int paymentID) {
        paymentHistoryDAO.deletePaymentHistory(paymentID);
    }
}

