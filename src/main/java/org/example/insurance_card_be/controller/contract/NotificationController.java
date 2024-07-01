package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.implement.NotificationDAO;
import org.example.insurance_card_be.model.Notifications;
import org.example.insurance_card_be.service.NotificationService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "NotificationController", urlPatterns = "/notifications")
public class NotificationController extends HttpServlet {
    private NotificationService notificationService;

    @Override
    public void init() throws ServletException {
        this.notificationService = new NotificationService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            List<Notifications> notifications = notificationService.getAllUnreadNotifications();
            try (PrintWriter out = resp.getWriter()) {
                out.print("[");
                for (int i = 0; i < notifications.size(); i++) {
                    Notifications notification = notifications.get(i);
                    out.print("{");
                    out.print("\"notificationID\":" + notification.getNotificationID() + ",");
                    out.print("\"message\":\"" + notification.getMessage() + "\"");
                    out.print("}");
                    if (i < notifications.size() - 1) {
                        out.print(",");
                    }
                }
                out.print("]");
            }
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }
    }
}