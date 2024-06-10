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

    // Hàm lấy thông tin tất cả các hình thức phạt
    public List<Punishments> getAllPunishments(int page, int limit, String status, String customerName) throws SQLException {
        return punishmentDAO.getPunishments(page, limit, status, customerName);
    }

    // Hàm lấy tổng số hình thức phạt
    public int getTotalPunishments(String status, String customerName) throws SQLException {
        return punishmentDAO.getTotalPunishments(status, customerName);
    }

    // Hàm cập nhật trạng thái của hình thức phạt
    public void resolvePunishment(int punishmentID) throws SQLException {
        punishmentDAO.resolvePunishment(punishmentID);
    }
}
