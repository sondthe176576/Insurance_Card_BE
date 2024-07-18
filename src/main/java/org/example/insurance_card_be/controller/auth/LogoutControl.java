package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false); // Lấy session hiện tại nếu có
        if (session != null) {
            session.invalidate(); // Ngắt session
        }
        response.sendRedirect("login"); // Chuyển hướng về trang đăng nhập

        response.sendRedirect(request.getContextPath() + "/"); // chuyển hướng về trang đăng nhập
    }
}
