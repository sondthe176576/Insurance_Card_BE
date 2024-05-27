package org.example.insurance_card_be.controller.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;




@WebServlet(urlPatterns = "/listCustomers")
public class ListCustomerController extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO cus = new CustomerDAO();
        List<Users> list = cus.findAll();
        req.setAttribute("data", list);
        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);

    }
}
