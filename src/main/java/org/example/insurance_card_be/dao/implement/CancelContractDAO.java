package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Punishments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class CancelContractDAO {
    private Connection connection;

    public CancelContractDAO() {
        this.connection = DBContext.getConnection();
    }

    // Method to insert a new punishment record
    public void insertPunishment(Punishments punishment) throws SQLException {
        String query = "INSERT INTO Punishments (ContractID, PunishmentType, PunishmentDate, Description, Status) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, punishment.getContractID());
            stmt.setString(2, punishment.getPunishmentType());
            stmt.setDate(3, new java.sql.Date(punishment.getPunishmentDate().getTime()));
            stmt.setString(4, punishment.getDescription());
            stmt.setString(5, "Paid"); // Status is always 'Paid'
            stmt.executeUpdate();
        }
    }

    // Method to update contract status
    public void updateContractStatus(int contractID, String status) throws SQLException {
        String query = "UPDATE Contracts SET Status = ? WHERE ContractID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, contractID);
            stmt.executeUpdate();
        }
    }

    // Method to update contract cancellation date
    public void updateCancellationDate(int contractID, Date cancellationDate) throws SQLException {
        String query = "UPDATE Contracts SET CancellationDate = ? WHERE ContractID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setDate(1, new java.sql.Date(cancellationDate.getTime()));
            stmt.setInt(2, contractID);
            stmt.executeUpdate();
        }
    }

    // Close connection when done
    public void close() {
        DBContext.closeConnection(this.connection);
    }
}