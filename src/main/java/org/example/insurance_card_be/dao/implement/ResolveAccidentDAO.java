package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResolveAccidentDAO {
    // Khai bao connection
    private Connection connection;

    // Khởi tạo connection
    public ResolveAccidentDAO() {
        connection = DBContext.getConnection();
    }

    // Ham lay thong tin tai nan theo ID
    public Accident getAccidentByID(int accidentID) throws SQLException {
        String sql = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, a.Status, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Address, u.FullName, u.Gender, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM Accidents a " +
                "JOIN Contracts con ON a.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers c ON con.CustomerID = c.CustomerID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "JOIN Motorcycles m ON c.CustomerID = m.CustomerID " +
                "WHERE a.AccidentID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accidentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setAddress(rs.getString("Address"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));

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

                // Bạn cần đảm bảo rằng bạn có các trường "Detail" và "Value" trong bảng của bạn
                contract.setDetail(rs.getString("Detail"));
                contract.setValue(rs.getDouble("Value"));

                contract.setCustomer(customer);
                contract.setMotorcycle(motorcycle);

                return new Accident(
                        rs.getInt("AccidentID"),
                        rs.getInt("ContractID"),
                        rs.getInt("CustomerID"),
                        rs.getString("AccidentType"),
                        rs.getDate("AccidentDate"),
                        rs.getString("Description"),
                        user.getFullName(),
                        rs.getString("Status"),
                        contract,
                        customer
                );
            }
        }
        return null;
    }

    // Ham cap nhat trang thai tai nan
    public void updateAccidentStatus(int accidentID, String status) throws SQLException {
        String sql = "UPDATE Accidents SET Status = ? WHERE AccidentID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, accidentID);
            ps.executeUpdate();
        }
    }
}