package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;
import org.example.insurance_card_be.model.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ViewContractDAO {
    private Connection connection;

    public ViewContractDAO() {
        this.connection = DBContext.getConnection();
    }

    public Contract getContractDetailById(int contractID) throws Exception {
        String query = "SELECT u.UserID, u.Username, u.Email, u.Mobile, u.Address, u.FullName, u.Gender, " +
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
        }
        return contract;
    }

    // Ham main de chay thu
    public static void main(String[] args) {
        ViewContractDAO viewContractDAO = new ViewContractDAO();
        try {
            Contract contract = viewContractDAO.getContractDetailById(1);
            System.out.println(contract);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}