package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Accident;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO extends DBContext {

    // Tạo DAO của Dashboard
    public List<Accident> getAccidentHistory() {
        List<Accident> list = new ArrayList<>();
        try {
            String sql = "SELECT a.AccidentID, a.ContractID, a.AccidentType, a.AccidentDate, " +
                    "a.Description AS AccidentDescription, a.Status, " +
                    "h.CustomerID, u.FullName " +
                    "FROM Accidents a " +
                    "INNER JOIN AccidentHistory h ON a.AccidentID = h.AccidentID " +
                    "INNER JOIN Users u ON h.CustomerID = u.UserID";

            // Access the connection from the superclass DBContext
            Connection connection = super.connection;

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Accident accident = new Accident(
                        rs.getInt("AccidentID"),
                        rs.getInt("ContractID"),
                        rs.getInt("CustomerID"),
                        rs.getString("AccidentType"),
                        rs.getString("AccidentDate"),
                        rs.getString("AccidentDescription"),
                        rs.getString("FullName"),
                        rs.getString("Status")
                );
                list.add(accident);
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra stack trace nếu có lỗi
        }
        return list;
    }

    // Phương thức main dùng để kiểm tra, hãy đặt ở một lớp khác
    public static void main(String[] args) {
        DashboardDAO dashboardDAO = new DashboardDAO();

        // Lấy danh sách sự cố giao thông
        List<Accident> accidentList = dashboardDAO.getAccidentHistory();

        // In thông tin về mỗi sự cố
        for (Accident accident : accidentList) {
            System.out.println("Accident ID: " + accident.getAccidentID());
            System.out.println("Contract ID: " + accident.getContractID());
            System.out.println("Customer ID: " + accident.getCustomerID());
            System.out.println("Accident Type: " + accident.getAccidentType());
            System.out.println("Accident Date: " + accident.getAccidentDate());
            System.out.println("Description: " + accident.getDescription());
            System.out.println("Customer Name: " + accident.getCustomerName());
            System.out.println("Status: " + accident.getStatus());
            System.out.println("----------------------");
        }
    }
}
