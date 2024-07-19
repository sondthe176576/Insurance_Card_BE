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

    public List<CompensationHistoryDTO> getAllCompensationHistories() throws SQLException {
        List<CompensationHistoryDTO> histories = new ArrayList<>();
        String query = "SELECT ch.CustomerID, ch.CompensationID, ch.Amount, ch.Date, c.Status, u.Full_name, c.ContractID " +
                "FROM CompensationHistory ch " +
                "JOIN CompensationRequests c ON ch.CustomerID = c.CustomerID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "JOIN Contracts ct ON c.ContractID = ct.ContractID";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
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
        return histories;
    }

    public List<CompensationHistoryDTO> filterByCustomerName(String customerName) throws SQLException {
        List<CompensationHistoryDTO> histories = new ArrayList<>();
        String query = "SELECT ch.CustomerID, ch.CompensationID, ch.Amount, ch.Date, c.Status, u.Full_name, c.ContractID " +
                "FROM CompensationHistory ch " +
                "JOIN CompensationRequests c ON ch.CustomerID = c.CustomerID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "JOIN Contracts ct ON c.ContractID = ct.ContractID " +
                "WHERE u.Full_name LIKE ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, "%" + customerName + "%");
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

    public List<CompensationHistoryDTO> sortByDate(String order) throws SQLException {
        List<CompensationHistoryDTO> histories = new ArrayList<>();
        String query = "SELECT ch.CustomerID, ch.CompensationID, ch.Amount, ch.Date, c.Status, u.Full_name, c.ContractID " +
                "FROM CompensationHistory ch " +
                "JOIN CompensationRequests c ON ch.CustomerID = c.CustomerID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "JOIN Contracts ct ON c.ContractID = ct.ContractID " +
                "ORDER BY ch.Date " + order;

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
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
        return histories;
    }


    public CompensationHistoryDTO getCompensationRequestDetails(int compensationId) throws SQLException {
        String query = "SELECT ch.CompensationID, ch.CustomerID, ch.Amount, ch.Date AS RequestDate, cr.Status, cr.Description, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, con.InsuranceType, con.Coverage, con.Premium, " +
                "cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM CompensationHistory ch " +
                "JOIN CompensationRequests cr ON ch.CompensationID = cr.RequestID " +
                "JOIN Contracts con ON cr.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers cust ON cr.CustomerID = cust.CustomerID " +
                "JOIN Users u ON cust.UserID = u.UserID " +
                "JOIN Motorcycles m ON cust.CustomerID = m.CustomerID " +
                "WHERE ch.CompensationID = ?";
        System.out.println("Executing query: " + query);
        System.out.println("Compensation ID: " + compensationId);
        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, compensationId);

            try (ResultSet rs = stmt.executeQuery()) {
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

                    CompensationHistoryDTO details = new CompensationHistoryDTO();
                    details.setCompensationID(rs.getInt("CompensationID"));
                    details.setCustomerID(rs.getInt("CustomerID"));
                    details.setContractID(rs.getInt("ContractID"));
                    details.setDate(rs.getDate("RequestDate"));
                    details.setStatus(rs.getString("Status"));
                    details.setDescription(rs.getString("Description"));
                    details.setAmount(rs.getBigDecimal("Amount"));
                    details.setUsers(user);
                    details.setContract(contract);
                    return details;
                }
            }

        }
        return null;

    }
    public List<CompensationHistoryDTO> getCompensationHistories(int offset, int limit) throws SQLException {
        List<CompensationHistoryDTO> histories = new ArrayList<>();
        String query = "SELECT ch.CustomerID, ch.CompensationID, ch.Amount, ch.Date, c.Status, u.Full_name, c.ContractID " +
                "FROM CompensationHistory ch " +
                "JOIN CompensationRequests c ON ch.CustomerID = c.CustomerID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "JOIN Contracts ct ON c.ContractID = ct.ContractID " +
                "ORDER BY ch.Date " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, offset);
            stmt.setInt(2, limit);

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

    // Method to get total number of compensation histories
    public int getTotalCompensationHistories() throws SQLException {
        String query = "SELECT COUNT(*) AS total FROM CompensationHistory";
        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        }
        return 0;
    }


}