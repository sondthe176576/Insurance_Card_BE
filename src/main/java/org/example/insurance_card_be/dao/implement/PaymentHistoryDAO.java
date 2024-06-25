package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.model.PaymentHistoryCus;
import org.example.insurance_card_be.dao.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class PaymentHistoryDAO {

    public List<PaymentHistoryCus> getAllPaymentHistories() {
        List<PaymentHistoryCus> list = new ArrayList<>();
        String query = "SELECT * FROM PaymentHistory";

        try (Connection connection = DBContext.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int paymentID = resultSet.getInt("paymentID");
                int customerID = resultSet.getInt("customerID");
                BigDecimal amount = resultSet.getBigDecimal("amount");
                Date paymentDate = resultSet.getDate("paymentDate");
                int paymentMethodID = resultSet.getInt("paymentMethodID");
                int contractID = resultSet.getInt("contractID");

                list.add(new PaymentHistoryCus(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public PaymentHistoryCus getPaymentHistoryById(int paymentID) {
        PaymentHistoryCus paymentHistoryCus = null;
        String query = "SELECT * FROM PaymentHistory WHERE paymentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, paymentID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int customerID = resultSet.getInt("customerID");
                    BigDecimal amount = resultSet.getBigDecimal("amount");
                    Date paymentDate = resultSet.getDate("paymentDate");
                    int paymentMethodID = resultSet.getInt("paymentMethodID");
                    int contractID = resultSet.getInt("contractID");

                    paymentHistoryCus = new PaymentHistoryCus(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return paymentHistoryCus;
    }

    public void addPaymentHistory(PaymentHistoryCus paymentHistoryCus) {
        String query = "INSERT INTO PaymentHistory (customerID, amount, paymentDate, paymentMethodID, contractID) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, paymentHistoryCus.getCustomerID());
            preparedStatement.setBigDecimal(2, paymentHistoryCus.getAmount());
            preparedStatement.setDate(3, new java.sql.Date(paymentHistoryCus.getPaymentDate().getTime()));
            preparedStatement.setInt(4, paymentHistoryCus.getPaymentMethodID());
            preparedStatement.setInt(5, paymentHistoryCus.getContractID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePaymentHistory(PaymentHistoryCus paymentHistoryCus) {
        String query = "UPDATE PaymentHistory SET customerID = ?, amount = ?, paymentDate = ?, paymentMethodID = ?, contractID = ? WHERE paymentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, paymentHistoryCus.getCustomerID());
            preparedStatement.setBigDecimal(2, paymentHistoryCus.getAmount());
            preparedStatement.setDate(3, new java.sql.Date(paymentHistoryCus.getPaymentDate().getTime()));
            preparedStatement.setInt(4, paymentHistoryCus.getPaymentMethodID());
            preparedStatement.setInt(5, paymentHistoryCus.getContractID());
            preparedStatement.setInt(6, paymentHistoryCus.getPaymentID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePaymentHistory(int paymentID) {
        String query = "DELETE FROM PaymentHistory WHERE paymentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, paymentID);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        PaymentHistoryDAO paymentHistoryDAO = new PaymentHistoryDAO();
        List<PaymentHistoryCus> list = paymentHistoryDAO.getAllPaymentHistories();
        for (PaymentHistoryCus paymentHistoryCus : list) {
            System.out.println(paymentHistoryCus);
        }
    }

}
