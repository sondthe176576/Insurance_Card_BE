package org.example.insurance_card_be.dao;

import org.example.insurance_card_be.model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    public Users login(String user, String pass) {
        String query = "select * from account where username = ? and pass = ?";
        try {
            conn = new DBContext().getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, user); // Thiết lập tham số cho cột user
            ps.setString(2, pass); // Thiết lập tham số cho cột pass
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ (nếu cần)
        } finally {
            // Đóng các tài nguyên (Connection, PreparedStatement, ResultSet) ở đây (nếu cần)
        }
        return null;
    }



}
