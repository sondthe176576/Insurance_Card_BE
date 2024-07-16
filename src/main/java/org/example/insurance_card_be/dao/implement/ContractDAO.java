package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.PaymentHistory;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContractDAO {
    private Connection connection;

    public ContractDAO() {
        this.connection = DBContext.getConnection();
    }

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

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int contractID = generatedKeys.getInt(1);
                    contract.setContractID(contractID);

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
        }
    }

    public Contract getContractByID(int contractID) {
        Contract contract = null;
        String sql = "SELECT c.*, cd.Detail, cd.Value, pm.paymentMethodID, pm.methodType, pm.details, ph.paymentID, ph.amount, ph.paymentDate " +
                "FROM Contracts c " +
                "LEFT JOIN ContractDetails cd ON c.ContractID = cd.ContractID " +
                "LEFT JOIN PaymentHistory ph ON c.ContractID = ph.ContractID " +
                "LEFT JOIN PaymentMethods pm ON ph.paymentMethodID = pm.paymentMethodID " +
                "WHERE c.ContractID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, contractID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    contract = new Contract();
                    contract.setContractID(rs.getInt("ContractID"));
                    contract.setCustomerID(rs.getInt("CustomerID"));
                    contract.setContractInfo(rs.getString("ContractInfo"));
                    contract.setStatus(rs.getString("Status"));
                    contract.setStartDate(rs.getDate("StartDate"));
                    contract.setEndDate(rs.getDate("EndDate"));
                    contract.setCoverage(rs.getString("Coverage"));
                    contract.setInsuranceType(rs.getString("InsuranceType"));
                    contract.setPremium(rs.getDouble("Premium"));
                    contract.setDetail(rs.getString("Detail"));
                    contract.setValue(rs.getDouble("Value"));

                    // Thiết lập đối tượng PaymentHistory
                    PaymentHistory paymentHistory = new PaymentHistory();
                    paymentHistory.setPaymentMethodID(rs.getInt("paymentMethodID"));
                    paymentHistory.setPaymentID(rs.getInt("paymentID"));
                    paymentHistory.setAmount(rs.getBigDecimal("amount"));
                    paymentHistory.setPaymentDate(rs.getDate("paymentDate"));
//                    paymentHistory.setPaymentDetails(rs.getString("details")); // Lấy giá trị từ cột details
//                    contract.setPaymentHistory(paymentHistory);

                    contract.setMethodPaymentType(rs.getString("methodType"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contract;
    }

    public Contract getLatestContractByCustomerID(int customerID) {
        Contract contract = null;
        String sql = "SELECT * FROM Contracts WHERE CustomerID = ? ORDER BY ContractID DESC LIMIT 1";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    contract = new Contract();
                    contract.setContractID(rs.getInt("ContractID"));
                    contract.setCustomerID(rs.getInt("CustomerID"));
                    contract.setContractInfo(rs.getString("ContractInfo"));
                    contract.setStatus(rs.getString("Status"));
                    contract.setStartDate(rs.getDate("StartDate"));
                    contract.setEndDate(rs.getDate("EndDate"));
                    contract.setCoverage(rs.getString("Coverage"));
                    contract.setInsuranceType(rs.getString("InsuranceType"));
                    contract.setPremium(rs.getDouble("Premium"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contract;
    }
}