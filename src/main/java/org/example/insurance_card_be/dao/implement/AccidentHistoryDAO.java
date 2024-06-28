package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.model.AccidentHistoryCus;
import org.example.insurance_card_be.dao.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccidentHistoryDAO {

    public List<AccidentHistoryCus> getAllAccidentHistories() {
        List<AccidentHistoryCus> list = new ArrayList<>();
        String query = "SELECT [AccidentID], [CustomerID], [Description], [Date] FROM [SWP391_TEAM6].[dbo].[AccidentHistory]";

        try (Connection connection = DBContext.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int accidentID = resultSet.getInt("AccidentID");
                int customerID = resultSet.getInt("CustomerID");
                String description = resultSet.getString("Description");
                Date accidentDate = resultSet.getDate("Date");

                list.add(new AccidentHistoryCus(accidentID, customerID, description, accidentDate));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public AccidentHistoryCus getAccidentHistoryById(int accidentID) {
        AccidentHistoryCus accidentHistoryCus = null;
        String query = "SELECT [AccidentID], [CustomerID], [Description], [Date] FROM [SWP391_TEAM6].[dbo].[AccidentHistory] WHERE [AccidentID] = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, accidentID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int customerID = resultSet.getInt("CustomerID");
                    String description = resultSet.getString("Description");
                    Date accidentDate = resultSet.getDate("Date");

                    accidentHistoryCus = new AccidentHistoryCus(accidentID, customerID, description, accidentDate);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accidentHistoryCus;
    }

    public void addAccidentHistory(AccidentHistoryCus accidentHistoryCus) {
        String query = "INSERT INTO [SWP391_TEAM6].[dbo].[AccidentHistory] ([CustomerID], [Description], [Date]) VALUES (?, ?, ?)";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, accidentHistoryCus.getCustomerID());
            preparedStatement.setString(2, accidentHistoryCus.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(accidentHistoryCus.getAccidentDate().getTime()));

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAccidentHistory(AccidentHistoryCus accidentHistoryCus) {
        String query = "UPDATE [SWP391_TEAM6].[dbo].[AccidentHistory] SET [CustomerID] = ?, [Description] = ?, [Date] = ? WHERE [AccidentID] = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, accidentHistoryCus.getCustomerID());
            preparedStatement.setString(2, accidentHistoryCus.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(accidentHistoryCus.getAccidentDate().getTime()));
            preparedStatement.setInt(4, accidentHistoryCus.getAccidentID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAccidentHistory(int accidentID) {
        String query = "DELETE FROM [SWP391_TEAM6].[dbo].[AccidentHistory] WHERE [AccidentID] = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, accidentID);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<AccidentHistoryCus> getAccidentHistoriesByCustomerID(int customerID) {
        List<AccidentHistoryCus> list = new ArrayList<>();
        String query = "SELECT [AccidentID], [CustomerID], [Description], [Date] FROM [SWP391_TEAM6].[dbo].[AccidentHistory] WHERE [CustomerID] = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, customerID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int accidentID = resultSet.getInt("AccidentID");
                    String description = resultSet.getString("Description");
                    Date accidentDate = resultSet.getDate("Date");

                    list.add(new AccidentHistoryCus(accidentID, customerID, description, accidentDate));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

}
