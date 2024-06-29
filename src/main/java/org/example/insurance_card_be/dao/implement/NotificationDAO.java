package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Notifications;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {
    private Connection connection;

    public NotificationDAO() {
        this.connection = DBContext.getConnection();
    }

    public void addNotification(Notifications notification) throws SQLException {
        String sql = "INSERT INTO Notifications (UserID, Message, CreatedDate, IsRead) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, notification.getUserID());
            ps.setString(2, notification.getMessage());
            ps.setTimestamp(3, new Timestamp(notification.getCreatedDate().getTime()));
            ps.setBoolean(4, notification.isRead());
            ps.executeUpdate();
        }
    }

    public List<Integer> getAllStaffUserIDs() throws SQLException {
        List<Integer> staffUserIDs = new ArrayList<>();
        String sql = "SELECT UserID FROM Staff";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                staffUserIDs.add(rs.getInt("UserID"));
            }
        }
        return staffUserIDs;
    }

    public List<Notifications> getAllUnreadNotifications() throws SQLException {
        List<Notifications> notifications = new ArrayList<>();
        String sql = "SELECT * FROM Notifications WHERE IsRead = 0";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Notifications notification = new Notifications();
                notification.setNotificationID(rs.getInt("NotificationID"));
                notification.setUserID(rs.getInt("UserID"));
                notification.setMessage(rs.getString("Message"));
                notification.setCreatedDate(rs.getTimestamp("CreatedDate"));
                notification.setRead(rs.getBoolean("IsRead"));
                notifications.add(notification);
            }
        }
        return notifications;
    }

    public void markAsRead(int notificationID) throws SQLException {
        String sql = "UPDATE Notifications SET IsRead = 1 WHERE NotificationID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, notificationID);
            ps.executeUpdate();
        }
    }
}