package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;

@WebServlet(name = "CustomerEditServlet", urlPatterns = "/customer-edit")
public class CustomerEditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userID = Integer.parseInt(req.getParameter("userID"));
        CustomerDAO dao = new CustomerDAO();
        Users customer = dao.findById(userID);
        req.setAttribute("customer", customer);
        req.getRequestDispatcher("/views/staff/editCustomer.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO customerDAO = new CustomerDAO();
        int id = Integer.parseInt(req.getParameter("userId"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String province = req.getParameter("hidden_tinh");
        String district = req.getParameter("hidden_quan");
        String country = req.getParameter("hidden_phuong");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String fullName = req.getParameter("fullName");
        String birthDateStr = req.getParameter("birthDate");
        String gender = req.getParameter("gender");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthDate = null;
        try {
            birthDate = dateFormat.parse(birthDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Users customer = new Users();
        customer.setUserID(id);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setEmail(email);
        customer.setMobile(mobile);
        customer.setProvince(province);
        customer.setDistrict(district);
        customer.setCountry(country);
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setFullName(fullName);
        customer.setBirthDate(birthDate);
        customer.setGender(gender);
        customer.setRole("Customer");

        customerDAO.update(customer);

        List<Users> listCustomer = customerDAO.findAll();
        req.getSession().setAttribute("listCustomer", listCustomer);
        req.setAttribute("message", "Customer updated successfully.");
        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);
    }
}
