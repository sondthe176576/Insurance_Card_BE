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

    public List<Contract> getContractsByStatus(String status) throws SQLException {
        List<Contract> contracts = new ArrayList<>();
        String sql = "SELECT * FROM Contracts WHERE Status = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Contract contract = new Contract();
                    contract.setContractID(rs.getInt("ContractID"));
                    contract.setCustomerID(rs.getInt("CustomerID"));
                    contract.setContractInfo(rs.getString("ContractInfo"));
                    contract.setStatus(rs.getString("Status"));
                    contract.setStartDate(rs.getDate("StartDate"));
                    contract.setEndDate(rs.getDate("EndDate"));
                    contract.setCoverage(rs.getString("Coverage"));
                    contract.setInsuranceType(rs.getString("InsuranceType"));
                    contract.setPremium(rs.getDouble("Premium"));
                    contracts.add(contract);
                }
            }
        }
        return contracts;
    }
}