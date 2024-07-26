package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PunishmentHistoryForStaffDAO {
    public List<PunishmentHistoryDTO> getPunishmentHistories() throws SQLException {
        List<PunishmentHistoryDTO> list = new ArrayList<>();
        String query = "SELECT p.PunishmentID, u.Full_name, p.Description, pu.PunishmentType, p.Date, pu.Status " +
                "FROM PunishmentHistory p " +
                "JOIN Customers c ON p.CustomerID = c.CustomerID " +
                "JOIN Punishments pu ON p.PunishmentID = pu.PunishmentID " +
                "JOIN Users u ON c.UserID = u.UserID";

        try (PreparedStatement stmt = DBContext.getConnection().prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                PunishmentHistoryDTO punishment = new PunishmentHistoryDTO();
                punishment.setPunishmentID(rs.getInt("PunishmentID"));
                punishment.setFullName(rs.getString("Full_name"));
                punishment.setDescription(rs.getString("Description"));
                punishment.setPunishmentType(rs.getString("PunishmentType"));
                punishment.setDate(rs.getDate("Date"));
                punishment.setStatus(rs.getString("Status"));
                list.add(punishment);
            }
        }
        return list;
    }

    public List<PunishmentHistoryDTO> filterByCustomerName(String customerName) throws SQLException {
        List<PunishmentHistoryDTO> list = new ArrayList<>();
        String query = "SELECT p.PunishmentID, u.Full_name, p.Description, pu.PunishmentType, p.Date, pu.Status " +
                "FROM PunishmentHistory p " +
                "JOIN Customers c ON p.CustomerID = c.CustomerID " +
                "JOIN Punishments pu ON p.PunishmentID = pu.PunishmentID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "WHERE u.Full_name LIKE ?";

        try (PreparedStatement stmt = DBContext.getConnection().prepareStatement(query)) {
            stmt.setString(1, "%" + customerName + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    PunishmentHistoryDTO punishment = new PunishmentHistoryDTO();
                    punishment.setPunishmentID(rs.getInt("PunishmentID"));
                    punishment.setFullName(rs.getString("Full_name"));
                    punishment.setDescription(rs.getString("Description"));
                    punishment.setPunishmentType(rs.getString("PunishmentType"));
                    punishment.setDate(rs.getDate("Date"));
                    punishment.setStatus(rs.getString("Status"));
                    list.add(punishment);
                }
            }
        }
        return list;
    }

    public List<PunishmentHistoryDTO> sortByDate(String order) throws SQLException {
        List<PunishmentHistoryDTO> list = new ArrayList<>();
        String query = "SELECT p.PunishmentID, u.Full_name, p.Description, pu.PunishmentType, p.Date, pu.Status " +
                "FROM PunishmentHistory p " +
                "JOIN Customers c ON p.CustomerID = c.CustomerID " +
                "JOIN Punishments pu ON p.PunishmentID = pu.PunishmentID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "ORDER BY p.Date " + order;

        try (PreparedStatement stmt = DBContext.getConnection().prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                PunishmentHistoryDTO punishment = new PunishmentHistoryDTO();
                punishment.setPunishmentID(rs.getInt("PunishmentID"));
                punishment.setFullName(rs.getString("Full_name"));
                punishment.setDescription(rs.getString("Description"));
                punishment.setPunishmentType(rs.getString("PunishmentType"));
                punishment.setDate(rs.getDate("Date"));
                punishment.setStatus(rs.getString("Status"));
                list.add(punishment);
            }
        }
        return list;
    }
    public static Punishments getPunishmentByID(int punishmentID) throws SQLException {
        String sql = "SELECT p.PunishmentID, p.ContractID, p.PunishmentType, p.PunishmentDate, p.Description, p.Status, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM Punishments p " +
                "JOIN Contracts con ON p.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers c ON con.CustomerID = c.CustomerID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "JOIN Motorcycles m ON c.CustomerID = m.CustomerID " +
                "WHERE p.PunishmentID = ?";

        try (PreparedStatement ps = DBContext.getConnection().prepareStatement(sql)) {
            ps.setInt(1, punishmentID);
            ResultSet rs = ps.executeQuery();
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

                return new Punishments(
                        rs.getInt("PunishmentID"),
                        rs.getInt("ContractID"),
                        rs.getString("PunishmentType"),
                        rs.getDate("PunishmentDate"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        contract,
                        customer,
                        user.getFullName()
                );
            }
        }
        return null;
    }
}
