package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolveCompensationDAO;
import org.example.insurance_card_be.model.CompensationHistory;
import org.example.insurance_card_be.model.CompensationRequests;
import org.example.insurance_card_be.util.EmailUtil;

import java.sql.SQLException;
import java.util.Date;

public class ResolveCompensationService {
    private ResolveCompensationDAO resolveCompensationDAO;

    public ResolveCompensationService() {
        resolveCompensationDAO = new ResolveCompensationDAO();
    }

    public CompensationRequests resolveCompensation(int requestID) {
        try {
            return resolveCompensationDAO.getCompensationRequestByID(requestID);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updateCompensationRequestStatus(int requestID, String status) {
        try {
            CompensationRequests request = resolveCompensationDAO.getCompensationRequestByID(requestID);
            if (request != null) {
                request.setStatus(status);
                resolveCompensationDAO.updateCompensationRequest(request);

                // Lưu thông tin vào bảng CompensationHistory
                CompensationHistory compensationHistory = new CompensationHistory(
                        0, // CompensationID sẽ tự động tăng
                        request.getCustomerID(),
                        request.getAmount(),
                        new Date()
                );
                resolveCompensationDAO.saveCompensationHistory(compensationHistory);

                // Tạo nội dung email
                String email = request.getContract().getCustomer().getUser().getEmail();
                String subject = "Compensation Request " + status;
                String content = "Dear " + request.getContract().getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your compensation request with ID " + requestID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Description: " + request.getDescription() + "\n" +
                        "Amount: $" + request.getAmount() + "\n" +
                        "Date: " + request.getRequestDate() + "\n\n" +
                        "Best regards,\n" +
                        "Your Insurance Company";

                // Gửi email thông báo
                EmailUtil.sendEmail(email, subject, content);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
