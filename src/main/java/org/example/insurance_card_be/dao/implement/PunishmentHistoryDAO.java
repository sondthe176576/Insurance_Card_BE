package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.model.PunishmentHistoryCus;
import org.example.insurance_card_be.dao.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PunishmentHistoryDAO {

    public List<PunishmentHistoryCus> getAllPunishmentHistories() {
        List<PunishmentHistoryCus> list = new ArrayList<>();
        String query = "SELECT * FROM PunishmentHistory";

        try (Connection connection = DBContext.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int punishmentID = resultSet.getInt("punishmentID");
                int customerID = resultSet.getInt("customerID");
                String description = resultSet.getString("description");
                Date date = resultSet.getDate("date");

                list.add(new PunishmentHistoryCus(punishmentID, customerID, description, date));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public PunishmentHistoryCus getPunishmentHistoryById(int punishmentID) {
        PunishmentHistoryCus punishmentHistoryCus = null;
        String query = "SELECT * FROM PunishmentHistory WHERE punishmentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, punishmentID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int customerID = resultSet.getInt("customerID");
                    String description = resultSet.getString("description");
                    Date date = resultSet.getDate("date");

                    punishmentHistoryCus = new PunishmentHistoryCus(punishmentID, customerID, description, date);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return punishmentHistoryCus;
    }

    public void addPunishmentHistory(PunishmentHistoryCus punishmentHistoryCus) {
        String query = "INSERT INTO PunishmentHistory (customerID, description, date) VALUES (?, ?, ?)";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, punishmentHistoryCus.getCustomerID());
            preparedStatement.setString(2, punishmentHistoryCus.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(punishmentHistoryCus.getDate().getTime()));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePunishmentHistory(PunishmentHistoryCus punishmentHistoryCus) {
        String query = "UPDATE PunishmentHistory SET customerID = ?, description = ?, date = ? WHERE punishmentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, punishmentHistoryCus.getCustomerID());
            preparedStatement.setString(2, punishmentHistoryCus.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(punishmentHistoryCus.getDate().getTime()));
            preparedStatement.setInt(4, punishmentHistoryCus.getPunishmentID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePunishmentHistory(int punishmentID) {
        String query = "DELETE FROM PunishmentHistory WHERE punishmentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, punishmentID);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<PunishmentHistoryCus> getPunishmentHistoriesByCustomerID(int customerID) {
        List<PunishmentHistoryCus> list = new ArrayList<>();
        String query = "SELECT * FROM PunishmentHistory WHERE customerID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, customerID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int punishmentID = resultSet.getInt("punishmentID");
                    String description = resultSet.getString("description");
                    Date date = resultSet.getDate("date");

                    list.add(new PunishmentHistoryCus(punishmentID, customerID, description, date));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
