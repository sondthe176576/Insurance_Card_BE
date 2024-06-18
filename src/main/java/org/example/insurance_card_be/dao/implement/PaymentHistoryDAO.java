package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.PaymentHistory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaymentHistoryDAO {
    private final DBContext dbContext;

    public PaymentHistoryDAO() {
        this.dbContext = new DBContext();
    }

    public List<PaymentHistory> getPayments(int page, int pageSize) {
        List<PaymentHistory> payments = new ArrayList<>();
        String query = "SELECT * FROM PaymentHistory ORDER BY PaymentID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        int offset = (page - 1) * pageSize;
        try (Connection connection = dbContext.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    PaymentHistory payment = new PaymentHistory();
                    payment.setPaymentID(resultSet.getInt("PaymentID"));
                    payment.setCustomerID(resultSet.getInt("CustomerID"));
                    payment.setAmount(resultSet.getBigDecimal("Amount"));
                    payment.setPaymentDate(resultSet.getDate("PaymentDate"));
                    payment.setPaymentMethodID(resultSet.getInt("PaymentMethodID"));
                    payment.setContractID(resultSet.getInt("ContractID"));
                    payments.add(payment);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle this exception appropriately
        }
        return payments;
    }
}
