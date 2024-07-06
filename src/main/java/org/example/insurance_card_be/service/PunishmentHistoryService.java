package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.PunishmentHistoryDAO;
import org.example.insurance_card_be.model.PunishmentHistory;

import java.util.List;

public class PunishmentHistoryService {

    private PunishmentHistoryDAO punishmentHistoryDAO;

    public PunishmentHistoryService() {
        this.punishmentHistoryDAO = new PunishmentHistoryDAO();
    }

    public List<PunishmentHistory> getAllPunishmentHistories() {
        return punishmentHistoryDAO.getAllPunishmentHistories();
    }

    public PunishmentHistory getPunishmentHistoryById(int punishmentID) {
        return punishmentHistoryDAO.getPunishmentHistoryById(punishmentID);
    }

    public List<PunishmentHistory> getPunishmentHistoriesByCustomerID(int customerID) {
        return punishmentHistoryDAO.getPunishmentHistoriesByCustomerID(customerID);
    }

    public void addPunishmentHistory(PunishmentHistory punishmentHistoryCus) {
        punishmentHistoryDAO.addPunishmentHistory(punishmentHistoryCus);
    }

    public void updatePunishmentHistory(PunishmentHistory punishmentHistoryCus) {
        punishmentHistoryDAO.updatePunishmentHistory(punishmentHistoryCus);
    }

    public void deletePunishmentHistory(int punishmentID) {
        PunishmentHistoryDAO punishmentHistoryDAO = new PunishmentHistoryDAO();
        punishmentHistoryDAO.deletePunishmentHistory(punishmentID);
    }
}
       
