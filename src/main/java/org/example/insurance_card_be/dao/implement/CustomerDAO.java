package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class CustomerDAO extends DBContext {
    public List<Users> findAll() {
        List<Users> list = new ArrayList<>();
        String sql = "Select * from [Users] where Role ='Customer'";
        try (Connection connection = getConnection();
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
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
        String sql = "delete from [Users] where UserID = ?";
        try (Connection connection = getConnection();
             PreparedStatement st = connection.prepareStatement(sql)) {
            st.setObject(1, users.getUserID());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Users> findByUsername(String keyword) {
        List<Users> listFind = new ArrayList<>();
        String sql = "Select * from [Users] where Role ='Customer' and Username like ?";
        try (Connection connection = getConnection();
             PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + keyword + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("UserID");
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String role = rs.getString("Role");
                String email = rs.getString("Email");
                String mobile = rs.getString("Mobile");
                String address = rs.getString("Address");
                String fullName = rs.getString("FullName");
                String gender = rs.getString("Gender");
                Users user = new Users(id, username, password, role, email, mobile, address, fullName, gender);
                listFind.add(user);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFind;
    }

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
}