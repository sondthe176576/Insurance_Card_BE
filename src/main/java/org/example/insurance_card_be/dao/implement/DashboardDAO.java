package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.AccidentHistory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO extends DBContext {

    //tao Dao cua Dashboard


    public List<AccidentHistory> getAccidentHistory() {
        List<AccidentHistory> list = new ArrayList<>();
        try {
            String sql = "SELECT c.*, a.*, u.FullName FROM Customers c " +
                    "JOIN Users u ON u.UserID = c.UserID " +
                    "JOIN AccidentHistory a ON a.CustomerID = c.CustomerID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                AccidentHistory AccidentHistory = new AccidentHistory(
                        rs.getInt("CustomerID"),
                        rs.getInt("UserID"),
                        rs.getString("PersonalInfo"),
                        rs.getString("FullName"),
                        rs.getInt("AccidentId"),
                        rs.getString("Description"),
                        rs.getDate("Date")
                );
                list.add(AccidentHistory);
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
        List<AccidentHistory> accidentList = dashboardDAO.getAccidentHistory();

        // In thông tin về mỗi sự cố
        for (AccidentHistory AccidentHistory : accidentList) {
            System.out.println("Customer ID: " + AccidentHistory.getCustomerId());
            System.out.println("User ID: " + AccidentHistory.getUserId());
            System.out.println("Personal Info: " + AccidentHistory.getPersonalInfo());
            System.out.println("Full Name: " + AccidentHistory.getFullName());
            System.out.println("Accident ID: " + AccidentHistory.getAccidentId());
            System.out.println("Description: " + AccidentHistory.getDescription());
            System.out.println("Date: " + AccidentHistory.getDate());
            System.out.println("----------------------");
        }
    }
}
