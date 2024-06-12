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
        String username = request.getParameter("usernameforgot");
        String full_name = request.getParameter("name");
        Users check = dao.checkUserExist(username);

        if (check == null) {
            // Login successful, redirect to another page
            response.sendRedirect("forgot");
        } else {
            SendEmailControl sm = new SendEmailControl();
            String code = sm.getRandom();
            UserVerify user = new UserVerify(full_name, username, code);
            boolean test = sm.sendEmail(user);
            if (test) {

                request.setAttribute("message", "Registered successfully! Please check your email to verify your account!");
                // Debug print statement
                System.out.println("Mess attribute: " + request.getAttribute("message"));
                HttpSession session = request.getSession();
                session.setAttribute("code", user);
                request.getRequestDispatcher("/views/homepage/Verify Email.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Failed to send email!");
                // Debug print statement
                System.out.println("Mess attribute: " + request.getAttribute("message"));
                request.getRequestDispatcher("/views/homepage/Forgot.jsp").forward(request, response);
            }

        }
    }
}