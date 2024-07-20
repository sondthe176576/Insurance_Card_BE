package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;
import org.example.insurance_card_be.model.Motorcycles;
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
                return new Users(rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Role"),  // Lấy thông tin về vai trò
                        rs.getString("Email"),
                        rs.getString("Mobile"),
                        rs.getString("Province"),
                        rs.getString("District"),
                        rs.getString("Country"),
                        rs.getString("First_name"),
                        rs.getString("Last_name"),
                        rs.getString("Full_name"),
                        rs.getDate("Birth_date"),
                        rs.getString("Gender"));
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

    public void register(String username, String password, String email, String mobile, String province, String district, String country, String firstname, String lastname, String fullname, Date date, String gender) {
        String INSERT_USER_SQL =
                "INSERT INTO Users (Username, Password, Role, Email, Mobile, Province, District, Country, First_name, Last_name, Full_name, Birth_date, Gender) VALUES (?, ?, 'Customer', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String INSERT_USER_ROLE_SQL =
                "INSERT INTO UserRoles (UserID, RoleID) VALUES (?, ?)";

        String INSERT_CUSTOMER_SQL =
                "INSERT INTO Customers (UserID, PersonalInfo) VALUES (?, ?)";

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

            // Đóng PreparedStatement hiện tại
            ps.close();

            // Chèn dữ liệu vào bảng Customers với UserID
            ps = conn.prepareStatement(INSERT_CUSTOMER_SQL);
            ps.setInt(1, userID);
            ps.setString(2, ""); // PersonalInfo có thể được để trống hoặc cập nhật sau
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

    public void updateCustomerInfo(int userID, String personalInfo) {
        String UPDATE_CUSTOMER_SQL =
                "UPDATE Customers SET PersonalInfo = ? WHERE UserID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(UPDATE_CUSTOMER_SQL);
            ps.setString(1, personalInfo);
            ps.setInt(2, userID);
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

    public void addMotorcycle(int userID, String licensePlate, String brand, String model, String frameNumber, String engineNumber, int yearOfManufacture, String color) {
        String INSERT_MOTORCYCLE_SQL =
                "INSERT INTO Motorcycles (CustomerID, LicensePlate, Brand, Model, FrameNumber, EngineNumber, YearOfManufacture, Color) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            // Get CustomerID from UserID
            int customerID = getCustomerIDByUserID(userID);

            ps = conn.prepareStatement(INSERT_MOTORCYCLE_SQL);
            ps.setInt(1, customerID);
            ps.setString(2, licensePlate);
            ps.setString(3, brand);
            ps.setString(4, model);
            ps.setString(5, frameNumber);
            ps.setString(6, engineNumber);
            ps.setInt(7, yearOfManufacture);
            ps.setString(8, color);
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

    public Users ResetPass(String username, String password) {
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

    public Users getUserByID(int id) {
        String query = "SELECT * FROM Users WHERE UserID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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

    // Thêm phương thức để lấy đối tượng Customers từ userId
    public Customers getCustomerByUserId(int userId) {
        String query = "SELECT * FROM Customers WHERE UserID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Users user = getUserByID(rs.getInt(2)); // Tạo đối tượng Users từ userId
                return new Customers(rs.getInt(1),
                        user,
                        rs.getString(3));
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

    public Motorcycle getMotorcycleByCustomerId(int customerId) {
        String query = "SELECT * FROM Motorcycles WHERE CustomerID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, customerId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Customers customer = getCustomerById(customerId); // Tạo đối tượng Customers từ customerId
                return new Motorcycle(rs.getInt(1),
                        customer,
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9));
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

    // Thêm phương thức để lấy đối tượng Users từ userId
    public Users getUserById(int userId) {
        String query = "SELECT * FROM Users WHERE UserID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
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

    // Thêm phương thức để lấy đối tượng Customers từ customerId
    public Customers getCustomerById(int customerId) {
        String query = "SELECT * FROM Customers WHERE CustomerID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, customerId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Users user = getUserById(rs.getInt(2)); // Tạo đối tượng Users từ userId
                return new Customers(rs.getInt(1),
                        user,
                        rs.getString(3));
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

    public Motorcycles getMotorcycleByCustomerID(int customerID) {
        String query = "SELECT * FROM Motorcycles WHERE CustomerID = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, customerID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Motorcycles(
                            rs.getInt("motorcycleID"),
                            rs.getInt("customerID"),
                            rs.getString("licensePlate"),
                            rs.getString("brand"),
                            rs.getString("model"),
                            rs.getString("frameNumber"),
                            rs.getString("engineNumber"),
                            rs.getInt("yearOfManufacture"),
                            rs.getString("color")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy Motorcycles
    }

    public String getNameofPersonalInfor(int userID) {
        String query = "SELECT PersonalInfo FROM Customers WHERE UserID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
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

    public void updateMotorcycles(int userID, String licensePlate, String brand, String model, String frameNumber, String engineNumber, int yearOfManufacture, String color){
        String query = "UPDATE Motorcycles SET LicensePlate = ?, Brand = ?, Model = ?, FrameNumber = ?, EngineNumber = ?, YearOfManufacture = ?, Color = ? WHERE CustomerID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, licensePlate);
            ps.setString(2, brand);
            ps.setString(3, model);
            ps.setString(4, frameNumber);
            ps.setString(5, engineNumber);
            ps.setInt(6, yearOfManufacture);
            ps.setString(7, color);
            ps.setInt(8, userID);
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

    public int getMotorcycleIDbyCustomerID(int id){
        String query = "SELECT MotorcycleID FROM Motorcycles WHERE CustomerID = ?";
        try {
            conn = DBContext.getConnection(); // Mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
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
        return -1;
    }

    public int getCustomerIDByUserID(int userID) {
        String query = "SELECT CustomerID FROM Customers WHERE UserID = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("CustomerID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu không tìm thấy CustomerID
    }
}

