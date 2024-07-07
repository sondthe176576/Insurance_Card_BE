//package org.example.insurance_card_be.service;
//
//import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;
//import org.example.insurance_card_be.model.PaymentHistory;
//
//import java.util.List;
//
//public class PaymentHistoryService {
//
//    private final PaymentHistoryDAO paymentHistoryDAO;
//
//    public PaymentHistoryService() {
//        this.paymentHistoryDAO = new PaymentHistoryDAO();
//    }
//
//    public List<PaymentHistory> getAllPaymentHistories() {
//        return paymentHistoryDAO.getAllPaymentHistories();
//    }
//
//    public PaymentHistory getPaymentHistoryById(int paymentID) {
//        return paymentHistoryDAO.getPaymentHistoryById(paymentID);
//    }
//
//    public void addPaymentHistory(PaymentHistory paymentHistory) {
//        paymentHistoryDAO.addPaymentHistory(paymentHistory);
//    }
//
//    public void updatePaymentHistory(PaymentHistory paymentHistory) {
//        paymentHistoryDAO.updatePaymentHistory(paymentHistory);
//    }
//
//    public void deletePaymentHistory(int paymentID) {
//        paymentHistoryDAO.deletePaymentHistory(paymentID);
//    }
//}
