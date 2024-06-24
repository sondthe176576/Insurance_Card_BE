package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/register")
public class RegisterControl extends HttpServlet {
    private UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String full_name = request.getParameter("name");
        String email = request.getParameter("email-address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        String tinhtp = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String fullname = request.getParameter("fullname");
        Date date = Date.valueOf(request.getParameter("birthdate"));
        String gender = request.getParameter("gender");

        Users a = dao.checkUserExist(username);
        Users p = dao.checkPhoneExist(phone);

        if (a != null) {
            request.setAttribute("message", "Username already exists!");
            System.out.println("Mess attribute: " + request.getAttribute("message"));
            request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
        } else if (p != null) {
            request.setAttribute("message", "Phone number already exists!");
            System.out.println("Mess attribute: " + request.getAttribute("message"));
            request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
        } else {
            SendEmailControl sm = new SendEmailControl();
            String code = sm.getRandom();
            UserVerify user = new UserVerify(full_name, username, code);
            boolean test = sm.sendEmail(user);

            System.out.println("Username: " + username);
            if (test) {
                request.setAttribute("message", "Registered successfully! Please check your email to verify your account!");
                System.out.println("Mess attribute: " + request.getAttribute("message"));

                HttpSession session = request.getSession();
                session.setAttribute("code", user);

                // Set additional attributes to be used in other pages
                session.setAttribute("full_name", full_name);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                session.setAttribute("tinh", tinhtp);
                session.setAttribute("huyen", quan);
                session.setAttribute("xa", phuong);
                session.setAttribute("firstname", firstname);
                session.setAttribute("lastname", lastname);
                session.setAttribute("full_name", fullname);
                session.setAttribute("birthdate", date);
                session.setAttribute("gender", gender);

                request.getRequestDispatcher("/views/homepage/Verify Email.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Failed to send email!");
                System.out.println("Mess attribute: " + request.getAttribute("message"));
                request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
            }
        }
    }
}
