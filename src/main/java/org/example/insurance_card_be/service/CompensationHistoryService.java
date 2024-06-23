package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CompensationHistoryDAO;
import org.example.insurance_card_be.model.CompensationHistoryCus;

import java.util.List;

public class CompensationHistoryService {

    private CompensationHistoryDAO compensationHistoryDAO;

    public CompensationHistoryService() {
        this.compensationHistoryDAO = new CompensationHistoryDAO();
    }

    public List<CompensationHistoryCus> getAllCompensationHistories() {
        return compensationHistoryDAO.getAllCompensationHistories();
    }

    public CompensationHistoryCus getCompensationHistoryById(int compensationID) {
        return compensationHistoryDAO.getCompensationHistoryById(compensationID);
    }

    public List<CompensationHistoryCus> getCompensationHistoriesByCustomerID(int customerID) {
        return compensationHistoryDAO.getCompensationHistoriesByCustomerID(customerID);
    }

    public void addCompensationHistory(CompensationHistoryCus compensationHistoryCus) {
        compensationHistoryDAO.addCompensationHistory(compensationHistoryCus);
    }

    public void updateCompensationHistory(CompensationHistoryCus compensationHistoryCus) {
        compensationHistoryDAO.updateCompensationHistory(compensationHistoryCus);
    }

    public void deleteCompensationHistory(int compensationID) {
        compensationHistoryDAO.deleteCompensationHistory(compensationID);
    }
}
