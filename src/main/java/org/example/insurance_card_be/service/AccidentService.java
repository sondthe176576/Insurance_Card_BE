package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.dao.implement.AccidentDAO;
import org.example.insurance_card_be.model.Accident;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class AccidentService {
    private AccidentDAO accidentDAO;

    public AccidentService(Connection connection) {
        this.accidentDAO = new AccidentDAO(connection);
    }

    // List all accidents
    public List<Accident> getAllAccidents(int page, int limit) throws SQLException {
        return accidentDAO.getAllAccidents(page, limit);
    }

    // Get total accidents
    public int getTotalAccidents() throws SQLException {
        return accidentDAO.getTotalAccidents();
    }

    // Get accident by ID
    public Accident getAccidentByID(int accidentID) throws SQLException {
        return accidentDAO.getAccidentById(accidentID);
    }

    // Ham main de test
    public static void main(String[] args) {
        Connection connection = DBContext.getConnection();
        AccidentService accidentService = new AccidentService(connection);
        try {
            List<Accident> accidents = accidentService.getAllAccidents(1, 10);
            for (Accident accident : accidents) {
                System.out.println(accident);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
