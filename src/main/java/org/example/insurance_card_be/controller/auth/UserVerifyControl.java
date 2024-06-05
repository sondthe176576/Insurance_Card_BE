package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/verify")
public class UserVerifyControl extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String full_name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email-address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");

        HttpSession session = request.getSession();
        UserVerify user = (UserVerify) session.getAttribute("code");

        String code = request.getParameter("code");
        if (code.equals(user.getCode())) {
            UserDAO dao = new UserDAO();
            dao.register(username, password, email, phone, address, full_name, gender);
            response.sendRedirect("login");
        } else {
            request.setAttribute("message", "Wrong code!");
            request.getRequestDispatcher("/views/homepage/Verify.jsp").forward(request, response);
        }

    }

}
