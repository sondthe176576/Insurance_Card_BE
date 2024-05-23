package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MotorbikeDAO {
    private Connection connection; // Ket noi toi database

    public MotorbikeDAO() { // Khoi tao ket noi toi database
        this.connection = new DBContext().getConnection();
    }

    // Lay thong tin xe may dua vao CustomerID
    public String getMotorbikeInfo(int customerID) {
        String motorbikeInfo = null;
        // Query lay thong tin xe may dua vao CustomerID
        String sql = "SELECT m.MotorbikeInfo FROM Motorbikes m JOIN Customers c ON m.CustomerID = c.CustomerID WHERE c.CustomerID = ?";
        // Lay thong tin xe may
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, customerID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    motorbikeInfo = rs.getString("MotorbikeInfo");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return motorbikeInfo;
    }

}
