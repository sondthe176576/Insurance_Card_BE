package org.example.insurance_card_be.controller.auth;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;
import org.example.insurance_card_be.model.Users;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/login")
public class LoginControl extends HttpServlet {
    private UserDAO dao = new UserDAO();
    private static final Logger LOGGER = Logger.getLogger(LoginControl.class.getName());


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LOGGER.info("Username: " + username);
        LOGGER.info("Password: " + password);

        Users user = dao.login(username, password);
        if (user == null) {
            request.setAttribute("mess", "Wrong username or password!");
            LOGGER.info("Login failed: " + request.getAttribute("mess"));
            request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(7200);
            session.setAttribute("user", user);
            LOGGER.info("Login successful, user: " + user);

            int customerID = dao.getCustomerIDByUserID(user.getUserID());
            // Kiểm tra role của user và chuyển hướng dựa trên role
            String role = user.getRole(); // Giả sử getRole() là phương thức để lấy role của user
            if ("Customer".equalsIgnoreCase(role)) {
                request.getRequestDispatcher("/views/dashboard/HomePageForCustomer.jsp").forward(request, response);
                session.setAttribute("customerID", customerID);
            } else if ("Staff".equalsIgnoreCase(role)) {
                request.getRequestDispatcher("/views/staff/manageStaff.jsp").forward(request, response);
            } else {
                request.setAttribute("mess", "Role not recognized!");
                LOGGER.info("Login failed: " + request.getAttribute("mess"));
                request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
            }
        }
    }
}

