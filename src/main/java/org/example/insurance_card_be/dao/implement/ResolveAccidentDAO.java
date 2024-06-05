package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Accident;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResolveAccidentDAO {
    // Khai bao connection
    private Connection connection;

    // Khởi tạo connection
    public ResolveAccidentDAO() {
        connection = DBContext.getConnection();
    }

    // Ham lay thong tin tai nan theo ID
    public Accident getAccidentByID(int accidentID) throws SQLException {
        String sql = "SELECT a.AccidentID, a.ContractID, c.CustomerID, a.AccidentType, a.AccidentDate, a.Description, cu.FullName AS CustomerName, a.Status " +
                "FROM Accidents a " +
                "JOIN Contracts co ON a.ContractID = co.ContractID " +
                "JOIN Customers c ON co.CustomerID = c.CustomerID " +
                "JOIN Users cu ON c.UserID = cu.UserID " +
                "WHERE a.AccidentID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accidentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Accident(
                        rs.getInt("AccidentID"),
                        rs.getInt("ContractID"),
                        rs.getInt("CustomerID"),
                        rs.getString("AccidentType"),
                        rs.getDate("AccidentDate").toString(),
                        rs.getString("Description"),
                        rs.getString("CustomerName"),
                        rs.getString("Status")
                );
            }
        }
        return null;
    }

    // Ham cap nhat trang thai tai nan
    public void updateAccidentStatus(int accidentID, String status) throws SQLException {
        String sql = "UPDATE Accidents SET Status = ? WHERE AccidentID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, accidentID);
            ps.executeUpdate();
        }
    }
}