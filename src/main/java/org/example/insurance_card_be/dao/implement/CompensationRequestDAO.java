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
    private Connection connection;

    public CompensationRequestDAO(Connection connection) {
        this.connection = DBContext.getConnection();
    }

    // Lấy danh sách yêu cầu bồi thường theo trang
    public List<CompensationRequests> getAllCompensationRequests(int page, int pageSize) throws SQLException {
        List<CompensationRequests> requests = new ArrayList<>();
        String query = "SELECT cr.RequestID, cr.CustomerID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "u.FullName AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Customers cu ON cr.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "ORDER BY cr.RequestID " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, (page - 1) * pageSize);
            stmt.setInt(2, pageSize);
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

    public int getTotalCompensationRequests() throws SQLException {
        String query = "SELECT COUNT(RequestID) AS Total FROM CompensationRequests";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }

    // Thêm phương thức main để kiểm tra
    public static void main(String[] args) {
        try {
            Connection connection = DBContext.getConnection();
            CompensationRequestDAO dao = new CompensationRequestDAO(connection);
            List<CompensationRequests> requests = dao.getAllCompensationRequests(1, 5);

            for (CompensationRequests request : requests) {
                System.out.println("Request ID: " + request.getRequestID());
                System.out.println("Customer ID: " + request.getCustomerID());
                System.out.println("Contract ID: " + request.getContractID());
                System.out.println("Customer Name: " + request.getCustomerName());
                System.out.println("Description: " + request.getDescription());
                System.out.println("Amount: " + request.getAmount());
                System.out.println("Status: " + request.getStatus());
                System.out.println("Request Date: " + request.getRequestDate());
                System.out.println("-------------------------------------------");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}