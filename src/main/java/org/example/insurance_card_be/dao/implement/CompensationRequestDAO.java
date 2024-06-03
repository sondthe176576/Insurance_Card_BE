package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.CompensationRequests;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompensationRequestDAO {
    // Khai báo connection
    private Connection connection;

    // Khởi tạo connection
    public CompensationRequestDAO(Connection connection) {
        this.connection = DBContext.getConnection();
    }

    // Hàm lấy thông tin tất cả các yêu cầu bồi thường
    public List<CompensationRequests> getAllCompensationRequests(int page, int pageSize, String status) throws SQLException {
        List<CompensationRequests> requests = new ArrayList<>();
        String query = "SELECT cr.RequestID, cr.CustomerID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "u.FullName AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Customers cu ON cr.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID ";
        if (status != null && !status.isEmpty()) {
            query += "WHERE cr.Status = ? ";
        }
        query += "ORDER BY cr.RequestID " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            int paramIndex = 1;
            if (status != null && !status.isEmpty()) {
                stmt.setString(paramIndex++, status);
            }
            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CompensationRequests request = new CompensationRequests();
                    request.setRequestID(rs.getInt("RequestID"));
                    request.setCustomerID(rs.getInt("CustomerID"));
                    request.setContractID(rs.getInt("ContractID"));
                    request.setRequestDate(rs.getDate("RequestDate").toString());
                    request.setStatus(rs.getString("Status"));
                    request.setDescription(rs.getString("Description"));
                    request.setAmount(rs.getBigDecimal("Amount"));
                    request.setCustomerName(rs.getString("CustomerName"));
                    requests.add(request);
                }
            }
        }
        return requests;
    }

    // Hàm lấy tổng số yêu cầu bồi thường
    public int getTotalCompensationRequests(String status) throws SQLException {
        String query = "SELECT COUNT(RequestID) AS Total FROM CompensationRequests";
        if (status != null && !status.isEmpty()) {
            query += " WHERE Status = ?";
        }
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            if (status != null && !status.isEmpty()) {
                stmt.setString(1, status);
            }
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }

    // Hàm lấy thông tin yêu cầu bồi thường theo ID
    public void updateCompensationRequestStatus(int requestID, String status) throws SQLException{
        String query = "UPDATE CompensationRequests SET Status = ? WHERE RequestID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, requestID);
            stmt.executeUpdate();
        }
    }
}