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
        String sql = "INSERT INTO Contracts(CustomerID, ContractInfo, Status, StartDate, EndDate, Coverage, InsuranceType, Premium) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, contract.getCustomerID());
            ps.setString(2, contract.getContractInfo());
            ps.setString(3, contract.getStatus());
            ps.setDate(4, new java.sql.Date(contract.getStartDate().getTime()));
            ps.setDate(5, new java.sql.Date(contract.getEndDate().getTime()));
            ps.setString(6, contract.getCoverage());
            ps.setString(7, contract.getInsuranceType());
            ps.setDouble(8, contract.getPremium());
            ps.executeUpdate();

            // Lấy ID của contract vừa tạo
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int contractID = generatedKeys.getInt(1);
                    contract.setContractID(contractID);

                    // Thêm chi tiết của contract
                    String sqlDetail = "INSERT INTO ContractDetails(ContractID, Detail, Value) VALUES(?, ?, ?)";
                    try (PreparedStatement detailPS = connection.prepareStatement(sqlDetail)) {
                        detailPS.setInt(1, contractID);
                        detailPS.setString(2, contract.getDetail());
                        detailPS.setDouble(3, contract.getValue());
                        detailPS.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Error while creating contract", e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }
}