package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;

@WebServlet(name = "VerifyServlet", urlPatterns = "/verify-new")
public class VerifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String sessionCode = (String) session.getAttribute("verificationCode");
        String inputCode = req.getParameter("verificationCode");

        if (sessionCode != null && sessionCode.equals(inputCode)) {
            Users users = (Users) session.getAttribute("users");
            CustomerDAO dao = new CustomerDAO();
            dao.insert(users);
            session.setAttribute("message", "Customer created successfully!");
            resp.sendRedirect(req.getContextPath() + "/customer-manage");
        } else {
            req.setAttribute("message", "Wrong code!");
            req.getRequestDispatcher("/verify.jsp").forward(req, resp);
        }
    }
}
