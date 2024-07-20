package org.example.insurance_card_be.controller.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;
import org.example.insurance_card_be.model.Users;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/editinfor")
public class EditInforControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/customer/EditCustomerInfor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = ((Users) session.getAttribute("user")).getUsername();
        int userID = ((Users) session.getAttribute("user")).getUserID();
        String full_name = request.getParameter("full_name");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String mobile = request.getParameter("mobile");
        String email_id = request.getParameter("email_id");
        String gender = request.getParameter("gender");
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));
        String tinh = request.getParameter("hidden_tinh");
        String quan = request.getParameter("hidden_quan");
        String phuong = request.getParameter("hidden_phuong");

        // Additional fields
        String personal_info = request.getParameter("personal_info");
        String license_plate = request.getParameter("license_plate");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String frame_number = request.getParameter("frame_number");
        String engine_number = request.getParameter("engine_number");
        int year_of_manufacture = Integer.parseInt(request.getParameter("year_of_manufacture"));
        String color = request.getParameter("color");

        UserDAO dao = new UserDAO();
        int customerID = dao.getCustomerIDByUserID(userID);
        int motorcycleID = dao.getMotorcycleIDbyCustomerID(customerID);
        if(motorcycleID > 0) {
            dao.updateProfile(username, email_id, mobile, tinh, quan, phuong, first_name, last_name, full_name, birthdate, gender);
            dao.updateCustomerInfo(userID, personal_info);
            dao.updateMotorcycles(customerID, license_plate, brand, model, frame_number, engine_number, year_of_manufacture, color);
        }
        else{
            dao.addMotorcycle(userID, license_plate, brand, model, frame_number, engine_number, year_of_manufacture, color);
        }
        request.getRequestDispatcher("/views/dashboard/HomePageForCustomer.jsp").forward(request, response);
    }
}
