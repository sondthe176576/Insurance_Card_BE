package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractDAO;
import org.example.insurance_card_be.dao.implement.NotificationDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Notifications;
import org.example.insurance_card_be.model.PaymentHistory;
import org.example.insurance_card_be.model.PaymentMethod;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;


public class ContractService {
    private ContractDAO contractDAO = new ContractDAO();
    private NotificationDAO notificationDAO = new NotificationDAO();
    private PaymentService paymentService = new PaymentService();

    // Phương thức tạo hợp đồng
    public void createContract(Contract contract, String paymentMethod) throws SQLException {
        contractDAO.createContract(contract);

        // Kiểm tra phương thức thanh toán
        PaymentMethod paymentMethodObj = new PaymentMethod();
        paymentMethodObj.setCustomerID(contract.getCustomerID());
        paymentMethodObj.setMethodType(paymentMethod);

        if ("cash".equals(paymentMethod)) {
            // Nếu phương thức thanh toán là tiền mặt, đặt chi tiết là "Chưa thanh toán"
            paymentMethodObj.setDetails("Not Paid");
        } else if ("bankTransfer".equals(paymentMethod)) {
            paymentMethodObj.setDetails("Paid via bank transfer");
        }

        int paymentMethodID = paymentService.savePaymentMethod(paymentMethodObj);

        // Cập nhật PaymentHistory
        PaymentHistory paymentHistory = new PaymentHistory();
        paymentHistory.setCustomerID(contract.getCustomerID());
        paymentHistory.setAmount(new BigDecimal(contract.getPremium()));
        paymentHistory.setPaymentDate(new Date());
        paymentHistory.setPaymentMethodID(paymentMethodID);
        paymentHistory.setContractID(contract.getContractID());

        paymentService.savePaymentHistory(paymentHistory);

        // Gửi thông báo đến tất cả nhân viên
        sendNotificationToAllStaff(contract);
    }

    private void sendNotificationToAllStaff(Contract contract) throws SQLException {
        List<Integer> staffUserIDs = notificationDAO.getAllStaffUserIDs();
        for (Integer staffUserID : staffUserIDs) {
            Notifications notification = new Notifications();
            notification.setUserID(staffUserID);
            notification.setMessage("New contract created by customer " + contract.getCustomerID());
            notification.setCreatedDate(new Date());
            notification.setRead(false);
            notificationDAO.addNotification(notification);
        }
    }

    public Contract getContractByID(int contractID) {
        return contractDAO.getContractByID(contractID);
    }

    public Contract getLatestContractByCustomerID(int customerID) {
        return contractDAO.getLatestContractByCustomerID(customerID);
    }
}
