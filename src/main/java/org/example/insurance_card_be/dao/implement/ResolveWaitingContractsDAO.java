package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResolveWaitingContractsDAO {
    private Connection connection;

    public ResolveWaitingContractsDAO() {
        this.connection = DBContext.getConnection();
    }

    public Contract getContractDetailById(int contractID) throws SQLException {
        String query = "SELECT u.UserID, u.Username, u.Email, u.Mobile, u.Full_name, u.Gender, " +
                "u.Province, u.District, u.Country, u.First_name, u.Last_name, u.Birth_date, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color, " +
                "ph.PaymentID, ph.Amount AS PaymentAmount, ph.PaymentDate, ph.PaymentMethodID, " +
                "pm.PaymentMethodID, pm.MethodType, pm.Details " +
                "FROM dbo.Users u " +
                "JOIN dbo.Customers c ON u.UserID = c.UserID " +
                "JOIN dbo.Contracts con ON c.CustomerID = con.CustomerID " +
                "JOIN dbo.ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN dbo.Motorcycles m ON c.CustomerID = m.CustomerID " +
                "LEFT JOIN dbo.PaymentHistory ph ON con.ContractID = ph.ContractID " +
                "LEFT JOIN dbo.PaymentMethods pm ON ph.PaymentMethodID = pm.PaymentMethodID " +
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

                    PaymentHistory paymentHistory = new PaymentHistory();
                    paymentHistory.setPaymentID(rs.getInt("PaymentID"));
                    paymentHistory.setAmount(rs.getBigDecimal("PaymentAmount"));
                    paymentHistory.setPaymentDate(rs.getDate("PaymentDate"));
                    paymentHistory.setPaymentMethodID(rs.getInt("PaymentMethodID"));

                    PaymentMethod paymentMethod = new PaymentMethod();
                    paymentMethod.setPaymentMethodID(rs.getInt("PaymentMethodID"));
                    paymentMethod.setMethodType(rs.getString("MethodType"));
                    paymentMethod.setDetails(rs.getString("Details"));

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
                    contract.setPaymentHistory(paymentHistory);
                    contract.setPaymentMethod(paymentMethod);
                }
            }
        }
        return contract;
    }

    public void updateContractStatus(int contractID, String status) throws SQLException {
        String query = "UPDATE dbo.Contracts SET Status = ? WHERE ContractID = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, contractID);
            ps.executeUpdate();
        }
    }

    // Add other DAO methods as needed
}