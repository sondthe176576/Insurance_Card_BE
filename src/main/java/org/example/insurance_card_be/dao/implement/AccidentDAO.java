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
    // Khai bao connection
    private Connection connection;

    // Khởi tạo connection
    public AccidentDAO(Connection connection) {
        this.connection = DBContext.getConnection();
    }

    // Ham lay thong tin tat ca cac tai nan
    // Ham lay thong tin tat ca cac tai nan
    public List<Accident> getAllAccidents(int page, int pageSize, String status, String customerName) throws SQLException {
        List<Accident> accidents = new ArrayList<>();
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, u.Full_name AS CustomerName, a.Status " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID ";
        List<String> conditions = new ArrayList<>();
        if (status != null && !status.isEmpty()) {
            conditions.add("a.Status = ?");
        }
        if (customerName != null && !customerName.isEmpty()) {
            conditions.add("u.Full_name LIKE ?");
        }
        if (!conditions.isEmpty()) {
            query += "WHERE " + String.join(" AND ", conditions) + " ";
        }
        query += "ORDER BY a.AccidentID " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            int paramIndex = 1;
            if (status != null && !status.isEmpty()) {
                stmt.setString(paramIndex++, status);
            }
            if (customerName != null && !customerName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + customerName + "%");
            }
            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Accident accident = new Accident();
                    accident.setAccidentID(rs.getInt("AccidentID"));
                    accident.setContractID(rs.getInt("ContractID"));
                    accident.setAccidentType(rs.getString("AccidentType"));
                    accident.setAccidentDate(rs.getDate("AccidentDate"));
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

    // Ham lay tong so tai nan
    public int getTotalAccidents(String status, String customerName) throws SQLException {
        String query = "SELECT COUNT(a.AccidentID) AS Total " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID ";
        List<String> conditions = new ArrayList<>();
        if (status != null && !status.isEmpty()) {
            conditions.add("a.Status = ?");
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

    // Ham lay thong tin tai nan theo ID
    public Accident getAccidentById(int accidentID) throws SQLException {
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, a.Status, u.Full_name " +
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
                    accident.setAccidentDate(rs.getDate("AccidentDate"));
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

    public void updateAccidentStatus(int accidentID, String status) {
        String query = "UPDATE Accidents SET Status = ? WHERE AccidentID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, accidentID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) throws SQLException {
        AccidentDAO accidentDAO = new AccidentDAO(DBContext.getConnection());
        List<Accident> accidents = accidentDAO.getAllAccidents(1, 10, null, null);
        for (Accident accident : accidents) {
            System.out.println(accident);
        }
    }



}