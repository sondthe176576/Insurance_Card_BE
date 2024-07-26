package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.UserVerify;

import java.io.IOException;

@WebServlet("/verifyforgot")
public class VerifyForgotControl extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/homepage/Forgot.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserVerify user = (UserVerify) session.getAttribute("code");

        String code = request.getParameter("code");
        if (code.equals(user.getCode())) {

            response.sendRedirect("reset");
        } else {
            request.setAttribute("message", "Wrong code!");
            request.getRequestDispatcher("/views/homepage/Verify Forgot Email.jsp").forward(request, response);
        }

    }

}
