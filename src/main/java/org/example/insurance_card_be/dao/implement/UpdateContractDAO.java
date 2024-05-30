package org.example.insurance_card_be.dao.implement;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.ContractDetail;

public class UpdateContractDAO {
    // Khai báo đối tượng Connection
    private Connection connection;

    // Hàm khởi tạo
    public UpdateContractDAO(Connection connection) {
        this.connection = connection;
    }

    // Cập nhật hợp đồng theo contractID
    public void updateContract(Contract contract) {
        String sql = "UPDATE Contracts SET contractInfo = ?, status = ?, startDate = ?, endDate = ?, insuranceType = ?, coverage = ?, premium = ? WHERE contractID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, contract.getContractInfo());
            preparedStatement.setString(2, contract.getStatus());
            preparedStatement.setDate(3, new java.sql.Date(contract.getStartDate().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(contract.getEndDate().getTime()));
            preparedStatement.setString(5, contract.getInsuranceType());
            preparedStatement.setString(6, contract.getCoverage());
            preparedStatement.setDouble(7, contract.getPremium());
            preparedStatement.setInt(8, contract.getContractID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật thông tin chi tiết hợp đồng theo contractID
    public void updateContractDetail(ContractDetail contractDetail) {
        String sql = "UPDATE ContractDetails SET detail = ?, value = ? WHERE contractID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, contractDetail.getDetail());
            preparedStatement.setDouble(2, contractDetail.getValue().doubleValue());
            preparedStatement.setInt(3, contractDetail.getContractID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Ham main de test updateContract va updateContractDetail
    public static void main(String[] args) {
        Connection connection = DBContext.getConnection();
        UpdateContractDAO updateContractDAO = new UpdateContractDAO(connection);
        Contract contract = new Contract();
        contract.setContractID(1);
        contract.setContractInfo("Test");
        contract.setStatus("Test");
        contract.setStartDate(new java.util.Date());
        contract.setEndDate(new java.util.Date());
        contract.setInsuranceType("Test");
        contract.setCoverage("Test");
        contract.setPremium(0.0);
        updateContractDAO.updateContract(contract);

        ContractDetail contractDetail = new ContractDetail();
        contractDetail.setContractID(1);
        contractDetail.setDetail("Test");
        contractDetail.setValue(BigDecimal.valueOf(1000000));
        updateContractDAO.updateContractDetail(contractDetail);
    }
}
