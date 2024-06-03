package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Accident;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccidentDAO {
    private Connection connection;

    public AccidentDAO(Connection connection) {
        this.connection = DBContext.getConnection();
    }

    // Them thuoc tinh Status
    public List<Accident> getAllAccidents(int page, int pageSize) throws SQLException {
        List<Accident> accidents = new ArrayList<>();
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, u.FullName AS CustomerName, a.Status " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "ORDER BY a.AccidentID " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, (page - 1) * pageSize);
            stmt.setInt(2, pageSize);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Accident accident = new Accident();
                    accident.setAccidentID(rs.getInt("AccidentID"));
                    accident.setContractID(rs.getInt("ContractID"));
                    accident.setAccidentType(rs.getString("AccidentType"));
                    accident.setAccidentDate(rs.getDate("AccidentDate").toString());
                    accident.setDescription(rs.getString("Description"));
                    accident.setCustomerID(rs.getInt("CustomerID"));
                    accident.setCustomerName(rs.getString("CustomerName"));
                    accident.setStatus(rs.getString("Status"));
                    accidents.add(accident);
                }
            }
        }
        return accidents;
    }

    public int getTotalAccidents() throws SQLException {
        String query = "SELECT COUNT(a.AccidentID) AS Total " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }

    public Accident getAccidentById(int accidentID) throws SQLException {
        // Them thuoc tinh Status
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, a.Status, u.FullName " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE a.AccidentID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accidentID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Accident accident = new Accident();
                    accident.setAccidentID(rs.getInt("AccidentID"));
                    accident.setContractID(rs.getInt("ContractID"));
                    accident.setAccidentType(rs.getString("AccidentType"));
                    accident.setAccidentDate(rs.getDate("AccidentDate").toString());
                    accident.setDescription(rs.getString("Description"));
                    accident.setCustomerID(rs.getInt("CustomerID"));
                    accident.setCustomerName(rs.getString("CustomerName"));
                    accident.setStatus(rs.getString("Status"));
                    return accident;
                }
            }
        }
        return null;
    }

    // Ham main de test lay list accident
    public static void main(String[] args) {
        try {
            AccidentDAO accidentDAO = new AccidentDAO(DBContext.getConnection());
            List<Accident> accidents = accidentDAO.getAllAccidents(1, 10);
            for (Accident accident : accidents) {
                System.out.println(accident);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}