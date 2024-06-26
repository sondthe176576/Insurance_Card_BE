package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.model.ContractInformation;
import org.example.insurance_card_be.dao.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractInformationDAO {

    // Retrieve all contracts
    public List<ContractInformation> getAllContracts() {
        List<ContractInformation> contracts = new ArrayList<>();
        String query = "SELECT ContractID, CustomerID, ContractInfo, Status, StartDate, EndDate FROM Contracts";

        try (Connection connection = DBContext.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int contractID = resultSet.getInt("ContractID");
                int customerID = resultSet.getInt("CustomerID");
                String contractInfo = resultSet.getString("ContractInfo");
                String status = resultSet.getString("Status");
                Date startDate = resultSet.getDate("StartDate");
                Date endDate = resultSet.getDate("EndDate");

                contracts.add(new ContractInformation(contractID, customerID, contractInfo, status, startDate, endDate));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contracts;
    }

    // Retrieve a contract by ID
    public ContractInformation getContractById(int contractID) {
        ContractInformation contractInformation = null;
        String query = "SELECT * FROM Contracts WHERE ContractID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, contractID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int customerID = resultSet.getInt("CustomerID");
                    String contractInfo = resultSet.getString("ContractInfo");
                    String status = resultSet.getString("Status");
                    Date startDate = resultSet.getDate("StartDate");
                    Date endDate = resultSet.getDate("EndDate");

                    contractInformation = new ContractInformation(contractID, customerID, contractInfo, status, startDate, endDate);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contractInformation;
    }

    // Add a new contract
    public void addContract(ContractInformation contract) {
        String query = "INSERT INTO Contracts (CustomerID, ContractInfo, Status, StartDate, EndDate) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, contract.getCustomerID());
            preparedStatement.setString(2, contract.getContractInfo());
            preparedStatement.setString(3, contract.getStatus());
            preparedStatement.setDate(4, new java.sql.Date(contract.getStartDate().getTime()));
            preparedStatement.setDate(5, new java.sql.Date(contract.getEndDate().getTime()));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update an existing contract
    public void updateContract(ContractInformation contract) {
        String query = "UPDATE Contracts SET CustomerID = ?, ContractInfo = ?, Status = ?, StartDate = ?, EndDate = ? WHERE ContractID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, contract.getCustomerID());
            preparedStatement.setString(2, contract.getContractInfo());
            preparedStatement.setString(3, contract.getStatus());
            preparedStatement.setDate(4, new java.sql.Date(contract.getStartDate().getTime()));
            preparedStatement.setDate(5, new java.sql.Date(contract.getEndDate().getTime()));
            preparedStatement.setInt(6, contract.getContractID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a contract by ID
    public void deleteContract(int contractID) {
        String query = "DELETE FROM Contracts WHERE ContractID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, contractID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ContractInformationDAO contractInformationDAO = new ContractInformationDAO();
        List<ContractInformation> contracts = contractInformationDAO.getAllContracts();
        for (ContractInformation contract : contracts) {
            System.out.println(contract);
        }
    }
}
