package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO extends DBContext {
    private static final int CUSTOMERS_PER_PAGE = 5;
    public List<Users> findAll() {
        List<Users> list = new ArrayList<>();
        String sql = "Select * from [Users] where Role = 'Customer'";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
               user.setUserId(rs.getInt("UserID"));
               user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                // set other fields as necessary
                list.add(user);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
        // viet ham main lay tat ca customer

    }
    public static void main(String[] args) {
            CustomerDAO dao = new CustomerDAO();
            List<Users> list = dao.findAll();
            for (Users user : list) {
                System.out.println(user);
            }

    }

    public void deleteByID(Users users) {
        Connection connection = getConnection();
        String sql = "delete from [Users] where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setObject(1, users.getUserId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


    public List<Users> findAll(int page) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role ='Customer' ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(2, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserId(rs.getInt("UserID"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                // set other fields as necessary
                list.add(user);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalCustomers() {
        String sql = "SELECT COUNT(*) FROM [Users] WHERE Role ='Customer'";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }



    public void insert(Users customer) {
        String sql = "INSERT INTO [dbo].[Users] " +
                "([Username], [Password], [Role], [Email], [Mobile], [Province], [District], [Country], " +
                "[First_name], [Last_name], [Full_name], [Birth_date], [Gender]) " +
                "VALUES (?, ?, 'Customer', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, customer.getUserName());
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getEmail());
            statement.setString(4, customer.getMobile());
            statement.setString(5, customer.getProvince());
            statement.setString(6, customer.getDistrict());
            statement.setString(7, customer.getCountry());  // Ensure this parameter is set
            statement.setString(8, customer.getFirstName());
            statement.setString(9, customer.getLastName());
            statement.setString(10, customer.getFullName());
            statement.setDate(11, new java.sql.Date(customer.getBirthDate().getTime()));
            statement.setString(12, customer.getGender());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Insert successful!");
                ResultSet resultSet = statement.getGeneratedKeys();
                if (resultSet.next()) {
                    int generatedId = resultSet.getInt(1);
                    System.out.println("Inserted user ID: " + generatedId);
                }
            } else {
                System.out.println("Insert failed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void update(Users customer) {
        String sql = "UPDATE [dbo].[Users] SET " +
                "[Username] = ?, " +
                "[Password] = ?, " +
                "[Role] = ?, " +
                "[Email] = ?, " +
                "[Mobile] = ?, " +
                "[Province] = ?, " +
                "[District] = ?, " +
                "[Country] = ?, " +
                "[First_name] = ?, " +
                "[Last_name] = ?, " +
                "[Full_name] = ?, " +
                "[Birth_date] = ?, " +
                "[Gender] = ? WHERE [UserID] = ?";
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, customer.getUserName());
            statement.setString(2, customer.getPassword());
            statement.setString(3, "Customer");  // Ensure the role is set
            statement.setString(4, customer.getEmail());
            statement.setString(5, customer.getMobile());
            statement.setString(6, customer.getProvince());
            statement.setString(7, customer.getDistrict());
            statement.setString(8, customer.getCountry());
            statement.setString(9, customer.getFirstName());
            statement.setString(10, customer.getLastName());
            statement.setString(11, customer.getFullName());
            statement.setDate(12, new java.sql.Date(customer.getBirthDate().getTime()));
            statement.setString(13, customer.getGender());
            statement.setInt(14, customer.getUserId());

            // Debugging statement
            System.out.println("Executing SQL: " + statement.toString());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Users findById(int userID) {
        String sql = "SELECT * FROM [Users] WHERE UserID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        rs.getString("Mobile"),
                        rs.getString("Province"),
                        rs.getString("District"),
                        rs.getString("Country"),
                        rs.getString("First_name"),
                        rs.getString("Last_name"),
                        rs.getString("Full_name"),
                        rs.getDate("Birth_date"),
                        rs.getString("Gender")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý lỗi nếu cần thiết
        }
        return null; // Trả về null nếu không tìm thấy người dùng
    }

    public List<Users> findByUsernameAndGender(String keyword, String gender, int page) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND [Full_name] LIKE ? AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setString(2, gender);
            st.setString(3, gender);
            st.setInt(4, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(5, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserId(rs.getInt("UserID"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                // set other fields as necessary
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Users> findByEmailAndGender(String keyword, String gender, int page) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND [Email] LIKE ? AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setString(2, gender);
            st.setString(3, gender);
            st.setInt(4, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(5, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserId(rs.getInt("UserID"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                // set other fields as necessary
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Users> findByPhoneAndGender(String keyword, String gender, int page) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND [Mobile] LIKE ? AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setString(2, gender);
            st.setString(3, gender);
            st.setInt(4, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(5, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserId(rs.getInt("UserID"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                // set other fields as necessary
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Users> findAllWithGender(int page, String gender) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, gender);
            st.setString(2, gender);
            st.setInt(3, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(4, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserId(rs.getInt("UserID"));
                user.setUserName(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                // set other fields as necessary
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalCustomers(String searchType, String keyword, String gender) {
        String sql = "SELECT COUNT(*) FROM [Users] WHERE Role = 'Customer' AND (? = '' OR [Gender] = ?) ";
        if (searchType.equals("name")) {
            sql += "AND [Full_name] LIKE ?";
        } else if (searchType.equals("email")) {
            sql += "AND [Email] LIKE ?";
        } else if (searchType.equals("phone")) {
            sql += "AND [Mobile] LIKE ?";
        }

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, gender);
            st.setString(2, gender);
            if (!searchType.isEmpty()) {
                st.setString(3, "%" + keyword + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<Users> findAllWithAddress(int page, String province, String district, String ward) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE Role = 'Customer' AND (? = '0' OR Province = ?) AND (? = '0' OR District = ?) AND (? = '0' OR Country = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, province);
            st.setString(2, province);
            st.setString(3, district);
            st.setString(4, district);
            st.setString(5, ward);
            st.setString(6, ward);
            st.setInt(7, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(8, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                // Đọc dữ liệu từ rs và thêm vào danh sách
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }








}


