package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolvePunishmentDAO;
import org.example.insurance_card_be.model.Punishments;
import org.example.insurance_card_be.util.EmailUtil;

import java.sql.SQLException;

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

                // Tạo nội dung email
                String email = punishment.getContract().getCustomer().getUser().getEmail();
                String subject = "Punishment Report " + status;
                String content = "Dear " + punishment.getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your punishment report with ID " + punishmentID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Punishment Type: " + punishment.getPunishmentType() + "\n" +
                        "Punishment Date: " + punishment.getPunishmentDate() + "\n" +
                        "Description: " + punishment.getDescription() + "\n\n" +
                        "Best regards,\n" +
                        "Your Insurance Company";

                // Gửi email thông báo
                EmailUtil.sendEmail(email, subject, content);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Ham main de test lay thong tin hinh phat
    public static void main(String[] args) {
        ResolvePunishmentService resolvePunishmentService = new ResolvePunishmentService();
        Punishments punishment = resolvePunishmentService.getPunishmentByID(1);
        if (punishment != null) {
            System.out.println(punishment);
        } else {
            System.out.println("No punishment found with the given ID.");
        }
    }
}