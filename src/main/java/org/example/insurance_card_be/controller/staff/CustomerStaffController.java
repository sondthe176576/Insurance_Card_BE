package org.example.insurance_card_be.controller.staff;

import java.io.IOException;
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
    private CustomerDAO customerDAO = new CustomerDAO();


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action") == null
                ? ""
                :req.getParameter("action");
        switch (action){
            case "addCustomer":
                addCustomer(req, resp, session);
                break;

            case"deleteCustomer":
                deleteCustomer(req, resp);
                break;
        }

    }


//add
    private void addCustomer(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws ServletException {

            try {
                // get personal info from request
                String username = req.getParameter("username");
                String address = req.getParameter("address");
                String mobile = req.getParameter("mobile");
                String email = req.getParameter("email");

                // store in session
                session.setAttribute("customerUsername", username);
                session.setAttribute("customerAddress", address);
                session.setAttribute("customerMobile", mobile);
                session.setAttribute("customerEmail", email);

                // redirect to account creation page
                resp.sendRedirect("views/staff/CreateAccount.jsp");
            } catch (Exception e) {
                throw new ServletException("Unable to add customer", e);
            }
    }
    // delete
    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) {
        int id  = Integer.parseInt(req.getParameter("userID"));
        try {
            customerDAO.delete(id);
            resp.sendRedirect("list-customer");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
