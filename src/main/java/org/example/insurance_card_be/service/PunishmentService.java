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

    // Hàm cập nhật trạng thái của hình thức phạt
    public void resolvePunishment(int punishmentID) throws SQLException {
        punishmentDAO.resolvePunishment(punishmentID);
    }

    // Hàm lấy danh sách hợp đồng bị hủy trước ngày hết hạn
    public List<Punishments> getCancelledContractsBeforeExpiry(int page, int limit, String status, String customerName) throws SQLException {
        return punishmentDAO.getCancelledContractsBeforeExpiry(page, limit, status, customerName);
    }

    // Hàm lấy tổng số hợp đồng bị hủy trước ngày hết hạn
    public int getTotalCancelledContracts() throws SQLException {
        return punishmentDAO.getTotalCancelledContracts();
    }
}
