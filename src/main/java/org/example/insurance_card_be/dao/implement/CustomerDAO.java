package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Users;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO extends DBContext {
    public List<Users> findAll() {
        List<Users> list = new ArrayList<>();
        String sql = "Select * from [Users] where Role ='Customer'";
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

    public static void main(String[] args) {
        CustomerDAO cus = new CustomerDAO();
        try {
            List<Users> list =cus.findAll();
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
}
