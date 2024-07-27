package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompensationHistoryForStaffDAO {

    public List<CompensationHistoryDTO> getAllCompensationHistories(int page, int pageSize, String customerName, String sortOrder) throws SQLException {
        List<CompensationHistoryDTO> histories = new ArrayList<>();
        String query = "SELECT ch.CustomerID, ch.CompensationID, ch.Amount, ch.Date, c.Status, u.Full_name, c.ContractID " +
                "FROM CompensationHistory ch " +
                "JOIN CompensationRequests c ON ch.CustomerID = c.CustomerID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "JOIN Contracts ct ON c.ContractID = ct.ContractID " +
                "WHERE u.Full_name LIKE ? " +
                "ORDER BY ch.Date " + (sortOrder.equalsIgnoreCase("DESC") ? "DESC" : "ASC") + " " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, "%" + customerName + "%");
            stmt.setInt(2, (page - 1) * pageSize);
            stmt.setInt(3, pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CompensationHistoryDTO history = new CompensationHistoryDTO();
                    history.setCompensationID(rs.getInt("CompensationID"));
                    history.setCustomerID(rs.getInt("CustomerID"));
                    history.setAmount(rs.getBigDecimal("Amount"));
                    history.setDate(rs.getDate("Date"));
                    history.setStatus(rs.getString("Status"));
                    history.setFullName(rs.getString("Full_name"));
                    history.setContractID(rs.getInt("ContractID"));
                    histories.add(history);
                }
            }
        }
        return histories;
    }
    public int getTotalCompensationHistories(String customerName) throws SQLException {
        String countQuery = "SELECT COUNT(*) AS total FROM CompensationHistory ch " +
                "JOIN CompensationRequests c ON ch.CustomerID = c.CustomerID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE u.Full_name LIKE ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(countQuery)) {
            stmt.setString(1, "%" + customerName + "%");

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        }
        return 0;
    }






    public CompensationHistoryDTO getCompensationRequestDetails(int compensationId) throws SQLException {
        String query = "SELECT ch.CompensationID, ch.CustomerID, ch.Amount, ch.Date AS CompensationDate, " +
                "cr.RequestID, cr.ContractID, cr.RequestDate, cr.Status AS RequestStatus, cr.Description AS RequestDescription, " +
                "con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, " +
                "cd.ContractDetailID, cd.Detail, cd.Value, " +
                "cu.CustomerID, cu.PersonalInfo, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, " +
                "u.First_name, u.Last_name, u.Birth_date, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM CompensationHistory ch " +
                "JOIN CompensationRequests cr ON ch.CustomerID = cr.CustomerID " +
                "JOIN Contracts con ON cr.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers cu ON cr.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "LEFT JOIN Motorcycles m ON cu.CustomerID = m.CustomerID " +
                "WHERE ch.CompensationID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, compensationId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    CompensationHistoryDTO details = new CompensationHistoryDTO();
                    details.setCompensationID(rs.getInt("CompensationID"));
                    details.setCustomerID(rs.getInt("CustomerID"));
                    details.setAmount(rs.getBigDecimal("Amount"));
                    details.setDate(rs.getDate("CompensationDate"));
                    details.setStatus(rs.getString("RequestStatus"));
                    details.setDescription(rs.getString("RequestDescription"));

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
                    details.setUsers(user);

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
                    details.setContract(contract);

                    Motorcycle motorcycle = new Motorcycle();
                    motorcycle.setMotorcycleID(rs.getInt("MotorcycleID"));
                    motorcycle.setLicensePlate(rs.getString("LicensePlate"));
                    motorcycle.setBrand(rs.getString("Brand"));
                    motorcycle.setModel(rs.getString("Model"));
                    motorcycle.setFrameNumber(rs.getString("FrameNumber"));
                    motorcycle.setEngineNumber(rs.getString("EngineNumber"));
                    motorcycle.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                    motorcycle.setColor(rs.getString("Color"));
                    contract.setMotorcycle(motorcycle);

                    return details;
                }
            }
        }
        return null;
    }



}