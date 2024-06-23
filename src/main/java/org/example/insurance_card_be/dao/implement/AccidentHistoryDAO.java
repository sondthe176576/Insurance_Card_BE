package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.AccidentHistoryCus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccidentHistoryDAO {
    // Khai bao connection
    private Connection connection;

    // Khởi tạo connection
    public AccidentHistoryDAO() {
        this.connection = new DBContext().getConnection();
    }

    // Ham lay thong tin tat ca cac tai nan
    public List<AccidentHistoryCus> getAccidentHistory(int page, int pageSize, String status, String description) throws SQLException {
        List<AccidentHistoryCus> accidentHistories = new ArrayList<>();
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
                    AccidentHistoryCus accidentHistoryCus = new AccidentHistoryCus();
                    accidentHistoryCus.setAccidentID(rs.getInt("AccidentID"));
                    accidentHistoryCus.setContractID(rs.getInt("ContractID"));
                    accidentHistoryCus.setAccidentType(rs.getString("AccidentType"));
                    accidentHistoryCus.setAccidentDate(rs.getDate("AccidentDate"));
                    accidentHistoryCus.setDescription(rs.getString("Description"));
                    accidentHistoryCus.setCustomerID(rs.getInt("CustomerID"));
                    accidentHistoryCus.setStatus(rs.getString("Status"));
                    accidentHistories.add(accidentHistoryCus);
                }
            }
        }
        return accidentHistories;
    }
    }