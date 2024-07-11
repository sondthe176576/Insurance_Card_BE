package org.example.insurance_card_be.service;

import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.ResolveWaitingContractsDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.util.EmailUtil;

import java.sql.SQLException;

public class ResolveWaitingContractsService {
    private ResolveWaitingContractsDAO resolveWaitingContractsDAO;

    public ResolveWaitingContractsService() {
        this.resolveWaitingContractsDAO = new ResolveWaitingContractsDAO();
    }

    public Contract getContractDetailByID(int contractID) {
        try {
            return resolveWaitingContractsDAO.getContractDetailById(contractID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updateContractStatus(int contractID, String status, HttpSession session) {
        try {
            Contract contract = resolveWaitingContractsDAO.getContractDetailById(contractID);
            if (contract != null) {
                resolveWaitingContractsDAO.updateContractStatus(contractID, status);

                // Tạo nội dung email
                String email = contract.getCustomer().getUser().getEmail();
                String subject = "Contract " + status;
                String content = "Dear " + contract.getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your contract with ID " + contractID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Contract Info: " + contract.getContractInfo() + "\n" +
                        "Start Date: " + contract.getStartDate() + "\n" +
                        "End Date: " + contract.getEndDate() + "\n" +
                        "Value: " + contract.getValue() + "\n\n" +
                        "Please contact us for more details and schedule a meeting.\n\n" +
                        "Best regards,\n" +
                        "Your Insurance Company";

                // Gửi email thông báo
                EmailUtil.sendEmail(email, subject, content);

                // Lưu thông báo thành công vào session
                session.setAttribute("successMessage", "Contract ID " + contractID + " has been " + status.toLowerCase() + " successfully.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}