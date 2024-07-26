package org.example.insurance_card_be.controller.staff;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.example.insurance_card_be.dao.implement.CustomerDAO;
import org.example.insurance_card_be.model.NewUserVerify;
import org.example.insurance_card_be.model.Users;

@WebServlet(name = "CustomerCreateServlet", urlPatterns = "/customer-create")
public class CustomerCreateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/staff/createCustomer.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDAO dao = new CustomerDAO();

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

        Users users = new Users();
        users.setUsername(username);
        users.setPassword(password);
        users.setEmail(email);
        users.setMobile(mobile);
        users.setProvince(province);
        users.setDistrict(district);
        users.setCountry(country);
        users.setFirstName(firstName);
        users.setLastName(lastName);
        users.setFullName(fullName);
        users.setBirthDate(birthDate);
        users.setGender(gender);

        // Gửi mã xác thực qua email
        NewSendEmailControl emailControl = new NewSendEmailControl();
        String verificationCode = emailControl.getRandom();
        NewUserVerify user = new NewUserVerify();
        user.setEmail(email);
        user.setCode(verificationCode);
        boolean emailSent = emailControl.sendEmail(user);

        if (emailSent) {
            // Lưu thông tin vào session và chờ xác thực mã
            HttpSession session = req.getSession();
            session.setAttribute("verificationCode", verificationCode);
            session.setAttribute("users", users); // Lưu với key là "users"

            // Chuyển hướng đến trang nhập mã xác thực
            resp.sendRedirect(req.getContextPath() + "/views/staff/verify.jsp");
        } else {
            // Xử lý trường hợp gửi email không thành công
            req.setAttribute("errorMessage", "Failed to send verification email. Please try again.");
            req.getRequestDispatcher("/views/staff/createCustomer.jsp").forward(req, resp);
        }
    }
}
