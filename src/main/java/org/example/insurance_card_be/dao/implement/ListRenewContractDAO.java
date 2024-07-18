package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ListRenewContractDAO {
    private Connection connection;

    public ListRenewContractDAO() {
        this.connection = DBContext.getConnection();
    }

    public List<Contract> getExpiredContracts(int page, int pageSize, String customerName) throws SQLException {
        List<Contract> contracts = new ArrayList<>();
        String query = "SELECT con.*, u.Full_name AS CustomerName " +
                "FROM Contracts con " +
                "JOIN Customers cus ON con.CustomerID = cus.CustomerID " +
                "JOIN Users u ON cus.UserID = u.UserID " +
                "WHERE con.EndDate < GETDATE() ";
        if (customerName != null && !customerName.isEmpty()) {
            query += "AND u.Full_name LIKE ? ";
        }
        query += "ORDER BY con.EndDate " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            int paramIndex = 1;
            if (customerName != null && !customerName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + customerName + "%");
            }
            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Contract contract = new Contract();
                    contract.setContractID(rs.getInt("ContractID"));
                    contract.setCustomerID(rs.getInt("CustomerID"));
                    contract.setContractInfo(rs.getString("ContractInfo"));
                    contract.setStatus(rs.getString("Status"));
                    contract.setStartDate(rs.getDate("StartDate"));
                    contract.setEndDate(rs.getDate("EndDate"));
                    contract.setInsuranceType(rs.getString("InsuranceType"));
                    contract.setCoverage(rs.getString("Coverage"));
                    contract.setPremium(rs.getDouble("Premium"));
                    contract.setCustomerName(rs.getString("CustomerName"));
                    contracts.add(contract);
                }
            }
        }
        return contracts;
    }

    public int getTotalExpiredContracts(String customerName) throws SQLException {
        String query = "SELECT COUNT(*) AS Total " +
                "FROM Contracts con " +
                "JOIN Customers cus ON con.CustomerID = cus.CustomerID " +
                "JOIN Users u ON cus.UserID = u.UserID " +
                "WHERE con.EndDate < GETDATE() ";
        if (customerName != null && !customerName.isEmpty()) {
            query += "AND u.Full_name LIKE ?";
        }

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            int paramIndex = 1;
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
}