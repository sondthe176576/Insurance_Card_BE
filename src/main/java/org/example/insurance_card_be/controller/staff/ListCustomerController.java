package org.example.insurance_card_be.controller.staff;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;
import java.io.IOException;
import java.util.List;

@WebServlet("/list-customer")
public class ListCustomerController  extends HttpServlet {
    private CustomerDAO customerDAO = new CustomerDAO();


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Users> list = customerDAO.findAll();
        req.setAttribute("data", list);
        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);

    }

}
