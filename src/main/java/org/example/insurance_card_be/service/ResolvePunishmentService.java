package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolvePunishmentDAO;
import org.example.insurance_card_be.model.Punishments;

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
            resolvePunishmentDAO.updatePunishmentStatus(punishmentID, status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
