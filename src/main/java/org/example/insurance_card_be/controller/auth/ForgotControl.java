package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import org.example.insurance_card_be.dao.implement.UserDAO;
import org.example.insurance_card_be.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/forgot")
public class ForgotControl extends HttpServlet {
    private UserDAO dao = new UserDAO();

    //ham hien thi trang login
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/homepage/Forgot.jsp").forward(request, response);
    }



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Users user = dao.login(username, password);

        if (user != null) {
            // Login successful, redirect to another page
            response.sendRedirect("successPage.jsp");
        } else {
            // Login failed, redirect back to login page
            response.sendRedirect("home.jsp");
        }
    }
}