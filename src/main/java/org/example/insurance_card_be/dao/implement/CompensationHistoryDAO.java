package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.model.CompensationHistory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

import org.example.insurance_card_be.dao.DBContext;

public class CompensationHistoryDAO {

    public List<CompensationHistory> getAllCompensationHistories() {
        List<CompensationHistory> list = new ArrayList<>();
        String query = "SELECT * FROM CompensationHistory";

        try (Connection connection = DBContext.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int compensationID = resultSet.getInt("compensationID");
                int customerID = resultSet.getInt("CustomerID");
                BigDecimal amount = resultSet.getBigDecimal("amount");
                Date date = resultSet.getDate("date");

                list.add(new CompensationHistory(compensationID, customerID, amount, date));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    public CompensationHistory getCompensationHistoryById(int compensationID) {
        CompensationHistory compensationHistory = null;
        String query = "SELECT * FROM CompensationHistory WHERE compensationID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, compensationID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int customerID = resultSet.getInt("CustomerID");
                    BigDecimal amount = resultSet.getBigDecimal("amount");
                    Date date = resultSet.getDate("date");

                    compensationHistory = new CompensationHistory(compensationID, customerID, amount, date);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return compensationHistory;
    }


    public void addCompensationHistory(CompensationHistory compensationHistory) {
        String query = "INSERT INTO CompensationHistory (CustomerID, amount, date) VALUES (?, ?, ?)";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, compensationHistory.getCustomerID());
            preparedStatement.setBigDecimal(2, compensationHistory.getAmount());
            preparedStatement.setDate(3, new java.sql.Date(compensationHistory.getDate().getTime()));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCompensationHistory(CompensationHistory compensationHistory) {
        String query = "UPDATE CompensationHistory SET CustomerID = ?, amount = ?, date = ? WHERE compensationID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, compensationHistory.getCustomerID());
            preparedStatement.setBigDecimal(2, compensationHistory.getAmount());
            preparedStatement.setDate(3, new java.sql.Date(compensationHistory.getDate().getTime()));
            preparedStatement.setInt(4, compensationHistory.getCompensationID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCompensationHistory(int compensationID) {
        String query = "DELETE FROM CompensationHistory WHERE compensationID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, compensationID);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
