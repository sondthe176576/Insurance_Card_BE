package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.CompensationRequests;
import org.example.insurance_card_be.model.Contract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class CompensationHistoryDAO {
    private Connection connection;

    public CompensationHistoryDAO() {
        this.connection = DBContext.getConnection();
    }

    public List<CompensationRequests> getAllCompensationRequests() throws SQLException {
        List<CompensationRequests> requests = new ArrayList<>();
        String query = "SELECT cr.RequestID, cr.CustomerID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "u.Full_name AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Customers cu ON cr.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                CompensationRequests request = new CompensationRequests();
                request.setRequestID(rs.getInt("RequestID"));
                request.setCustomerID(rs.getInt("CustomerID"));
                request.setContractID(rs.getInt("ContractID"));
                request.setRequestDate(rs.getDate("RequestDate"));
                request.setStatus(rs.getString("Status"));
                request.setDescription(rs.getString("Description"));
                request.setAmount(rs.getBigDecimal("Amount"));
                request.setCustomerName(rs.getString("CustomerName"));
                requests.add(request);
            }
        }
        return requests;
    }

    public int getTotalCompensationRequests(String status, String customerName) throws SQLException {
        String query = "SELECT COUNT(cr.RequestID) AS Total " +
                "FROM CompensationRequests cr " +
                "JOIN Customers cu ON cr.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID ";
        List<String> conditions = new ArrayList<>();
        if (status != null && !status.isEmpty()) {
            conditions.add("cr.Status = ?");
        }
        if (customerName != null && !customerName.isEmpty()) {
            conditions.add("u.Full_name LIKE ?");
        }
        if (!conditions.isEmpty()) {
            query += "WHERE " + String.join(" AND ", conditions);
        }
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            int paramIndex = 1;
            if (status != null && !status.isEmpty()) {
                stmt.setString(paramIndex++, status);
            }
            if (customerName != null && !customerName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + customerName + "%");
            }
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }

    public CompensationRequests getCompensationRequestById(int requestID) throws SQLException {
        String query = "SELECT cr.RequestID, cr.CustomerID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "u.Full_name AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Customers cu ON cr.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE cr.RequestID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, requestID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    CompensationRequests request = new CompensationRequests();
                    request.setRequestID(rs.getInt("RequestID"));
                    request.setCustomerID(rs.getInt("CustomerID"));
                    request.setContractID(rs.getInt("ContractID"));
                    request.setRequestDate(rs.getDate("RequestDate"));
                    request.setStatus(rs.getString("Status"));
                    request.setDescription(rs.getString("Description"));
                    request.setAmount(rs.getBigDecimal("Amount"));
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
        String query = "UPDATE CompensationRequests SET CustomerID = ?, ContractID = ?, RequestDate = ?, Status = ?, Description = ?, Amount = ? " +
                "WHERE RequestID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, request.getCustomerID());
            stmt.setInt(2, request.getContractID());
            stmt.setDate(3, new Date(request.getRequestDate().getTime()));
            stmt.setString(4, request.getStatus());
            stmt.setString(5, request.getDescription());
            stmt.setBigDecimal(6, request.getAmount());
            stmt.setInt(7, request.getRequestID());
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

    public List<CompensationRequests> getCompensationRequestsByCustomerID(int customerID) throws SQLException {
        List<CompensationRequests> requests = new ArrayList<>();
        String query = "SELECT cr.RequestID, cr.CustomerID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "u.Full_name AS CustomerName " +
                "FROM CompensationRequests cr " +
                "JOIN Customers cu ON cr.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE cu.CustomerID = ? ORDER BY cr.RequestDate DESC";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CompensationRequests request = new CompensationRequests();
                    request.setRequestID(rs.getInt("RequestID"));
                    request.setCustomerID(rs.getInt("CustomerID"));
                    request.setContractID(rs.getInt("ContractID"));
                    request.setRequestDate(rs.getDate("RequestDate"));
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

    public List<Contract> getAllContracts() throws SQLException {
        List<Contract> contracts = new ArrayList<>();
        String query = "SELECT ContractID, CustomerID, ContractInfo, Status, StartDate, EndDate, Detail, Value, Coverage, InsuranceType, Premium, CancellationDate, MethodPaymentType FROM Contracts";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Contract contract = new Contract();
                contract.setContractID(rs.getInt("ContractID"));
                contract.setCustomerID(rs.getInt("CustomerID"));
                contract.setContractInfo(rs.getString("ContractInfo"));
                contract.setStatus(rs.getString("Status"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDetail(rs.getString("Detail"));
                contract.setValue(rs.getDouble("Value"));
                contract.setCoverage(rs.getString("Coverage"));
                contract.setInsuranceType(rs.getString("InsuranceType"));
                contract.setPremium(rs.getDouble("Premium"));
                contract.setCancellationDate(rs.getDate("CancellationDate"));
                contract.setMethodPaymentType(rs.getString("MethodPaymentType"));
                contracts.add(contract);
            }
        }
        return contracts;
    }

    public static void main(String[] args) {
        CompensationHistoryDAO dao = new CompensationHistoryDAO();
        try {
            List<CompensationRequests> histories = dao.getAllCompensationRequests();
            for (CompensationRequests history : histories) {
                System.out.println(history);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
