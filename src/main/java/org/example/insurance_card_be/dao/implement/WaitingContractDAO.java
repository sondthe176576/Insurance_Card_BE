package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WaitingContractDAO {
    private Connection connection;

    public WaitingContractDAO() {
        this.connection = DBContext.getConnection();
    }

    public List<Contract> getContractsByStatus(String status, String customerName, String startDate, String insuranceType, int page, int pageSize) throws SQLException {
        List<Contract> contracts = new ArrayList<>();
        String query = "SELECT con.*, u.Full_name AS CustomerName " +
                "FROM Contracts con " +
                "JOIN Customers cus ON con.CustomerID = cus.CustomerID " +
                "JOIN Users u ON cus.UserID = u.UserID " +
                "WHERE con.Status = ? " +
                (customerName != null && !customerName.isEmpty() ? "AND u.Full_name LIKE ? " : "") +
                (startDate != null && !startDate.isEmpty() ? "AND con.StartDate = ? " : "") +
                (insuranceType != null && !insuranceType.isEmpty() ? "AND con.InsuranceType = ? " : "") +
                "ORDER BY con.StartDate " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            int paramIndex = 1;
            ps.setString(paramIndex++, status);

            if (customerName != null && !customerName.isEmpty()) {
                ps.setString(paramIndex++, "%" + customerName + "%");
            }

            if (startDate != null && !startDate.isEmpty()) {
                ps.setString(paramIndex++, startDate);
            }

            if (insuranceType != null && !insuranceType.isEmpty()) {
                ps.setString(paramIndex++, insuranceType);
            }

            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
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
                    contract.setCustomerName(rs.getString("CustomerName")); // Thiết lập customerName
                    contracts.add(contract);
                }
            }
        }
        return contracts;
    }

    public int getTotalContractsByStatus(String status, String customerName, String startDate, String insuranceType) throws SQLException {
        String query = "SELECT COUNT(*) AS Total " +
                "FROM Contracts con " +
                "JOIN Customers cus ON con.CustomerID = cus.CustomerID " +
                "JOIN Users u ON cus.UserID = u.UserID " +
                "WHERE con.Status = ? " +
                (customerName != null && !customerName.isEmpty() ? "AND u.Full_name LIKE ? " : "") +
                (startDate != null && !startDate.isEmpty() ? "AND con.StartDate = ? " : "") +
                (insuranceType != null && !insuranceType.isEmpty() ? "AND con.InsuranceType = ? " : "");

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            int paramIndex = 1;
            ps.setString(paramIndex++, status);

            if (customerName != null && !customerName.isEmpty()) {
                ps.setString(paramIndex++, "%" + customerName + "%");
            }

            if (startDate != null && !startDate.isEmpty()) {
                ps.setString(paramIndex++, startDate);
            }

            if (insuranceType != null && !insuranceType.isEmpty()) {
                ps.setString(paramIndex++, insuranceType);
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }
}