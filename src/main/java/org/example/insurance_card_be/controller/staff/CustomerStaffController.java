package org.example.insurance_card_be.controller.staff;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;




@WebServlet("/customer-staff")
public class CustomerStaffController extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO customerDAO = new CustomerDAO();
        List<Users> listCustomer = customerDAO.findAll();
        req.setAttribute("listCustomer", listCustomer);
        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") == null
                ? "" : req.getParameter("action");
        List<Users> listCustomer = new ArrayList<>();
        switch (action){
            case "delete":
                listCustomer = delete(req, resp);
                break;
        }
        req.getSession().setAttribute("listCustomer",listCustomer);
        resp.sendRedirect("customer-staff");
    }

    private List<Users> delete(HttpServletRequest req, HttpServletResponse resp) {
        CustomerDAO customerDAO = new CustomerDAO();
        int id = Integer.parseInt(req.getParameter("id"));
        Users users = new Users();
        users.setUserID(id);
        customerDAO.deleteByID(users);
        return customerDAO.findAll();
    }

}
