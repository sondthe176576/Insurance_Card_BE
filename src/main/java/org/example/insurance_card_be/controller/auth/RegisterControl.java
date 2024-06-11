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


@WebServlet("/register")
public class RegisterControl extends HttpServlet {
    private UserDAO dao = new UserDAO();

    //ham hien thi trang login
    @Override
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

        Users a = dao.checkUserExist(username);
        Users p = dao.checkPhoneExist(phone);

        if(a != null){
            request.setAttribute("message", "Username already exists!");
            // Debug print statement
            System.out.println("Mess attribute: " + request.getAttribute("message"));
            request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
        }

        //Users p = dao.checkPhoneExist(phone);


        else if(p != null) {
            request.setAttribute("message", "Phone number already exists!");
            // Debug print statement
            System.out.println("Mess attribute: " + request.getAttribute("message"));
            request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
        }


//        else if(p == null) {
//            request.setAttribute("message", "Phone number already exists!");
//            // Debug print statement
//            System.out.println("Mess attribute: " + request.getAttribute("message"));
//            request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
//        }



        else {
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
                request.getRequestDispatcher("/views/homepage/Register.jsp").forward(request, response);
            }
        }

    }
}