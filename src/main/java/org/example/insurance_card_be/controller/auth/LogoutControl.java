package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutControl extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // không tạo session mới nếu chưa tồn tại
        if (session != null) {
            try {
                session.invalidate(); // ngắt session hiện tại của user
            } catch (IllegalStateException ex) {
                // Xử lý nếu có lỗi khi invalidate session
                System.err.println("Error invalidating session: " + ex.getMessage());
            }
        }
        response.sendRedirect(request.getContextPath() + "/login"); // chuyển hướng về trang đăng nhập
    }
}
