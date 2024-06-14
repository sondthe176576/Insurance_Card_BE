package org.example.insurance_card_be.dao.implement;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Users;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Users login(String username, String password) {
        String query = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getDate(13),
                        rs.getString(14)
                        );
            }
            // Test commit
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void register(String username, String password, String email, String mobile, String province, String district, String country, String firstname, String lastname, String fullname, Date date, String gender) {
        String query = "INSERT INTO Users VALUES(?, ?, 'Customer', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, province);
            ps.setString(6, district);
            ps.setString(7, country);
            ps.setString(8, firstname);
            ps.setString(9, lastname);
            ps.setString(10, fullname);
            ps.setDate(11, date);
            ps.setString(12, gender);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }




    public Users checkUserExist(String user) {
        String query = "select * from Users where Username = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, user); // Thiết lập tham số cho cột user
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getDate(13),
                        rs.getString(14)
                );
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }


    public Users checkPhoneExist(String Mobile) {
        String query = "select * from Users where Mobile = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, Mobile); // Thiết lập tham số cho cột user
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getDate(13),
                        rs.getString(14)
                );
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public Users ResetPass(String username, String password){
        String query = "UPDATE Users SET Password = ? WHERE Username = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi để debug
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

}

//    public Users checkPhoneExist(String Mobile) {
//        String query = "select * from Users where Mobile = ?";
//        try {
//            conn = DBContext.getConnection(); // Mở kết nối với SQL
//            ps = conn.prepareStatement(query);
//            ps.setString(1, Mobile); // Thiết lập tham số cho cột user
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                return new Users(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9));
//            }
//        } catch (Exception e) {
//            e.printStackTrace(); // In ra lỗi để debug
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (ps != null) ps.close();
//                if (conn != null) conn.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return null;
//    }


    //vvvvvvv







