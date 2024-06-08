package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResolveCompensationDAO {
    // Khai báo connection
    private Connection connection;

    // Khởi tạo connection
    public ResolveCompensationDAO() {
        connection = DBContext.getConnection();
    }

    // Hàm lấy thông tin yêu cầu bồi thường theo ID
    public CompensationRequests getCompensationRequestByID(int requestID) throws SQLException {
        String sql = "SELECT cr.RequestID, cr.CustomerID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM CompensationRequests cr " +
                "JOIN Contracts con ON cr.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers c ON con.CustomerID = c.CustomerID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "JOIN Motorcycles m ON c.CustomerID = m.CustomerID " +
                "WHERE cr.RequestID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
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

                Contract contract = new Contract();
                contract.setContractID(rs.getInt("ContractID"));
                contract.setContractInfo(rs.getString("ContractInfo"));
                contract.setStatus(rs.getString("ContractStatus"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setInsuranceType(rs.getString("InsuranceType"));
                contract.setCoverage(rs.getString("Coverage"));
                contract.setPremium(rs.getDouble("Premium"));
                contract.setDetail(rs.getString("Detail"));
                contract.setValue(rs.getDouble("Value"));
                contract.setCustomer(customer);
                contract.setMotorcycle(motorcycle);

                return new CompensationRequests(
                        rs.getInt("RequestID"),
                        rs.getInt("CustomerID"),
                        rs.getInt("ContractID"),
                        rs.getDate("RequestDate"),
                        rs.getString("Status"),
                        rs.getString("Description"),
                        rs.getBigDecimal("Amount"),
                        user.getFullName(),
                        contract // Thêm contract vào cuối
                );
            }
        }
        return null;
    }

    // Hàm cập nhật yêu cầu bồi thường
    public void updateCompensationRequest(CompensationRequests request) throws SQLException {
        String sql = "UPDATE CompensationRequests SET Status = ? WHERE RequestID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, request.getStatus());
            ps.setInt(2, request.getRequestID());
            ps.executeUpdate();
        }
    }
}