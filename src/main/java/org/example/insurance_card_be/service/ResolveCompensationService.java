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

                // Save information to CompensationHistory table
                CompensationHistory compensationHistory = new CompensationHistory(
                        0, // CompensationID will auto-increment
                        request.getCustomerID(),
                        request.getAmount(),
                        new Date()
                );
                resolveCompensationDAO.saveCompensationHistory(compensationHistory);

                // Create email content
                String email = request.getContract().getCustomer().getUser().getEmail();
                String subject = "Compensation Request " + status;
                String content = "Dear " + request.getContract().getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your compensation request with ID " + requestID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Description: " + request.getDescription() + "\n" +
                        "Amount: $" + request.getAmount() + "\n" +
                        "Date: " + request.getRequestDate() + "\n\n";

                if (status.equalsIgnoreCase("Approved")) {
                    content += "We have received your compensation request and will contact you as soon as possible. Our nearest representative will visit your address to clarify and resolve the issue you are facing. We will address the matter in a way that is fair and agreeable to both parties.\n\n";
                } else if (status.equalsIgnoreCase("Rejected")) {
                    content += "We have declined your compensation request. We will contact you shortly to clarify this matter further.\n\n";
                }

                content += "Best regards,\n" +
                        "Peace Insurance Company";

                // Send email notification
                EmailUtil.sendEmail(email, subject, content);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}