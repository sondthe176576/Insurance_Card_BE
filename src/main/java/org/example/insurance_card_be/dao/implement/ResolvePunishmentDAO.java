package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Punishments;
import org.example.insurance_card_be.model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResolvePunishmentDAO {
    private Connection connection;

    public ResolvePunishmentDAO() {
        this.connection = DBContext.getConnection();
    }

    public Punishments getPunishmentByID(int punishmentID) throws SQLException {
        String sql = "SELECT p.PunishmentID, p.ContractID, p.PunishmentType, p.PunishmentDate, p.Description, p.Status, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.detail AS ContractDetail, cd.value AS ContractValue " +
                "FROM Punishments p " +
                "JOIN Contracts con ON p.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers c ON con.CustomerID = c.CustomerID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "WHERE p.PunishmentID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
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
                user.setProvince(rs.getInt("Province"));
                user.setDistrict(rs.getInt("District"));
                user.setCountry(rs.getInt("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setBirthDate(rs.getString("Birth_date"));

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
                contract.setDetail(rs.getString("ContractDetail"));
                contract.setValue(rs.getDouble("ContractValue"));
                contract.setCustomer(customer);

                Punishments punishment = new Punishments();
                punishment.setPunishmentID(rs.getInt("PunishmentID"));
                punishment.setContractID(rs.getInt("ContractID"));
                punishment.setPunishmentType(rs.getString("PunishmentType"));
                punishment.setPunishmentDate(rs.getDate("PunishmentDate"));
                punishment.setDescription(rs.getString("Description"));
                punishment.setStatus(rs.getString("Status"));
                punishment.setCustomerName(user.getFullName());
                punishment.setCustomer(customer);
                punishment.setContract(contract);

                return punishment;
            }
        }
        return null;
    }

    public void updatePunishmentStatus(int punishmentID, String status) throws SQLException {
        String sql = "UPDATE Punishments SET Status = ? WHERE PunishmentID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, punishmentID);
            ps.executeUpdate();
        }
    }

    public static void main(String[] args) {
        ResolvePunishmentDAO punishmentDAO = new ResolvePunishmentDAO();
        try {
            Punishments punishment = punishmentDAO.getPunishmentByID(1);
            System.out.println(punishment);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}