package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Accident;
import org.example.insurance_card_be.model.Contract;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccidentHistoryDAO {
    private Connection connection;

    public AccidentHistoryDAO() {
        this.connection = DBContext.getConnection();
    }

    public List<Accident> getAllAccidents() throws SQLException {
        List<Accident> accidents = new ArrayList<>();
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, u.Full_name AS CustomerName, a.Status " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Accident accident = new Accident();
                accident.setAccidentID(rs.getInt("AccidentID"));
                accident.setContractID(rs.getInt("ContractID"));
                accident.setAccidentType(rs.getString("AccidentType"));
                accident.setAccidentDate(rs.getDate("AccidentDate"));
                accident.setDescription(rs.getString("Description"));
                accident.setCustomerID(rs.getInt("CustomerID"));
                accident.setCustomerName(rs.getString("CustomerName"));
                accident.setStatus(rs.getString("Status"));
                accidents.add(accident);
            }
        }
        return accidents;
    }

    public int getTotalAccidents(String status, String customerName) throws SQLException {
        String query = "SELECT COUNT(a.AccidentID) AS Total " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID ";
        List<String> conditions = new ArrayList<>();
        if (status != null && !status.isEmpty()) {
            conditions.add("a.Status = ?");
        }
        if (customerName != null && !customerName.isEmpty()) {
            conditions.add("u.Full_name LIKE ?");
        }
        if (!conditions.isEmpty()) {
            query += "WHERE " + String.join(" AND ", conditions);
        }
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            int paramIndex = 1;
            if (status != null && !status.isEmpty()) {
                stmt.setString(paramIndex++, status);
            }
            if (customerName != null && !customerName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + customerName + "%");
            }
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Total");
                }
            }
        }
        return 0;
    }

    public Accident getAccidentById(int accidentID) throws SQLException {
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, u.Full_name AS CustomerName, a.Status " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE a.AccidentID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, accidentID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Accident accident = new Accident();
                    accident.setAccidentID(rs.getInt("AccidentID"));
                    accident.setContractID(rs.getInt("ContractID"));
                    accident.setAccidentType(rs.getString("AccidentType"));
                    accident.setAccidentDate(rs.getDate("AccidentDate"));
                    accident.setDescription(rs.getString("Description"));
                    accident.setCustomerID(rs.getInt("CustomerID"));
                    accident.setCustomerName(rs.getString("CustomerName"));
                    accident.setStatus(rs.getString("Status"));
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

    public List<Accident> getAccidentsByCustomerID(int customerID) throws SQLException {
        List<Accident> accidents = new ArrayList<>();
        String query = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, a.Description, c.CustomerID, u.Full_name AS CustomerName, a.Status " +
                "FROM Accidents a " +
                "JOIN Contracts c ON a.ContractID = c.ContractID " +
                "JOIN Customers cu ON c.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID " +
                "WHERE cu.CustomerID = ? ORDER BY a.AccidentDate DESC";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Accident accident = new Accident();
                    accident.setAccidentID(rs.getInt("AccidentID"));
                    accident.setContractID(rs.getInt("ContractID"));
                    accident.setAccidentType(rs.getString("AccidentType"));
                    accident.setAccidentDate(rs.getDate("AccidentDate"));
                    accident.setDescription(rs.getString("Description"));
                    accident.setCustomerID(rs.getInt("CustomerID"));
                    accident.setCustomerName(rs.getString("CustomerName"));
                    accident.setStatus(rs.getString("Status"));
                    accidents.add(accident);
                }
            }
        }
        return accidents;
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

    public List<Contract> getAllContracts() throws SQLException {
        List<Contract> contracts = new ArrayList<>();
        String query = "SELECT ContractID, CustomerID, ContractInfo, Status, StartDate, EndDate, Detail, Value, Coverage, InsuranceType, Premium, CancellationDate, MethodPaymentType FROM Contracts";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Contract contract = new Contract();
                contract.setContractID(rs.getInt("ContractID"));
                contract.setCustomerID(rs.getInt("CustomerID"));
                contract.setContractInfo(rs.getString("ContractInfo"));
                contract.setStatus(rs.getString("Status"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDetail(rs.getString("Detail"));
                contract.setValue(rs.getDouble("Value"));
                contract.setCoverage(rs.getString("Coverage"));
                contract.setInsuranceType(rs.getString("InsuranceType"));
                contract.setPremium(rs.getDouble("Premium"));
                contract.setCancellationDate(rs.getDate("CancellationDate"));
                contract.setMethodPaymentType(rs.getString("MethodPaymentType"));
                contracts.add(contract);
            }
        }
        return contracts;
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
