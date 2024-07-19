package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;
import org.example.insurance_card_be.model.Customers;
import org.example.insurance_card_be.model.Motorcycle;
import org.example.insurance_card_be.model.Users;

import java.io.IOException;

@WebServlet("/customerinfo")
public class CustomerInforControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users loggedInUser = (Users) session.getAttribute("user");
        if (loggedInUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO userDAO = new UserDAO();
        Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
        if (userFromDB != null) {
            Customers customer = userDAO.getCustomerByUserId(userFromDB.getUserID());
            if (customer != null) {
                Motorcycle motorcycle = userDAO.getMotorcycleByCustomerId(customer.getCustomerID());
                request.setAttribute("user", userFromDB);
                request.setAttribute("customer", customer);
                request.setAttribute("motorcycle", motorcycle);
            }
        }
        request.getRequestDispatcher("/views/customer/CustomerInfor.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Here you can retrieve the data from the request, process it and redirect to another page
        request.getRequestDispatcher("views/customer/EditCustomerInfor.jsp").forward(request, response);
    }
}