package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;
import org.example.insurance_card_be.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginControl extends HttpServlet {
    private UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username: " + username); // Debug print statement
        System.out.println("Password: " + password); // Debug print statement

        Users user = dao.login(username, password);

        if (user == null) {
            // Login failed, forward back to login page
            request.setAttribute("mess", "Wrong username or password!");
            // Debug print statement
            System.out.println("Mess attribute: " + request.getAttribute("mess"));
            System.out.println("Login failed");
            request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
        } else {
            // Login successful, redirect to another page
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(7200);
            session.setAttribute("user", user); // Set user in session
            System.out.println("Login successful");
            response.sendRedirect("home.jsp");
        }
    }
}
