package org.example.insurance_card_be.controller.auth;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.example.insurance_card_be.constant.Iconstant;
import org.example.insurance_card_be.dao.implement.UserDAO;
import org.example.insurance_card_be.entity.GoogleAccount;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.dao.implement.UserDAO;

import org.example.insurance_card_be.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.logging.Logger;


@WebServlet("/login")
public class LoginControl extends HttpServlet {
    private UserDAO dao = new UserDAO();

//    private static final Logger LOGGER = Logger.getLogger(LoginControl.class.getName());
//
//    public static String getToken(String code) throws ClientProtocolException, IOException {
//
//        String response = Request.Post(Iconstant.GOOGLE_LINK_GET_TOKEN)
//
//                .bodyForm(
//
//                        Form.form()
//
//                                .add("client_id", Iconstant.GOOGLE_CLIENT_ID)
//
//                                .add("client_secret", Iconstant.GOOGLE_CLIENT_SECRET)
//
//                                .add("redirect_uri", Iconstant.GOOGLE_REDIRECT_URI)
//
//                                .add("code", code)
//
//                                .add("grant_type", Iconstant.GOOGLE_GRANT_TYPE)
//
//                                .build()
//
//                )
//
//                .execute().returnContent().asString();
//
//
//
//        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//
//        return accessToken;
//
//    }
//
//    public static GoogleAccount getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
//        try {
//            String link = Iconstant.GOOGLE_LINK_GET_USER_INFO + accessToken;
//            String response = Request.Get(link).execute().returnContent().asString();
//
//            GoogleAccount googlePojo = new Gson().fromJson(response, GoogleAccount.class);
//            return googlePojo;
//        } catch (ClientProtocolException e) {
//            LOGGER.severe("ClientProtocolException: " + e.getMessage());
//            throw e;
//        } catch (IOException e) {
//            LOGGER.severe("IOException: " + e.getMessage());
//            throw e;
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidate the current session if it exists
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        // Forward to the login page

            request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
        }

        @Override
        protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String code = request.getParameter("code");
//        String accessToken = getToken(code);
//        GoogleAccount acc = getUserInfo(accessToken);
//        System.out.println(acc);
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            System.out.println("Username: " + username); // Debug print statement
            System.out.println("Password: " + password); // Debug print statement

            Users user = dao.login(username, password);

            if (user == null) {
                // Login failed, forward back to login page
                request.setAttribute("mess", "Wrong username or password!");
                // Debug print statement
                System.out.println("Mess attribute: " + request.getAttribute("mess"));
                System.out.println("Login failed");
                request.getRequestDispatcher("/views/homepage/Login.jsp").forward(request, response);
            } else {
                // Login successful, redirect to another page
                HttpSession session = request.getSession();

                session.setMaxInactiveInterval(7200);

                session.setAttribute("user", user); // Set user in session
                System.out.println("Login successful");
                request.getRequestDispatcher("/views/dashboard/HomePageForCustomer.jsp").forward(request, response);
            }
        }
    }


