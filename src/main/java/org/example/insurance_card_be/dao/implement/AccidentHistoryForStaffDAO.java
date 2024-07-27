package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccidentHistoryForStaffDAO {

    // Method to get approved accident histories (assuming "approved" means certain status, adjust if needed)
    public List<AccidentHistoryDTO> getAccidentHistories() throws SQLException {
        List<AccidentHistoryDTO> list = new ArrayList<>();
        String query = "SELECT " +
                "    u.Full_name, " +
                "    ah.AccidentID AS accidentHistory, " +
                "    a.AccidentType, " +
                "    a.Status, " +
                "    ah.Description, " +
                "    ah.Date " +
                "FROM " +
                "    AccidentHistory ah " +
                "JOIN " +
                "    Customers c ON ah.CustomerID = c.CustomerID " +
                "JOIN " +
                "    Users u ON c.UserID = u.UserID " +
                "LEFT JOIN " +
                "    Contracts con ON c.CustomerID = con.CustomerID " +
                "LEFT JOIN " +
                "    Accidents a ON con.ContractID = a.ContractID " ;

                 // Adjust based on the actual status field criteria

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                AccidentHistoryDTO accident = new AccidentHistoryDTO();
                accident.setFullName(rs.getString("Full_name"));
                accident.setAccidentID(rs.getInt("accidentHistory"));
                accident.setAccidentType(rs.getString("AccidentType"));
                accident.setStatus(rs.getString("Status"));
                accident.setDescription(rs.getString("Description"));
                accident.setDate(rs.getDate("Date"));
                list.add(accident);
            }
        }
        return list;
    }

    // Method to filter accident histories by customer name
    public List<AccidentHistoryDTO> filterByCustomerName(String customerName) throws SQLException {
        List<AccidentHistoryDTO> list = new ArrayList<>();
        String query = "SELECT " +
                "    u.Full_name, " +
                "    ah.AccidentID AS accidentHistory, " +
                "    a.AccidentType, " +
                "    a.Status, " +
                "    ah.Description, " +
                "    ah.Date " +
                "FROM " +
                "    AccidentHistory ah " +
                "JOIN " +
                "    Customers c ON ah.CustomerID = c.CustomerID " +
                "JOIN " +
                "    Users u ON c.UserID = u.UserID " +
                "LEFT JOIN " +
                "    Contracts con ON c.CustomerID = con.CustomerID " +
                "LEFT JOIN " +
                "    Accidents a ON con.ContractID = a.ContractID " +
                "WHERE u.Full_name LIKE ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, "%" + customerName + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccidentHistoryDTO accident = new AccidentHistoryDTO();
                    accident.setFullName(rs.getString("Full_name"));
                    accident.setAccidentID(rs.getInt("accidentHistory"));
                    accident.setAccidentType(rs.getString("AccidentType"));
                    accident.setStatus(rs.getString("Status"));
                    accident.setDescription(rs.getString("Description"));
                    accident.setDate(rs.getDate("Date"));
                    list.add(accident);
                }
            }
        }
        return list;
    }

    // Method to sort accident histories by date
    public List<AccidentHistoryDTO> sortByDate(String order) throws SQLException {
        List<AccidentHistoryDTO> list = new ArrayList<>();
        String query = "SELECT " +
                "    u.Full_name, " +
                "    ah.AccidentID AS accidentHistory, " +
                "    a.AccidentType, " +
                "    a.Status, " +
                "    ah.Description, " +
                "    ah.Date " +
                "FROM " +
                "    AccidentHistory ah " +
                "JOIN " +
                "    Customers c ON ah.CustomerID = c.CustomerID " +
                "JOIN " +
                "    Users u ON c.UserID = u.UserID " +
                "LEFT JOIN " +
                "    Contracts con ON c.CustomerID = con.CustomerID " +
                "LEFT JOIN " +
                "    Accidents a ON con.ContractID = a.ContractID " +
                "ORDER BY ah.Date " + order;

        try (Connection connection = DBContext.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                AccidentHistoryDTO accident = new AccidentHistoryDTO();
                accident.setFullName(rs.getString("Full_name"));
                accident.setAccidentID(rs.getInt("accidentHistory"));
                accident.setAccidentType(rs.getString("AccidentType"));
                accident.setStatus(rs.getString("Status"));
                accident.setDescription(rs.getString("Description"));
                accident.setDate(rs.getDate("Date"));
                list.add(accident);
            }
        }
        return list;
    }


    // Method to get accident details by ID
    public AccidentHistoryDTO getAccidentByID(int accidentID) throws SQLException {
        String sql = "SELECT " +
                "    u.UserID, " +
                "    u.Username, " +
                "    u.Email, " +
                "    u.Mobile, " +
                "    u.Full_name, " +
                "    u.Gender, " +
                "    u.Province, " +
                "    u.District, " +
                "    u.Country, " +
                "    u.First_name, " +
                "    u.Last_name, " +
                "    u.Birth_date, " +
                "    c.CustomerID, " +
                "    c.PersonalInfo, " +
                "    ah.AccidentID AS HistoryAccidentID, " +
                "    ah.Description AS HistoryDescription, " +
                "    ah.Date AS HistoryDate, " +
                "    a.AccidentID, " +
                "    a.ContractID, " +
                "    a.AccidentType, " +
                "    a.AccidentDate, " +
                "    a.Description , " +
                "    a.Status , " +
                "    con.ContractID AS ContractID, " +
                "    con.ContractInfo, " +
                "    con.Status , " +
                "    con.StartDate, " +
                "    con.EndDate, " +
                "    con.InsuranceType, " +
                "    con.Coverage, " +
                "    con.Premium, " +
                "    cd.Detail, " +
                "    cd.Value, " +
                "    m.MotorcycleID, " +
                "    m.LicensePlate, " +
                "    m.Brand, " +
                "    m.Model, " +
                "    m.FrameNumber, " +
                "    m.EngineNumber, " +
                "    m.YearOfManufacture, " +
                "    m.Color " +
                "FROM " +
                "    Users u " +
                "JOIN " +
                "    Customers c ON u.UserID = c.UserID " +
                "LEFT JOIN " +
                "    AccidentHistory ah ON c.CustomerID = ah.CustomerID " +
                "LEFT JOIN " +
                "    Contracts con ON c.CustomerID = con.CustomerID " +
                "LEFT JOIN " +
                "    Accidents a ON con.ContractID = a.ContractID " +
                "LEFT JOIN " +
                "    ContractDetails cd ON con.ContractID = cd.ContractID " +
                "LEFT JOIN " +
                "    Motorcycles m ON c.CustomerID = m.CustomerID " +
                "WHERE " +
                "    ah.AccidentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accidentID);
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

                    // Extracting customer details
                    Customers customer = new Customers();
                    customer.setCustomerID(rs.getInt("CustomerID"));
                    customer.setPersonalInfo(rs.getString("PersonalInfo"));
                    customer.setUser(user);

                    // Extracting motorcycle details
                    Motorcycle motorcycle = new Motorcycle();
                    motorcycle.setMotorcycleID(rs.getInt("MotorcycleID"));
                    motorcycle.setLicensePlate(rs.getString("LicensePlate"));
                    motorcycle.setBrand(rs.getString("Brand"));
                    motorcycle.setModel(rs.getString("Model"));
                    motorcycle.setFrameNumber(rs.getString("FrameNumber"));
                    motorcycle.setEngineNumber(rs.getString("EngineNumber"));
                    motorcycle.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                    motorcycle.setColor(rs.getString("Color"));

                    // Extracting contract details
                    Contract contract = new Contract();
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

                    // Extracting accident details
                    Accident accident = new Accident();
                    accident.setAccidentID(rs.getInt("AccidentID"));
                    accident.setContractID(rs.getInt("ContractID"));
                    accident.setAccidentType(rs.getString("AccidentType"));
                    accident.setAccidentDate(rs.getDate("AccidentDate"));
                    accident.setDescription(rs.getString("Description"));
                    accident.setStatus(rs.getString("Status"));
                    accident.setContract(contract);
                    accident.setCustomer(customer);

                    // Extracting accident history details
                    AccidentHistoryDTO accidentHistory = new AccidentHistoryDTO();
                    accidentHistory.setAccidentID(rs.getInt("accidentHistory"));
                    accidentHistory.setDate(rs.getDate("Date"));
                    accidentHistory.setAccidentType(rs.getString("AccidentType"));
                    accidentHistory.setDescription(rs.getString("Description"));
                    accidentHistory.setStatus(rs.getString("Status"));
                    return accidentHistory;
                }
            }
        }
        return null;
    }

}
