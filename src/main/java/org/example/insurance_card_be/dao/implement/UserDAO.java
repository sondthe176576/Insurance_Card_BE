package org.example.insurance_card_be.dao.implement;
import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Users;

import java.sql.*;


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
        String INSERT_USER_SQL =
                "INSERT INTO Users (Username, Password, Role, Email, Mobile, Province, District, Country, First_name, Last_name, Full_name, Birth_date, Gender) VALUES (?, ?, 'Customer', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String INSERT_USER_ROLE_SQL =
                "INSERT INTO UserRoles (UserID, RoleID) VALUES (?, ?)";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            conn.setAutoCommit(false); // Bắt đầu giao dịch

            // Chèn dữ liệu vào bảng Users
            ps = conn.prepareStatement(INSERT_USER_SQL, PreparedStatement.RETURN_GENERATED_KEYS);
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

            // Lấy UserID vừa được chèn
            ResultSet generatedKeys = ps.getGeneratedKeys();
            int userID = -1;
            if (generatedKeys.next()) {
                userID = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating user failed, no ID obtained.");
            }

            // Đóng PreparedStatement hiện tại
            ps.close();

            // Chèn dữ liệu vào bảng UserRoles với UserID và RoleID = 2 (Customer)
            ps = conn.prepareStatement(INSERT_USER_ROLE_SQL);
            ps.setInt(1, userID);
            ps.setInt(2, 2); // RoleID cho Customer là 2
            ps.executeUpdate();

            // Cam kết giao dịch
            conn.commit();

        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback nếu có lỗi xảy ra
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
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

    public Users getUserByName(String Username) {
        String query = "SELECT * FROM Users WHERE Username = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, Username);
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

    public Users updateProfile(String username, String email, String mobile, String province, String district, String country, String firstname, String lastname, String fullname, Date birthdate, String gender){
        String query = "UPDATE Users SET Email = ?, Mobile = ?, Province = ?, District = ?, Country = ?, First_name = ?, Last_name = ?, Full_name = ?, Birth_date = ?, Gender = ? WHERE Username = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, mobile);
            ps.setString(3, province);
            ps.setString(4, district);
            ps.setString(5, country);
            ps.setString(6, firstname);
            ps.setString(7, lastname);
            ps.setString(8, fullname);
            ps.setDate(9, birthdate);
            ps.setString(10, gender);
            ps.setString(11, username);
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







