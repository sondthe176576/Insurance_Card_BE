package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.CompensationRequests;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompensationHistoryDAO {
    private final Connection connection;

    public CompensationHistoryDAO() {
        this.connection = DBContext.getConnection();
    }

    public List<CompensationRequests> getAllCompensationRequests() throws SQLException {
        List<CompensationRequests> requests = new ArrayList<>();
        String query = "SELECT cr.RequestID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "c.CustomerID, u.Full_name AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Contracts c ON cr.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                CompensationRequests request = new CompensationRequests();
                request.setRequestID(rs.getInt("RequestID"));
                request.setContractID(rs.getInt("ContractID"));
                request.setRequestDate(rs.getDate("RequestDate"));
                request.setStatus(rs.getString("Status"));
                request.setDescription(rs.getString("Description"));
                request.setAmount(rs.getBigDecimal("Amount"));
                request.setCustomerID(rs.getInt("CustomerID"));
                request.setCustomerName(rs.getString("CustomerName"));
                requests.add(request);
            }
        }
        return requests;
    }

    public List<CompensationRequests> getCompensationRequestsByCustomerID(int customerID, int offset, int limit) throws SQLException {
        List<CompensationRequests> requests = new ArrayList<>();
        String query = "SELECT cr.RequestID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "c.CustomerID, u.Full_name AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Contracts c ON cr.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE cu.CustomerID = ? ORDER BY cr.RequestDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerID);
            stmt.setInt(2, offset);
            stmt.setInt(3, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CompensationRequests request = new CompensationRequests();
                    request.setRequestID(rs.getInt("RequestID"));
                    request.setContractID(rs.getInt("ContractID"));
                    request.setRequestDate(rs.getDate("RequestDate"));
                    request.setStatus(rs.getString("Status"));
                    request.setDescription(rs.getString("Description"));
                    request.setAmount(rs.getBigDecimal("Amount"));
                    request.setCustomerID(rs.getInt("CustomerID"));
                    request.setCustomerName(rs.getString("CustomerName"));
                    requests.add(request);
                }
            }
        }
        return requests;
    }

    public int getTotalCompensationRequestsByCustomerID(int customerID) throws SQLException {
        String query = "SELECT COUNT(cr.RequestID) AS Total " +
                "FROM CompensationRequests cr " +
                "JOIN Contracts c ON cr.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE cu.CustomerID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }

    public CompensationRequests getCompensationRequestById(int requestID) throws SQLException {
        String query = "SELECT cr.RequestID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "c.CustomerID, u.Full_name AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Contracts c ON cr.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE cr.RequestID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, requestID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    CompensationRequests request = new CompensationRequests();
                    request.setRequestID(rs.getInt("RequestID"));
                    request.setContractID(rs.getInt("ContractID"));
                    request.setRequestDate(rs.getDate("RequestDate"));
                    request.setStatus(rs.getString("Status"));
                    request.setDescription(rs.getString("Description"));
                    request.setAmount(rs.getBigDecimal("Amount"));
                    request.setCustomerID(rs.getInt("CustomerID"));
                    request.setCustomerName(rs.getString("CustomerName"));
                    return request;
                }
            }
        }
        return null;
    }

    public void addCompensationRequest(CompensationRequests request) throws SQLException {
        String query = "INSERT INTO CompensationRequests (CustomerID, ContractID, RequestDate, Status, Description, Amount) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, request.getCustomerID());
            stmt.setInt(2, request.getContractID());
            stmt.setDate(3, new Date(request.getRequestDate().getTime()));
            stmt.setString(4, request.getStatus());
            stmt.setString(5, request.getDescription());
            stmt.setBigDecimal(6, request.getAmount());
            stmt.executeUpdate();
        }
    }



    public void updateCompensationRequest(CompensationRequests request) throws SQLException {
        String query = "UPDATE CompensationRequests SET ContractID = ?, RequestDate = ?, Status = ?, Description = ?, Amount = ? " +
                "WHERE RequestID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, request.getContractID());
            stmt.setDate(2, new Date(request.getRequestDate().getTime()));
            stmt.setString(3, request.getStatus());
            stmt.setString(4, request.getDescription());
            stmt.setBigDecimal(5, request.getAmount());
            stmt.setInt(6, request.getRequestID());
            stmt.executeUpdate();
        }
    }

    public void deleteCompensationRequest(int requestID) throws SQLException {
        String query = "DELETE FROM CompensationRequests WHERE RequestID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, requestID);
            stmt.executeUpdate();
        }
    }

    public boolean isContractValidForCustomer(int contractID, int customerID) throws SQLException {
        String query = "SELECT COUNT(*) FROM Contracts WHERE ContractID = ? AND CustomerID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, contractID);
            stmt.setInt(2, customerID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public static void main(String[] args) throws SQLException {
        CompensationHistoryDAO compensationHistoryDAO = new CompensationHistoryDAO();
        List<CompensationRequests> requests = compensationHistoryDAO.getAllCompensationRequests();
        for (CompensationRequests request : requests) {
            System.out.println(request);
        }
    }
}
