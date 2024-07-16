package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;
import org.example.insurance_card_be.model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class RenewContractDAO {
    // Khai báo connection
    private Connection connection;

    // Khởi tạo connection
    public RenewContractDAO() {
        this.connection = DBContext.getConnection();
    }

    // Lay thong tin cua mot contract theo ID
    public Contract getContractDetailById(int contractID) throws Exception {
        String query = "SELECT u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, " +
                "u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM dbo.Users u " +
                "JOIN dbo.Customers c ON u.UserID = c.UserID " +
                "JOIN dbo.Contracts con ON c.CustomerID = con.CustomerID " +
                "JOIN dbo.ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN dbo.Motorcycles m ON c.CustomerID = m.CustomerID " +
                "WHERE con.ContractID = ?";

        Contract contract = null;

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, contractID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Users user = new Users();
                    user.setUserID(rs.getInt("UserID"));
                    user.setUsername(rs.getString("Username"));
                    user.setEmail(rs.getString("Email"));
                    user.setMobile(rs.getString("Mobile"));
                    user.setFullName(rs.getString("Full_name"));
                    user.setGender(rs.getString("Gender"));
                    user.setProvince(rs.getString("Province"));
                    user.setDistrict(rs.getString("District"));
                    user.setCountry(rs.getString("Country"));
                    user.setFirstName(rs.getString("First_name"));
                    user.setLastName(rs.getString("Last_name"));
                    user.setBirthDate(rs.getDate("Birth_date"));

                    Motorcycle motorcycle = new Motorcycle();
                    motorcycle.setMotorcycleID(rs.getInt("MotorcycleID"));
                    motorcycle.setLicensePlate(rs.getString("LicensePlate"));
                    motorcycle.setBrand(rs.getString("Brand"));
                    motorcycle.setModel(rs.getString("Model"));
                    motorcycle.setFrameNumber(rs.getString("FrameNumber"));
                    motorcycle.setEngineNumber(rs.getString("EngineNumber"));
                    motorcycle.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                    motorcycle.setColor(rs.getString("Color"));

                    Customers customer = new Customers();
                    customer.setCustomerID(rs.getInt("CustomerID"));
                    customer.setPersonalInfo(rs.getString("PersonalInfo"));
                    customer.setUser(user);

                    contract = new Contract();
                    contract.setContractID(rs.getInt("ContractID"));
                    contract.setContractInfo(rs.getString("ContractInfo"));
                    contract.setStatus(rs.getString("Status"));
                    contract.setStartDate(rs.getDate("StartDate"));
                    contract.setEndDate(rs.getDate("EndDate"));
                    contract.setInsuranceType(rs.getString("InsuranceType"));
                    contract.setCoverage(rs.getString("Coverage"));
                    contract.setPremium(rs.getDouble("Premium"));
                    contract.setDetail(rs.getString("Detail"));
                    contract.setValue(rs.getDouble("Value"));
                    contract.setCustomer(customer);
                    contract.setMotorcycle(motorcycle);
                }
            }
        }
        return contract;
    }

    // Gia han hop dong
    public void renewContract(Contract contract) {
        if (contract == null || contract.getCustomer() == null) {
            throw new IllegalArgumentException("Contract or Customer cannot be null");
        }

        Contract existingContract = getContractByID(contract.getContractID());
        if (existingContract != null) {
            String updateContractSQL = "UPDATE Contracts SET StartDate = ?, EndDate = ? WHERE ContractID = ?";
            String updateContractDetailsSQL = "UPDATE ContractDetails SET Value = ?, Detail = ? WHERE ContractID = ?";
            String updatePaymentMethodsSQL = "UPDATE PaymentMethods SET Details = 'Not Paid' WHERE PaymentMethodID = ?";
            String updatePaymentHistorySQL = "UPDATE PaymentHistory SET Amount = ?, PaymentDate = NULL WHERE ContractID = ?";

            try (PreparedStatement updateContractStmt = connection.prepareStatement(updateContractSQL);
                 PreparedStatement updateContractDetailsStmt = connection.prepareStatement(updateContractDetailsSQL);
                 PreparedStatement updatePaymentMethodsStmt = connection.prepareStatement(updatePaymentMethodsSQL);
                 PreparedStatement updatePaymentHistoryStmt = connection.prepareStatement(updatePaymentHistorySQL)) {

                // Cập nhật bảng Contracts
                updateContractStmt.setDate(1, new java.sql.Date(contract.getStartDate().getTime()));
                updateContractStmt.setDate(2, new java.sql.Date(contract.getEndDate().getTime()));
                updateContractStmt.setInt(3, contract.getContractID());
                updateContractStmt.executeUpdate();

                // Cập nhật bảng ContractDetails
                updateContractDetailsStmt.setDouble(1, contract.getValue());
                String detail = "This contract has been renewed as of " + new java.sql.Date(new java.util.Date().getTime());
                updateContractDetailsStmt.setString(2, detail);
                updateContractDetailsStmt.setInt(3, contract.getContractID());
                updateContractDetailsStmt.executeUpdate();

                // Lấy PaymentMethodID từ bảng PaymentHistory
                String getPaymentMethodIDSQL = "SELECT PaymentMethodID FROM PaymentHistory WHERE ContractID = ?";
                int paymentMethodID = 0;
                try (PreparedStatement getPaymentMethodIDStmt = connection.prepareStatement(getPaymentMethodIDSQL)) {
                    getPaymentMethodIDStmt.setInt(1, contract.getContractID());
                    try (ResultSet rs = getPaymentMethodIDStmt.executeQuery()) {
                        if (rs.next()) {
                            paymentMethodID = rs.getInt("PaymentMethodID");
                        }
                    }
                }

                // Cập nhật bảng PaymentMethods
                updatePaymentMethodsStmt.setInt(1, paymentMethodID);
                updatePaymentMethodsStmt.executeUpdate();

                // Cập nhật bảng PaymentHistory
                updatePaymentHistoryStmt.setDouble(1, contract.getValue());
                updatePaymentHistoryStmt.setInt(2, contract.getContractID());
                updatePaymentHistoryStmt.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("ContractID not found");
        }
    }

    // Lay thong tin cua mot contract theo ID
    private Contract getContractByID(int contractID) {
        String sql = "SELECT * FROM Contracts WHERE ContractID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, contractID);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Contract contract = new Contract();
                    contract.setContractID(resultSet.getInt("ContractID"));
                    contract.setContractInfo(resultSet.getString("ContractInfo"));
                    contract.setStatus(resultSet.getString("Status"));
                    contract.setStartDate(resultSet.getDate("StartDate"));
                    contract.setEndDate(resultSet.getDate("EndDate"));
                    contract.setInsuranceType(resultSet.getString("InsuranceType"));
                    contract.setCoverage(resultSet.getString("Coverage"));
                    contract.setPremium(resultSet.getDouble("Premium"));
                    return contract;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Xác nhận hết hạn hợp đồng
    public void updateContractStatusAndDetail(Contract contract) throws SQLException {
        String updateContractSQL = "UPDATE Contracts SET Status = ? WHERE ContractID = ?";
        String updateContractDetailSQL = "UPDATE ContractDetails SET Detail = ? WHERE ContractID = ?";

        try (PreparedStatement updateContractStmt = connection.prepareStatement(updateContractSQL);
             PreparedStatement updateContractDetailStmt = connection.prepareStatement(updateContractDetailSQL)) {
            updateContractStmt.setString(1, contract.getStatus());
            updateContractStmt.setInt(2, contract.getContractID());
            updateContractStmt.executeUpdate();

            updateContractDetailStmt.setString(1, contract.getDetail());
            updateContractDetailStmt.setInt(2, contract.getContractID());
            updateContractDetailStmt.executeUpdate();
        }
    }
}