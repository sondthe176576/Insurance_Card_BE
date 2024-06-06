package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.dao.implement.CompensationRequestDAO;
import org.example.insurance_card_be.model.CompensationRequests;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CompensationService {
    // Khai báo compensationRequestDAO
    private CompensationRequestDAO compensationRequestDAO;

    // Khởi tạo connection
    public CompensationService(Connection connection) {
        this.compensationRequestDAO = new CompensationRequestDAO(connection);
    }

    // Hàm lấy thông tin tất cả các yêu cầu bồi thường
    public List<CompensationRequests> getAllCompensationRequests(int page, int limit, String status, String customerName) throws SQLException {
        return compensationRequestDAO.getAllCompensationRequests(page, limit, status, customerName);
    }

    // Hàm lấy tổng số yêu cầu bồi thường
    public int getTotalCompensationRequests(String status, String customerName) throws SQLException {
        return compensationRequestDAO.getTotalCompensationRequests(status, customerName);
    }

    // Hàm cập nhật trạng thái của yêu cầu bồi thường
    public void updateCompensationRequestStatus(int requestID, String status) throws SQLException{
        compensationRequestDAO.updateCompensationRequestStatus(requestID, status);
    }
}