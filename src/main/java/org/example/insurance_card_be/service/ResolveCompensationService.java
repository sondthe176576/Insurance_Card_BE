package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolveCompensationDAO;
import org.example.insurance_card_be.model.CompensationRequests;
import org.example.insurance_card_be.util.EmailUtil;

import java.sql.SQLException;

public class ResolveCompensationService {
    // Khai bao resolveCompensationDAO
    private ResolveCompensationDAO resolveCompensationDAO;

    // Khoi tao resolveCompensationDAO
    public ResolveCompensationService() {
        resolveCompensationDAO = new ResolveCompensationDAO();
    }

    // Ham lay thong tin tat ca cac yeu cau boi thuong
    public CompensationRequests resolveCompensation(int requestID) {
        try {
            return resolveCompensationDAO.getCompensationRequestByID(requestID);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Cap nhat yeu cau boi thuong
    public void updateCompensationRequestStatus(int requestID, String status) {
        try {
            CompensationRequests request = resolveCompensationDAO.getCompensationRequestByID(requestID);
            if (request != null) {
                request.setStatus(status);
                resolveCompensationDAO.updateCompensationRequest(request);

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
