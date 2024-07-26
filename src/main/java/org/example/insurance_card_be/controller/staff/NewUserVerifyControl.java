package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;

@WebServlet("/new-verify")
public class NewUserVerifyControl extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("verificationCode");
        String inputCode = request.getParameter("verificationCode");

        if (sessionCode != null && sessionCode.equals(inputCode)) {
            // Mã đúng, tiến hành đăng ký thông tin khách hàng
            Users user = (Users) session.getAttribute("users"); // Lấy với key là "users"

            if (user != null) {
                // Lưu thông tin người dùng vào cơ sở dữ liệu
                CustomerDAO dao = new CustomerDAO();
                dao.insert(user);

                // Thiết lập thông báo thành công trong session
                String fullName = user.getFullName();
                session.setAttribute("message", "User " + fullName + " added successfully!");

                // Chuyển hướng đến trang quản lý khách hàng
                response.sendRedirect(request.getContextPath() + "/customer-manage");
            } else {
                // Xử lý khi không tìm thấy thông tin người dùng trong session
                request.setAttribute("message", "User information is missing. Please try again.");
                request.getRequestDispatcher("/views/staff/verify.jsp").forward(request, response);
            }
        } else {
            // Mã sai, hiển thị thông báo lỗi
            request.setAttribute("message", "Invalid or missing verification code.");
            request.getRequestDispatcher("/views/staff/verify.jsp").forward(request, response);
        }
    }
}
