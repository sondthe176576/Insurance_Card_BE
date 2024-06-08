package org.example.insurance_card_be.dao.implement;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

public class UpdateContractDAO {
    // Khai báo connection
    private Connection connection;

    // Khởi tạo connection
    public UpdateContractDAO() {
        this.connection = DBContext.getConnection();
    }

    // Cập nhật thông tin hợp đồng
    public void updateContract(Contract contract) {
        // Kiểm tra xem contractID đã tồn tại chưa
        Contract existingContract = getContractByID(contract.getContractID());
        if (existingContract != null) {
            // Nếu contractID đã tồn tại, cập nhật thông tin hợp đồng
            String sql = "UPDATE Contracts SET ContractInfo = ?, Status = ?, StartDate = ?, EndDate = ?, InsuranceType = ?, Coverage = ?, Premium = ? WHERE ContractID = ?";
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
        } else {
            // Nếu contractID chưa tồn tại, tạo mới hợp đồng
            String sql = "INSERT INTO Contracts (ContractID, ContractInfo, Status, StartDate, EndDate, InsuranceType, Coverage, Premium) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, contract.getContractID());
                preparedStatement.setString(2, contract.getContractInfo());
                preparedStatement.setString(3, contract.getStatus());
                preparedStatement.setDate(4, new java.sql.Date(contract.getStartDate().getTime()));
                preparedStatement.setDate(5, new java.sql.Date(contract.getEndDate().getTime()));
                preparedStatement.setString(6, contract.getInsuranceType());
                preparedStatement.setString(7, contract.getCoverage());
                preparedStatement.setDouble(8, contract.getPremium());
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Lấy thông tin hợp đồng theo contractID
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

    // Cập nhật thông tin chi tiết hợp đồng
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

    // Lấy thông tin hợp đồng theo contractID
    public Contract getContractDetailByID(int contractID) {
        String query = "SELECT u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
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
                    user.setProvince(rs.getInt("Province"));
                    user.setDistrict(rs.getInt("District"));
                    user.setCountry(rs.getInt("Country"));
                    user.setFirstName(rs.getString("First_name"));
                    user.setLastName(rs.getString("Last_name"));
                    user.setBirthDate(rs.getString("Birth_date"));

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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return contract;
    }
}