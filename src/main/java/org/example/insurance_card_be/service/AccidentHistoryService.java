package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.AccidentHistoryDAO;
import org.example.insurance_card_be.model.AccidentHistoryCus;

import java.util.List;

public class AccidentHistoryService {
    private AccidentHistoryDAO accidentHistoryDAO;

    public AccidentHistoryService() {
        accidentHistoryDAO = new AccidentHistoryDAO();
    }

    public List<AccidentHistoryCus> getAllAccidentHistories() {
        return accidentHistoryDAO.getAllAccidentHistories();
    }

    public AccidentHistoryCus getAccidentHistoryById(int accidentID) {
        return accidentHistoryDAO.getAccidentHistoryById(accidentID);
    }

    public void addAccidentHistory(AccidentHistoryCus accidentHistory) {
        accidentHistoryDAO.addAccidentHistory(accidentHistory);
    }

    public void deleteAccidentHistory(int accidentID) {
        accidentHistoryDAO.deleteAccidentHistory(accidentID);
    }

    public void updateAccidentHistory(AccidentHistoryCus accidentHistory) {
        accidentHistoryDAO.updateAccidentHistory(accidentHistory);
    }

    public List<AccidentHistoryCus> getAccidentHistoriesByCustomerID(int customerID) {
        return accidentHistoryDAO.getAccidentHistoriesByCustomerID(customerID);
    }
}
