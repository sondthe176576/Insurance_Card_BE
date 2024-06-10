package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Punishments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PunishmentDAO {
    private Connection connection;

    public PunishmentDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Punishments> getAllPunishments() throws SQLException {
        List<Punishments> punishments = new ArrayList<>();
        String query = "SELECT p.PunishmentID, p.ContractID, p.PunishmentType, p.PunishmentDate, p.Description, p.Status, " +
                "co.CustomerID, u.Full_name AS CustomerName, co.CancellationDate " +
                "FROM Punishments p " +
                "JOIN Contracts co ON p.ContractID = co.ContractID " +
                "JOIN Customers cu ON co.CustomerID = cu.CustomerID " +
                "JOIN Users u ON cu.UserID = u.UserID";

        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Punishments punishment = new Punishments();
                punishment.setPunishmentID(resultSet.getInt("PunishmentID"));
                punishment.setContractID(resultSet.getInt("ContractID"));
                punishment.setPunishmentType(resultSet.getString("PunishmentType"));
                punishment.setPunishmentDate(resultSet.getDate("PunishmentDate"));
                punishment.setDescription(resultSet.getString("Description"));
                punishment.setStatus(resultSet.getString("Status"));
                punishment.setCustomerName(resultSet.getString("CustomerName"));

                // Create and set Contract object
                Contract contract = new Contract();
                contract.setContractID(resultSet.getInt("ContractID"));
                contract.setCancellationDate(resultSet.getDate("CancellationDate"));
                punishment.setContract(contract);

                // Create and set Customers object
                Customers customer = new Customers();
                customer.setCustomerID(resultSet.getInt("CustomerID"));
                punishment.setCustomer(customer);
                punishments.add(punishment);
            }
        }
        return punishments;
    }
}