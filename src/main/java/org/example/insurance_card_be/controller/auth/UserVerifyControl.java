package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.UserVerify;

import java.io.IOException;

@WebServlet("/verify")
public class UserVerifyControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("username");
        String phone = (String) session.getAttribute("phone");
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String tinh = (String) session.getAttribute("tinh");
        String quan = (String) session.getAttribute("huyen");
        String phuong = (String) session.getAttribute("xa");
        String firstname = (String) session.getAttribute("firstname");
        String lastname = (String) session.getAttribute("lastname");
        String full_name = (String) session.getAttribute("full_name");
        java.util.Date utilDate = (java.util.Date) session.getAttribute("birthdate");
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        String gender = (String) session.getAttribute("gender");
        UserVerify user = (UserVerify) session.getAttribute("code");

        String code = request.getParameter("code");

        if (code.equals(user.getCode())) {
            UserDAO dao = new UserDAO();
            System.out.println(user.getCode());
            System.out.println("Username: " + username);
            System.out.println("Email: " + email);
            System.out.println("Phone: " + phone);
                dao.register(username, password, email, phone, tinh, quan, phuong, firstname, lastname, full_name, sqlDate, gender);
                response.sendRedirect("login");
        } else {
            request.setAttribute("message", "Wrong code!");
            request.getRequestDispatcher("/views/homepage/Verify Email.jsp").forward(request, response);
        }
    }
}
