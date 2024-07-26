package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolvePunishmentDAO;
import org.example.insurance_card_be.model.Punishments;
import org.example.insurance_card_be.model.PunishmentHistory;
import org.example.insurance_card_be.util.EmailUtil;

import java.sql.SQLException;
import java.util.Date;

public class ResolvePunishmentService {
    private ResolvePunishmentDAO resolvePunishmentDAO;

    public ResolvePunishmentService() {
        resolvePunishmentDAO = new ResolvePunishmentDAO();
    }

    public Punishments getPunishmentByID(int punishmentID) {
        try {
            return resolvePunishmentDAO.getPunishmentByID(punishmentID);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updatePunishmentStatus(int punishmentID, String status) {
        try {
            Punishments punishment = resolvePunishmentDAO.getPunishmentByID(punishmentID);
            if (punishment != null) {
                resolvePunishmentDAO.updatePunishmentStatus(punishmentID, status);

                // Save information to PunishmentHistory table
                PunishmentHistory punishmentHistory = new PunishmentHistory(
                        0, // PunishmentID will auto-increment
                        punishment.getCustomer().getCustomerID(),
                        punishment.getDescription(),
                        new Date()
                );
                resolvePunishmentDAO.savePunishmentHistory(punishmentHistory);

                // Create email content
                String email = punishment.getContract().getCustomer().getUser().getEmail();
                String subject = "Punishment Report " + status;
                String content = "Dear " + punishment.getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your punishment report with ID " + punishmentID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Punishment Type: " + punishment.getPunishmentType() + "\n" +
                        "Punishment Date: " + punishment.getPunishmentDate() + "\n" +
                        "Description: " + punishment.getDescription() + "\n\n";

                if (status.equalsIgnoreCase("Approved")) {
                    content += "We have received your information and will contact you as soon as possible. Our nearest representative will visit your address to resolve the issue.\n\n";
                } else if (status.equalsIgnoreCase("Rejected")) {
                    content += "We have declined your punishment report. We will contact you shortly to handle this request regarding your contract.\n\n";
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