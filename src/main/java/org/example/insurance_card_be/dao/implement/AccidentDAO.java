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
    public AccidentDAO() {
        this.connection = new DBContext().getConnection();
    }

    // Ham lay thong tin tat ca cac tai nan
    public List<Accident> getAccidentHistory(int page, int pageSize, String status, String description) throws SQLException {
        List<Accident> accidents = new ArrayList<>();
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, a.Status " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID ";
        List<String> conditions = new ArrayList<>();
        if (status != null && !status.isEmpty()) {
            conditions.add("a.Status = ?");
        }
        if (description != null && !description.isEmpty()) {
            conditions.add("a.Description LIKE ?");
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
            if (description != null && !description.isEmpty()) {
                stmt.setString(paramIndex++, "%" + description + "%");
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
                    accident.setStatus(rs.getString("Status"));
                    accidents.add(accident);
                }
            }
        }
        return accidents;
    }
    }