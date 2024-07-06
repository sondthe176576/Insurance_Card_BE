//package org.example.insurance_card_be.dao.implement;
//
//import org.example.insurance_card_be.dao.DBContext;
//import org.example.insurance_card_be.model.PaymentHistory;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import java.sql.*;
//import java.math.BigDecimal;
//import java.util.ArrayList;
//import java.util.List;
//
//public class PaymentHistoryDAO {
//
//    private static final Logger logger = LoggerFactory.getLogger(PaymentHistoryDAO.class);
//
//    public List<PaymentHistory> getAllPaymentHistories() {
//        List<PaymentHistory> list = new ArrayList<>();
//        String query = "SELECT * FROM PaymentHistory";
//
//        try (Connection connection = DBContext.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(query);
//             ResultSet resultSet = preparedStatement.executeQuery()) {
//
//            while (resultSet.next()) {
//                int paymentID = resultSet.getInt("paymentID");
//                int customerID = resultSet.getInt("customerID");
//                BigDecimal amount = resultSet.getBigDecimal("amount");
//                Date paymentDate = resultSet.getDate("paymentDate");
//                int paymentMethodID = resultSet.getInt("paymentMethodID");
//                int contractID = resultSet.getInt("contractID");
//
//                PaymentHistory paymentHistory = new PaymentHistory(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID);
//                list.add(paymentHistory);
//            }
//        } catch (SQLException e) {
//            logger.error("Error getting all payment histories", e);
//        }
//
//        return list;
//    }
//
//    public PaymentHistory getPaymentHistoryById(int paymentID) {
//        PaymentHistory paymentHistory = null;
//        String query = "SELECT * FROM PaymentHistory WHERE paymentID = ?";
//
//        try (Connection connection = DBContext.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
//
//            preparedStatement.setInt(1, paymentID);
//
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                if (resultSet.next()) {
//                    int customerID = resultSet.getInt("customerID");
//                    BigDecimal amount = resultSet.getBigDecimal("amount");
//                    Date paymentDate = resultSet.getDate("paymentDate");
//                    int paymentMethodID = resultSet.getInt("paymentMethodID");
//                    int contractID = resultSet.getInt("contractID");
//
//                    paymentHistory = new PaymentHistory(paymentID, customerID, amount, paymentDate, paymentMethodID, contractID);
//                }
//            }
//        } catch (SQLException e) {
//            logger.error("Error getting payment history by ID", e);
//        }
//
//        return paymentHistory;
//    }
//
//    public void addPaymentHistory(PaymentHistory paymentHistory) {
//        String query = "INSERT INTO PaymentHistory (customerID, amount, paymentDate, paymentMethodID, contractID) VALUES (?, ?, ?, ?, ?)";
//
//        try (Connection connection = DBContext.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
//
//            preparedStatement.setInt(1, paymentHistory.getCustomerID());
//            preparedStatement.setBigDecimal(2, paymentHistory.getAmount());
//            preparedStatement.setDate(3, new java.sql.Date(paymentHistory.getPaymentDate().getTime()));
//            preparedStatement.setInt(4, paymentHistory.getPaymentMethodID());
//            preparedStatement.setInt(5, paymentHistory.getContractID());
//
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            logger.error("Error adding payment history", e);
//        }
//    }
//
//    public void updatePaymentHistory(PaymentHistory paymentHistory) {
//        String query = "UPDATE PaymentHistory SET customerID = ?, amount = ?, paymentDate = ?, paymentMethodID = ?, contractID = ? WHERE paymentID = ?";
//
//        try (Connection connection = DBContext.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
//
//            preparedStatement.setInt(1, paymentHistory.getCustomerID());
//            preparedStatement.setBigDecimal(2, paymentHistory.getAmount());
//            preparedStatement.setDate(3, new java.sql.Date(paymentHistory.getPaymentDate().getTime()));
//            preparedStatement.setInt(4, paymentHistory.getPaymentMethodID());
//            preparedStatement.setInt(5, paymentHistory.getContractID());
//            preparedStatement.setInt(6, paymentHistory.getPaymentID());
//
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            logger.error("Error updating payment history", e);
//        }
//    }
//
//    public void deletePaymentHistory(int paymentID) {
//        String query = "DELETE FROM PaymentHistory WHERE paymentID = ?";
//
//        try (Connection connection = DBContext.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
//
//            preparedStatement.setInt(1, paymentID);
//
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            logger.error("Error deleting payment history", e);
//        }
//    }
//}
