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
                Users user = new Users(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("Role"), rs.getString("Email"), rs.getString("Mobile"), rs.getString("Address"),
                        rs.getString("FullName"), rs.getString("Gender"));
                list.add(user);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void deleteByID(Users users) {
        Connection connection = getConnection();
        String sql = "delete from [Users] where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setObject(1, users.getUserID());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    // insert customer
    public void insert(Users customer) {
        String sql = "INSERT INTO [Users] (Username, Password, Role, Email, Mobile, Address, FullName, Gender) VALUES (?, ?, 'customer', ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, customer.getUsername());
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getEmail());
            statement.setString(4, customer.getMobile());
            statement.setString(5, customer.getAddress());
            statement.setString(6, customer.getFullName());
            statement.setString(7, customer.getGender());

            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CustomerDAO cus = new CustomerDAO();
        try {
            List<Users> list = cus.findAll();
            if (list.isEmpty()) {
                System.out.println("Danh sách người dùng trống.");
            } else {
                for (Users u : list) {
                    System.out.println(u.getUsername());
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }

    }


    public List<Users> findByUsername(String keyword) {
        List<Users> list = new ArrayList<>();
        String sql = "Select * from [Users] where Role ='Customer' and FullName like ?";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("Role"), rs.getString("Email"), rs.getString("Mobile"), rs.getString("Address"),
                        rs.getString("FullName"), rs.getString("Gender"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void update(Users customer) {
        String sql = "UPDATE [Users] SET Username = ?, Password = ?, Email = ?, Mobile = ?, Address = ?, FullName = ?, Gender = ? WHERE UserID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, customer.getUsername());
            statement.setString(2, customer.getPassword());
            statement.setString(3, customer.getEmail());
            statement.setString(4, customer.getMobile());
            statement.setString(5, customer.getAddress());
            statement.setString(6, customer.getFullName());
            statement.setString(7, customer.getGender());
            statement.setInt(8, customer.getUserID());
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
                        rs.getString("Address"),
                        rs.getString("FullName"),
                        rs.getString("Gender")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
                Users user = new Users(rs.getInt("UserID"), rs.getString("Username"), rs.getString("Password"),
                        rs.getString("Role"), rs.getString("Email"), rs.getString("Mobile"), rs.getString("Address"),
                        rs.getString("FullName"), rs.getString("Gender"));
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

}

