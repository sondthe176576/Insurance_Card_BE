package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.NotificationDAO;
import org.example.insurance_card_be.model.Notifications;

import java.sql.SQLException;
import java.util.List;

public class NotificationService {
    private NotificationDAO notificationDAO = new NotificationDAO();

    public void addNotification(Notifications notification) throws SQLException {
        notificationDAO.addNotification(notification);
    }

    public List<Integer> getAllStaffUserIDs() throws SQLException {
        return notificationDAO.getAllStaffUserIDs();
    }

    public List<Notifications> getAllUnreadNotifications() throws SQLException {
        return notificationDAO.getAllUnreadNotifications();
    }

    public void markAsRead(int notificationID) throws SQLException {
        notificationDAO.markAsRead(notificationID);
    }
}