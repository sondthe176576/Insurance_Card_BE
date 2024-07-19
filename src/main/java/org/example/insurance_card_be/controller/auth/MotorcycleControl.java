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

@WebServlet("/motorcycle")
public class MotorcycleControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/customer/Motorcycle.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int userID = ((Users) session.getAttribute("user")).getUserID();
        // Additional fields
        String personal_info = request.getParameter("personal_info");
        System.out.println(personal_info);
        String license_plate = request.getParameter("license_plate");
        System.out.println(license_plate);
        String brand = request.getParameter("brand");
        System.out.println(brand);
        String model = request.getParameter("model");
        System.out.println(model);
        String frame_number = request.getParameter("frame_number");
        System.out.println(frame_number);
        String engine_number = request.getParameter("engine_number");
        System.out.println(engine_number);
        int year_of_manufacture = Integer.parseInt(request.getParameter("year_of_manufacture"));
        String color = request.getParameter("color");


        UserDAO dao = new UserDAO();
        int customerID = dao.getCustomerIDByUserID(userID);
        if(customerID > 0){
            request.setAttribute("messforadd", "Motorcycle already add, you can only edit!");
            request.getRequestDispatcher("/views/customer/CustomerInfor.jsp").forward(request, response);
       }
        else {
            dao.updateCustomerInfo(userID, personal_info);
            dao.addMotorcycle(userID, license_plate, brand, model, frame_number, engine_number, year_of_manufacture, color);
            request.getRequestDispatcher("/views/dashboard/HomePageForCustomer.jsp").forward(request, response);
        }

    }
}
