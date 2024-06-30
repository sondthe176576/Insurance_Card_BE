package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CompensationHistoryDAO;
import org.example.insurance_card_be.model.CompensationHistory;

import java.util.List;

public class CompensationHistoryService {

    private CompensationHistoryDAO compensationHistoryDAO;

    public CompensationHistoryService() {
        this.compensationHistoryDAO = new CompensationHistoryDAO();
    }

    public List<CompensationHistory> getAllCompensationHistories() {
        return compensationHistoryDAO.getAllCompensationHistories();
    }

    public CompensationHistory getCompensationHistoryById(int compensationID) {
        return compensationHistoryDAO.getCompensationHistoryById(compensationID);
    }

    public List<CompensationHistory> getCompensationHistoriesByCustomerID(int customerID) {
        return compensationHistoryDAO.getCompensationHistoriesByCustomerID(customerID);
    }

    public void addCompensationHistory(CompensationHistory compensationHistory) {
        compensationHistoryDAO.addCompensationHistory(compensationHistory);
    }

    public void updateCompensationHistory(CompensationHistory compensationHistory) {
        compensationHistoryDAO.updateCompensationHistory(compensationHistory);
    }

    public void deleteCompensationHistory(int compensationID) {
        compensationHistoryDAO.deleteCompensationHistory(compensationID);
    }
}
