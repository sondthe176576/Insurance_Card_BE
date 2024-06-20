package org.example.insurance_card_be.controller.history;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.insurance_card_be.dao.implement.AccidentDAO;
import org.example.insurance_card_be.model.Accident;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Ach")
public class AccidentHistory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            try (var out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet AccidentHistory</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet AccidentHistory at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String pageParam = request.getParameter("page");
            String pageSizeParam = request.getParameter("pageSize");
            String status = request.getParameter("status");
            String description = request.getParameter("description");

            int page = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
            int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 10;

            AccidentDAO rdao = new AccidentDAO();
            List<Accident> listAh = rdao.getAccidentHistory(page, pageSize, status, description);  // Updated method call
            request.setAttribute("listAh", listAh);
            request.getRequestDispatcher("/views/history/accidentHistory.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid page or pageSize parameter");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for displaying accident history";
    }
}