package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.PaymentHistoryCustomer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class PaymentHistoryDAO {

    private static final Logger logger = LoggerFactory.getLogger(PaymentHistoryDAO.class);

    public List<PaymentHistoryCustomer> getAllPaymentHistories() {
        List<PaymentHistoryCustomer> list = new ArrayList<>();
        String query = "SELECT ph.*, u.Full_name AS CustomerName " +
                "FROM PaymentHistory ph " +
                "JOIN Customers c ON ph.customerID = c.customerID " +
                "JOIN Users u ON c.userID = u.userID";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int paymentID = resultSet.getInt("paymentID");
                int customerID = resultSet.getInt("customerID");
                BigDecimal amount = resultSet.getBigDecimal("amount");
                Date paymentDate = resultSet.getDate("paymentDate");
                int paymentMethodID = resultSet.getInt("paymentMethodID");
                int contractID = resultSet.getInt("contractID");
                PaymentHistoryCustomer paymentHistoryCustomer = new PaymentHistoryCustomer(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID );
                list.add(paymentHistoryCustomer);
            }
        } catch (SQLException e) {
            logger.error("Error getting all payment histories", e);
        }

        return list;
    }

    public PaymentHistoryCustomer getPaymentHistoryById(int paymentID) {
        PaymentHistoryCustomer paymentHistoryCustomer = null;
        String query = "SELECT ph.*, u.Full_name AS CustomerName " +
                "FROM PaymentHistory ph " +
                "JOIN Customers c ON ph.customerID = c.customerID " +
                "JOIN Users u ON c.userID = u.userID " +
                "WHERE ph.paymentID = ?";

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

                    paymentHistoryCustomer = new PaymentHistoryCustomer(paymentID, customerID, amount, paymentDate,paymentMethodID, contractID);
                }
            }
        } catch (SQLException e) {
            logger.error("Error getting payment history by ID", e);
        }

        return paymentHistoryCustomer;
    }

    public void addPaymentHistory(PaymentHistoryCustomer paymentHistoryCustomer) {
        String query = "INSERT INTO PaymentHistory (customerID, amount, paymentDate, paymentMethodID, contractID) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, paymentHistoryCustomer.getCustomerID());
            preparedStatement.setBigDecimal(2, paymentHistoryCustomer.getAmount());
            preparedStatement.setDate(3, new java.sql.Date(paymentHistoryCustomer.getPaymentDate().getTime()));
            preparedStatement.setInt(4, paymentHistoryCustomer.getPaymentMethodID());
            preparedStatement.setInt(5, paymentHistoryCustomer.getContractID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.error("Error adding payment history", e);
        }
    }

    public void updatePaymentHistory(PaymentHistoryCustomer paymentHistoryCustomer) {
        String query = "UPDATE PaymentHistory SET customerID = ?, amount = ?, paymentDate = ?, paymentMethodID = ?, contractID = ? WHERE paymentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, paymentHistoryCustomer.getCustomerID());
            preparedStatement.setBigDecimal(2, paymentHistoryCustomer.getAmount());
            preparedStatement.setDate(3, new java.sql.Date(paymentHistoryCustomer.getPaymentDate().getTime()));
            preparedStatement.setInt(4, paymentHistoryCustomer.getPaymentMethodID());
            preparedStatement.setInt(5, paymentHistoryCustomer.getContractID());
            preparedStatement.setInt(6, paymentHistoryCustomer.getPaymentID());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.error("Error updating payment history", e);
        }
    }

    public void deletePaymentHistory(int paymentID) {
        String query = "DELETE FROM PaymentHistory WHERE paymentID = ?";

        try (Connection connection = DBContext.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, paymentID);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            logger.error("Error deleting payment history", e);
        }
    }

    public static void main(String[] args) {
        PaymentHistoryDAO paymentHistoryDAO = new PaymentHistoryDAO();
        List<PaymentHistoryCustomer> paymentHistories = paymentHistoryDAO.getAllPaymentHistories();
        for (PaymentHistoryCustomer paymentHistory : paymentHistories) {
            System.out.println(paymentHistory);
        }
    }
}
