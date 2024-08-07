package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.AccidentHistoryDAO;
import org.example.insurance_card_be.model.Accident;

import java.sql.SQLException;
import java.util.List;

public class AccidentHistoryService {
    private AccidentHistoryDAO accidentHistoryDAO;

    public AccidentHistoryService() {
        accidentHistoryDAO = new AccidentHistoryDAO();
    }

    public List<Accident> getAccidentsByCustomerID(int customerID) throws SQLException {
        return accidentHistoryDAO.getAccidentsByCustomerID(customerID);
    }


    public void addAccident(Accident accident) throws SQLException {
        accidentHistoryDAO.addAccident(accident);
    }

    public void updateAccident(Accident accident) throws SQLException {
        accidentHistoryDAO.updateAccident(accident);
    }

    public void deleteAccidentHistory(int accidentID) throws SQLException {
        accidentHistoryDAO.deleteAccidentHistory(accidentID);
    }
}
