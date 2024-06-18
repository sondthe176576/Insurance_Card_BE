package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.PunishmentHistory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PunishmentDAO {
    private final DBContext dbContext;

    public PunishmentDAO() {
        this.dbContext = new DBContext();
    }

    public List<PunishmentHistory> getAllPunishmentHistoriesForCustomer(int customerId, int page, int pageSize) throws SQLException {
        List<PunishmentHistory> punishmentHistoryList = new ArrayList<>();
        String query = "SELECT PunishmentID, CustomerID, Description, Date " +
                "FROM PunishmentHistory " +
                "WHERE CustomerID = ? " +
                "ORDER BY PunishmentID " +
                "OFFSET ? ROWS " +
                "FETCH NEXT ? ROWS ONLY";

        // Ensure page number is non-negative
        if (page < 1) {
            page = 1;
        }

        // Ensure pageSize is positive
        if (pageSize <= 0) {
            throw new IllegalArgumentException("Page size must be greater than zero");
        }

        int offset = (page - 1) * pageSize;
        try (Connection connection = dbContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            stmt.setInt(2, offset);
            stmt.setInt(3, pageSize);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    PunishmentHistory punishmentHistory = new PunishmentHistory();
                    punishmentHistory.setPunishmentID(rs.getInt("PunishmentID"));
                    punishmentHistory.setCustomerID(rs.getInt("CustomerID"));
                    punishmentHistory.setDescription(rs.getString("Description"));
                    punishmentHistory.setDate(rs.getDate("Date"));
                    punishmentHistoryList.add(punishmentHistory);
                }
            }
        }
        return punishmentHistoryList;
    }
}
