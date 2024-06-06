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

@WebServlet(name = "CustomerStaffController", urlPatterns = "/customer-staff")
public class CustomerStaffController extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO dao = new CustomerDAO();
        HttpSession session = req.getSession();
        List<Users> listCustomer = (List<Users>) session.getAttribute("listProduct");
        if (listCustomer == null){
            listCustomer = dao.findAll();
        }
        session.setAttribute("listCustomer", listCustomer);
        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") == null
                ? "" : req.getParameter("action");
        List<Users> listCustomer = new ArrayList<>();
        try {
            switch (action) {
                case "search":
                    listCustomer = searchCustomer(req, resp);
                    break;
                case "insert":
                    listCustomer = insertCustomer(req, resp);
                    break;
                case "update":

                    break;
                case "delete":
                    listCustomer = delete(req, resp);
                    break;
                default:
                    throw new AssertionError("Unknown action: " + action);
            }
            req.getSession().setAttribute("listCustomer", listCustomer);
            req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/views/staff/ErrorPage.jsp").forward(req, resp);
        }
    }


//
    private List<Users> searchCustomer(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        CustomerDAO dao = new CustomerDAO();
        List<Users> listCustomer = dao.findByUsername(keyword);
        return listCustomer;

    }

    private List<Users> insertCustomer(HttpServletRequest req, HttpServletResponse resp) {
        CustomerDAO customerDAO = new CustomerDAO();

        CustomerDAO dao = new CustomerDAO();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String fullName = req.getParameter("fullName");
        String gender = req.getParameter("gender");



        // Add other fields as necessary
        Users customer = new Users();
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setEmail(email);
        customer.setMobile(mobile);
        customer.setAddress(address);
        customer.setFullName(fullName);
        customer.setGender(gender);
        // Set other fields

        dao.insert(customer);
        return dao.findAll();
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
