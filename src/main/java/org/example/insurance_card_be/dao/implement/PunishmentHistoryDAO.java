package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.model.PunishmentHistory;
import org.example.insurance_card_be.dao.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PunishmentHistoryDAO {

    public List<PunishmentHistory> getAllPunishmentHistories() {
        List<PunishmentHistory> list = new ArrayList<>();
        String query = "SELECT * FROM PunishmentHistory";

        try (Connection connection = DBContext.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int punishmentID = resultSet.getInt("punishmentID");
                int customerID = resultSet.getInt("customerID");
                String description = resultSet.getString("description");
                Date date = resultSet.getDate("date");

                list.add(new PunishmentHistory(punishmentID, customerID, description, date));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public PunishmentHistory getPunishmentHistoryById(int punishmentID) {
        PunishmentHistory punishmentHistory = null;
        String query = "SELECT * FROM PunishmentHistory WHERE punishmentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, punishmentID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int customerID = resultSet.getInt("customerID");
                    String description = resultSet.getString("description");
                    Date date = resultSet.getDate("date");

                    punishmentHistory = new PunishmentHistory(punishmentID, customerID, description, date);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return punishmentHistory;
    }

    public void addPunishmentHistory(PunishmentHistory punishmentHistory) {
        String query = "INSERT INTO PunishmentHistory (customerID, description, date) VALUES (?, ?, ?)";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, punishmentHistory.getCustomerID());
            preparedStatement.setString(2, punishmentHistory.getDescription());
            if (punishmentHistory.getDate() != null) {
                preparedStatement.setDate(3, new Date(punishmentHistory.getDate().getTime()));
            } else {
                preparedStatement.setDate(3, null); // Or use a default value if necessary
            }

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePunishmentHistory(PunishmentHistory punishmentHistory) {
        String query = "UPDATE PunishmentHistory SET customerID = ?, description = ?, date = ? WHERE punishmentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, punishmentHistory.getCustomerID());
            preparedStatement.setString(2, punishmentHistory.getDescription());
            if (punishmentHistory.getDate() != null) {
                preparedStatement.setDate(3, new Date(punishmentHistory.getDate().getTime()));
            } else {
                preparedStatement.setDate(3, null); // Or use a default value if necessary
            }
            preparedStatement.setInt(4, punishmentHistory.getPunishmentID());

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

    public List<PunishmentHistory> getPunishmentHistoriesByCustomerID(int customerID) {
        List<PunishmentHistory> list = new ArrayList<>();
        String query = "SELECT * FROM PunishmentHistory WHERE customerID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, customerID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int punishmentID = resultSet.getInt("punishmentID");
                    String description = resultSet.getString("description");
                    Date date = resultSet.getDate("date");

                    list.add(new PunishmentHistory(punishmentID, customerID, description, date));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
