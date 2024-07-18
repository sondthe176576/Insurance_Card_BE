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
        int customerid = dao.getCustomerIDByUserID(user.getUserID());
        if (user == null) {
            request.setAttribute("mess", "Wrong username or password!");
            LOGGER.info("Login failed: " + request.getAttribute("mess"));
            request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(7200);
            session.setAttribute("user", user);

            LOGGER.info("Login successful, user: " + user);
            System.out.println("CustomerID: "+ customerid);

            LOGGER.info("Login successful, user: " + user);

            // Kiểm tra vai trò của user và chuyển hướng phù hợp
            if ("staff".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("homepageforstaff");
            } else {
                int customerID = dao.getCustomerIDByUserID(user.getUserID());
                if (customerID == -1) {
                    request.setAttribute("mess", "CustomerID not found!");
                    request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
                    return;
                }
                session.setAttribute("customerID", customerID);
                response.sendRedirect("homepageforcustomer");
            }
        }
    }
}

