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

                // Create email content
                String email = contract.getCustomer().getUser().getEmail();
                String subject = "Contract " + status;
                String content = "Dear " + contract.getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your contract with ID " + contractID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Contract Info: " + contract.getContractInfo() + "\n" +
                        "Start Date: " + contract.getStartDate() + "\n" +
                        "End Date: " + contract.getEndDate() + "\n" +
                        "Value: " + contract.getValue() + "\n\n";

                if (status.equalsIgnoreCase("Accepted")) {
                    content += "We have received your contract registration information. We will contact you as soon as possible and arrange for our nearest representative to your address to finalize the contract paperwork.\n\n";
                } else if (status.equalsIgnoreCase("Rejected")) {
                    content += "We have declined your request to create a new contract. We will contact you shortly to discuss this matter further.\n\n";
                }

                content += "Best regards,\n" +
                        "Peace Insurance Company";

                // Send email notification
                EmailUtil.sendEmail(email, subject, content);

                // Save success message in session
                session.setAttribute("successMessage", "Contract ID " + contractID + " has been " + status.toLowerCase() + " successfully.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}