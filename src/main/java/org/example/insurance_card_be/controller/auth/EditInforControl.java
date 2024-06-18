package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;
import org.example.insurance_card_be.model.Users;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/editinfor")
public class EditInforControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/customer/EditCustomerInfor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = ((Users) session.getAttribute("user")).getUsername();
        String full_name = request.getParameter("full_name");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String mobile = request.getParameter("mobile");
        String email_id = request.getParameter("email_id");
        String gender = request.getParameter("gender");
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));
        String tinh = request.getParameter("hidden_tinh");
        String quan = request.getParameter("hidden_quan");
        String phuong = request.getParameter("hidden_phuong");

        UserDAO dao = new UserDAO();
        dao.updateProfile(username, email_id, mobile, tinh, quan, phuong, first_name, last_name, full_name, birthdate, gender);

        response.sendRedirect("home");
    }
}
