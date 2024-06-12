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
        HttpSession session = request.getSession();
        String full_name = (String) session.getAttribute("full_name");
        String address = (String) session.getAttribute("address");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String gender = (String) session.getAttribute("gender");
        UserVerify user = (UserVerify) session.getAttribute("code");

        String code = request.getParameter("code");
        if (code.equals(user.getCode())) {
            UserDAO dao = new UserDAO();
            System.out.println("Username: " + username);
            System.out.println("Email: " + email);
            dao.register(username, password, email, phone, address, full_name, gender);
            response.sendRedirect("login");
        } else {
            request.setAttribute("message", "Wrong code!");
            request.getRequestDispatcher("/views/homepage/Verify Email.jsp").forward(request, response);
        }

    }

}
