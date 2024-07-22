package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.PaymentHistory;
import org.example.insurance_card_be.model.PaymentMethod;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PaymentDAO {
    private Connection connection;

    public PaymentDAO() {
        this.connection = DBContext.getConnection();
    }

    public int savePaymentMethod(PaymentMethod paymentMethod) throws SQLException {
        String sql = "INSERT INTO PaymentMethods(CustomerID, MethodType, Details) VALUES(?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, paymentMethod.getCustomerID());
            ps.setString(2, paymentMethod.getMethodType());
            ps.setString(3, paymentMethod.getDetails());
            ps.executeUpdate();

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Error while saving payment method", e);
        }
        return 0;
    }

    public void savePaymentHistory(PaymentHistory paymentHistory) throws SQLException {
        String sql = "INSERT INTO PaymentHistory(CustomerID, Amount, PaymentMethodID, ContractID) VALUES(?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, paymentHistory.getCustomerID());
            ps.setBigDecimal(2, paymentHistory.getAmount());
            ps.setInt(3, paymentHistory.getPaymentMethodID());
            ps.setInt(4, paymentHistory.getContractID());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error while saving payment history", e);
        }
    }
}