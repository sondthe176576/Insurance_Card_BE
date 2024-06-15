package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PunishmentDAO {
    private Connection connection;

    public PunishmentDAO(Connection connection) {
        this.connection = connection;
    }

    public void resolvePunishment(int punishmentID) throws SQLException {
        String query = "UPDATE Punishments SET Status = 'Resolved' WHERE PunishmentID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, punishmentID);
            stmt.executeUpdate();
        }
    }

    public List<Punishments> getCancelledContractsBeforeExpiry(int page, int limit, String status, String customerName) throws SQLException {
        List<Punishments> punishments = new ArrayList<>();
        String query = "SELECT p.PunishmentID, p.ContractID, p.PunishmentType, p.PunishmentDate, p.Description, p.Status, " +
                "co.CustomerID, u.Full_name AS CustomerName, co.CancellationDate, co.EndDate " +
                "FROM Punishments p " +
                "JOIN Contracts co ON p.ContractID = co.ContractID " +
                "JOIN Customers cu ON co.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE co.CancellationDate < co.EndDate ";

        List<String> conditions = new ArrayList<>();
        if (status != null && !status.isEmpty()) {
            conditions.add("p.Status = ?");
        }
        if (customerName != null && !customerName.isEmpty()) {
            conditions.add("u.Full_name LIKE ?");
        }
        if (!conditions.isEmpty()) {
            query += "AND " + String.join(" AND ", conditions) + " ";
        }
        query += "ORDER BY p.PunishmentID " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            int paramIndex = 1;
            if (status != null && !status.isEmpty()) {
                stmt.setString(paramIndex++, status);
            }
            if (customerName != null && !customerName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + customerName + "%");
            }
            stmt.setInt(paramIndex++, (page - 1) * limit);
            stmt.setInt(paramIndex, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Punishments punishment = new Punishments();
                    punishment.setPunishmentID(rs.getInt("PunishmentID"));
                    punishment.setContractID(rs.getInt("ContractID"));
                    punishment.setPunishmentType(rs.getString("PunishmentType"));
                    punishment.setPunishmentDate(rs.getDate("PunishmentDate"));
                    punishment.setDescription(rs.getString("Description"));
                    punishment.setStatus(rs.getString("Status"));
                    punishment.setCustomerName(rs.getString("CustomerName"));

                    Contract contract = new Contract();
                    contract.setContractID(rs.getInt("ContractID"));
                    contract.setCancellationDate(rs.getDate("CancellationDate"));
                    contract.setEndDate(rs.getDate("EndDate"));
                    punishment.setContract(contract);

                    Customers customer = new Customers();
                    customer.setCustomerID(rs.getInt("CustomerID"));
                    punishment.setCustomer(customer);
                    punishments.add(punishment);
                }
            }
        }
        return punishments;
    }

    public int getTotalCancelledContracts() throws SQLException {
        String query = "SELECT COUNT(p.PunishmentID) AS Total " +
                "FROM Punishments p " +
                "JOIN Contracts co ON p.ContractID = co.ContractID " +
                "JOIN Customers cu ON co.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE co.CancellationDate < co.EndDate";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }

    public List<PunishmentHistory> getAllPunishmentHistories() throws SQLException {
        List<PunishmentHistory> punishmentHistoryList = new ArrayList<>();
        String query = "SELECT PunishmentID, CustomerID, Description, Date FROM PunishmentHistory";

        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                PunishmentHistory punishmentHistory = new PunishmentHistory();
                punishmentHistory.setPunishmentID(rs.getInt("PunishmentID"));
                punishmentHistory.setCustomerID(rs.getInt("CustomerID"));
                punishmentHistory.setDescription(rs.getString("Description"));
                punishmentHistory.setDate(rs.getDate("Date"));
                punishmentHistoryList.add(punishmentHistory);
            }
        }
        return punishmentHistoryList;
    }
}
