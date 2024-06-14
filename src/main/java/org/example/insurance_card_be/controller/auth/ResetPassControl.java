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


@WebServlet("/reset")
public class ResetPassControl extends HttpServlet {
    private UserDAO dao = new UserDAO();

    //ham hien thi trang login
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/homepage/ResetPass.jsp").forward(request, response);
        request.getRequestDispatcher("/views/homepage/Forgot.jsp").forward(request, response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newpass = request.getParameter("newpass");
        String verifypass = request.getParameter("verifypass");
        String username = (String) session.getAttribute("usernameforgot");

        if(verifypass.equals(newpass)){
            // Login successful, redirect to another page
            System.out.println("Username: " + username);
            UserDAO dao = new UserDAO();
            dao.ResetPass(username, newpass);
            response.sendRedirect("login");
        } else {
            request.setAttribute("message", "Password not match!");
            // Debug print statement
            System.out.println("Mess attribute: " + request.getAttribute("message"));
            request.getRequestDispatcher("/views/homepage/ResetPass.jsp").forward(request, response);
        }
    }
}