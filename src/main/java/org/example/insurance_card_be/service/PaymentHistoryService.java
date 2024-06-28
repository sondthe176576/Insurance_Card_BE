package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.PaymentHistoryDAO;
import org.example.insurance_card_be.model.PaymentHistoryCus;

import java.util.List;

public class PaymentHistoryService {

    private PaymentHistoryDAO paymentHistoryDAO = new PaymentHistoryDAO();

    /**
     * Lấy danh sách tất cả các lịch sử thanh toán
     * @return Danh sách các lịch sử thanh toán
     */
    public List<PaymentHistoryCus> getAllPaymentHistories() {
        return paymentHistoryDAO.getAllPaymentHistories();
    }

    /**
     * Lấy thông tin lịch sử thanh toán bằng ID
     * @param paymentID ID của lịch sử thanh toán cần lấy
     * @return Đối tượng PaymentHistoryCus tương ứng với ID hoặc null nếu không tìm thấy
     */
    public PaymentHistoryCus getPaymentHistoryById(int paymentID) {
        return paymentHistoryDAO.getPaymentHistoryById(paymentID);
    }

    /**
     * Thêm một lịch sử thanh toán mới
     * @param paymentHistoryCus Đối tượng PaymentHistoryCus cần thêm
     */
    public void addPaymentHistory(PaymentHistoryCus paymentHistoryCus) {
        paymentHistoryDAO.addPaymentHistory(paymentHistoryCus);
    }

    /**
     * Cập nhật thông tin lịch sử thanh toán
     * @param paymentHistoryCus Đối tượng PaymentHistoryCus cần cập nhật
     */
    public void updatePaymentHistory(PaymentHistoryCus paymentHistoryCus) {
        paymentHistoryDAO.updatePaymentHistory(paymentHistoryCus);
    }

    /**
     * Xóa lịch sử thanh toán bằng ID
     * @param paymentID ID của lịch sử thanh toán cần xóa
     */
    public void deletePaymentHistory(int paymentID) {
        paymentHistoryDAO.deletePaymentHistory(paymentID);
    }
}
