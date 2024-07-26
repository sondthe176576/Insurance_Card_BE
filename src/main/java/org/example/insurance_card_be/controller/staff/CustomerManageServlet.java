package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.Users;

@WebServlet(name = "CustomerManageServlet", urlPatterns = "/customer-manage")
public class CustomerManageServlet extends HttpServlet {
    private static final int CUSTOMERS_PER_PAGE = 8;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        if (req.getParameter("page") != null) {
            try {
                page = Integer.parseInt(req.getParameter("page"));
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid page number", e);
            }
        }

        String searchType = req.getParameter("searchType");
        String keyword = req.getParameter("keyword");
        String genderFilter = req.getParameter("genderFilter");

        if (searchType == null) {
            searchType = "";
        }

        if (keyword == null) {
            keyword = "";
        }

        if (genderFilter == null) {
            genderFilter = "";
        }

        CustomerDAO dao = new CustomerDAO();
        HttpSession session = req.getSession();

        List<Users> listCustomer;
        int totalCustomersFound = 0;
        switch (searchType) {
            case "name":
                listCustomer = dao.findByUsernameAndGender(keyword, genderFilter, page);
                totalCustomersFound = dao.getTotalCustomers("name", keyword, genderFilter);
                break;
            case "email":
                listCustomer = dao.findByEmailAndGender(keyword, genderFilter, page);
                totalCustomersFound = dao.getTotalCustomers("email", keyword, genderFilter);
                break;
            case "phone":
                listCustomer = dao.findByPhoneAndGender(keyword, genderFilter, page);
                totalCustomersFound = dao.getTotalCustomers("phone", keyword, genderFilter);
                break;
            default:
                listCustomer = dao.findAllWithGender(page, genderFilter);
                totalCustomersFound = dao.getTotalCustomers("", "", genderFilter);
                break;
        }

        int totalPages = (int) Math.ceil((double) totalCustomersFound / CUSTOMERS_PER_PAGE);
        if (totalPages < 1) {
            totalPages = 1;
        }

        session.setAttribute("listCustomer", listCustomer);
        session.setAttribute("totalPages", totalPages);
        session.setAttribute("currentPage", page);
        session.setAttribute("totalCustomersFound", totalCustomersFound);

        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        CustomerDAO dao = new CustomerDAO();
        List<Users> listCustomer = null;

        req.getSession().setAttribute("listCustomer", listCustomer);
        req.getRequestDispatcher("/views/staff/ManageCustomer.jsp").forward(req, resp);
    }
}
