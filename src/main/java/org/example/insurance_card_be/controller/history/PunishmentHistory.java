package org.example.insurance_card_be.controller.history;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.dao.implement.PunishmentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/punishmentHistory")
public class PunishmentHistory extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PunishmentDAO punishmentDAO;
    private Connection connection;

    @Override
    public void init() throws ServletException {
        super.init();
        connection = DBContext.getConnection();
        punishmentDAO = new PunishmentDAO(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<org.example.insurance_card_be.model.PunishmentHistory> punishmentHistoryList = punishmentDAO.getAllPunishmentHistories();
            request.setAttribute("punishmentHistoryList", punishmentHistoryList);
            request.getRequestDispatcher("/views/history/punishmentHistory.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void destroy() {
        DBContext.closeConnection(connection);
        super.destroy();
    }
}
