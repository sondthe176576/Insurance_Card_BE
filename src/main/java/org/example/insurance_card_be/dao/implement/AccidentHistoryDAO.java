package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

public class AccidentHistoryDAO {
    private Connection connection;

    public AccidentHistoryDAO() {
        this.connection = DBContext.getConnection();
    }

    public List<Accident> getAllAccidents() throws SQLException {
        String sql = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, a.Status, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM Accidents a " +
                "JOIN Contracts con ON a.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers c ON con.CustomerID = c.CustomerID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "JOIN Motorcycles m ON c.CustomerID = m.CustomerID";

        List<Accident> accidents = new ArrayList<>();
        Set<Integer> seenAccidents = new HashSet<>();

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int accidentID = rs.getInt("AccidentID");
                if (seenAccidents.contains(accidentID)) {
                    continue; // Skip duplicate accident
                }
                seenAccidents.add(accidentID);

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

                Accident accident = new Accident(
                        accidentID,
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
                accidents.add(accident);
            }
        }
        return accidents;
    }

    public Accident getAccidentById(int accidentID) throws SQLException {
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, a.Status, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
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
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accidentID);
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

                    Accident accident = new Accident(
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
                    return accident;
                }
            }
        }
        return null;
    }


    public void addAccident(Accident accident) throws SQLException {
        String query = "INSERT INTO Accidents (ContractID, AccidentType, AccidentDate, Description, Status) " +
                "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accident.getContractID());
            stmt.setString(2, accident.getAccidentType());
            stmt.setDate(3, new Date(accident.getAccidentDate().getTime()));
            stmt.setString(4, accident.getDescription());
            stmt.setString(5, accident.getStatus());
            stmt.executeUpdate();
        }
    }

    public void updateAccident(Accident accident) throws SQLException {
        String query = "UPDATE Accidents SET ContractID = ?, AccidentType = ?, AccidentDate = ?, Description = ?, Status = ? " +
                "WHERE AccidentID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accident.getContractID());
            stmt.setString(2, accident.getAccidentType());
            stmt.setDate(3, new Date(accident.getAccidentDate().getTime()));
            stmt.setString(4, accident.getDescription());
            stmt.setString(5, accident.getStatus());
            stmt.setInt(6, accident.getAccidentID());
            stmt.executeUpdate();
        }
    }

    public void deleteAccidentHistory(int accidentID) throws SQLException {
        String query = "DELETE FROM Accidents WHERE AccidentID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accidentID);
            stmt.executeUpdate();
        }
    }

    public boolean isContractValidForCustomer(int contractID, int customerID) throws SQLException {
        String query = "SELECT COUNT(*) FROM Contracts WHERE ContractID = ? AND CustomerID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, contractID);
            stmt.setInt(2, customerID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    public List<Accident> getAccidentsByCustomerID(int customerId) throws SQLException {
        String sql = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, a.Status, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM Accidents a " +
                "JOIN Contracts con ON a.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers c ON con.CustomerID = c.CustomerID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "JOIN Motorcycles m ON c.CustomerID = m.CustomerID " +
                "WHERE c.CustomerID = ?";

        List<Accident> accidents = new ArrayList<>();
        Set<Integer> seenAccidents = new HashSet<>();

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int accidentID = rs.getInt("AccidentID");
                if (seenAccidents.contains(accidentID)) {
                    continue; // Skip duplicate accident
                }
                seenAccidents.add(accidentID);

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

                Accident accident = new Accident(
                        accidentID,
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
                accidents.add(accident);
            }
        }
        return accidents;
    }

    public static void main(String[] args) {
        AccidentHistoryDAO dao = new AccidentHistoryDAO();
        try {
            List<Accident> accidents = dao.getAllAccidents();
            for (Accident accident : accidents) {
                System.out.println(accident);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}