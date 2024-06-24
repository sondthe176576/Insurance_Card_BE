package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;

@WebServlet(name = "CustomerDeleteServlet", urlPatterns = "/customer-delete")
public class CustomerDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO customerDAO = new CustomerDAO();
        int id = Integer.parseInt(req.getParameter("id"));
        Users users = new Users();
        users.setUserID(id);
        customerDAO.deleteByID(users);
        List<Users> listCustomer = customerDAO.findAll();
        req.getSession().setAttribute("listCustomer", listCustomer);
        req.setAttribute("message", "Customer deleted successfully.");
        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);
    }
}
