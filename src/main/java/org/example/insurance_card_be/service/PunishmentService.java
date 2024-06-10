package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.dao.implement.PunishmentDAO;
import org.example.insurance_card_be.model.Punishments;

import java.sql.SQLException;
import java.util.List;

public class PunishmentService {
    // Khai báo lop DAO
    private PunishmentDAO punishmentDAO;

    // Khởi tạo lớp DAO
    public PunishmentService(PunishmentDAO punishmentDAO) {
        this.punishmentDAO = punishmentDAO;
    }

    public List<Punishments> getAllPunishments(int page, int limit, String status, String customerName) throws SQLException {
        return punishmentDAO.getPunishments(page, limit, status, customerName);
    }

    public int getTotalPunishments(String status, String customerName) throws SQLException {
        return punishmentDAO.getTotalPunishments(status, customerName);
    }

    public void resolvePunishment(int punishmentID) throws SQLException {
        punishmentDAO.resolvePunishment(punishmentID);
    }
}
