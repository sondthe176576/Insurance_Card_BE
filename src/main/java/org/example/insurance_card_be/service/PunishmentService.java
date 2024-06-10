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

    // Goi ham lay danh sach punishments
    public List<Punishments> getAllPunishments() throws SQLException {
        try {
            return punishmentDAO.getAllPunishments();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
