package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContractDAO {
    // DAO dung de thao tac voi database
    private Connection connection;

    // Khoi tao connection
    public ContractDAO() {
        this.connection = DBContext.getConnection();
    }

    // Ham tao contract
    public void createContract(Contract contract) throws SQLException {
        // Tao contract
        String sql = "INSERT INTO Contracts(CustomerID, ContractInfo, Status, StartDate, EndDate) VALUES(?, ?, ?, ?, ?)";
        ResultSet generatedKeys = null;
        // Tao cac chi tiet cua contract
        try (PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, contract.getCustomerID());
            ps.setString(2, contract.getContractInfo());
            ps.setString(3, contract.getStatus());
            ps.setDate(4, new java.sql.Date(contract.getStartDate().getTime()));
            ps.setDate(5, new java.sql.Date(contract.getEndDate().getTime()));
            ps.executeUpdate();

            // Lay ra id cua contract vua duoc tao
            try (ResultSet generatedkeys = ps.getGeneratedKeys()) {
                // Neu co id duoc tao
                if (ps.getGeneratedKeys().next()) {
                    int contractID = ps.getGeneratedKeys().getInt(1);
                    // Set id cho contract
                    contract.setContractID(contractID);

                    // Tao cac chi tiet cua contract
                    String sqlDetail = "INSERT INTO ContractDetails(ContractID, Detail, Value) VALUES(?, ?, ?)";
                    try (PreparedStatement detailPS = connection.prepareStatement(sqlDetail)) {
                        detailPS.setInt(1, contract.getContractID());
                        detailPS.setString(2, contract.getDetail());
                        detailPS.setDouble(3, contract.getValue());
                        detailPS.executeUpdate();
                    }
                }
            }
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }
}