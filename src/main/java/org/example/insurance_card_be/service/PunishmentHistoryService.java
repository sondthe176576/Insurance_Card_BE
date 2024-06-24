package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.PunishmentHistoryDAO;
import org.example.insurance_card_be.model.PunishmentHistoryCus;

import java.util.List;

public class PunishmentHistoryService {

    private PunishmentHistoryDAO punishmentHistoryDAO;

    public PunishmentHistoryService() {
        this.punishmentHistoryDAO = new PunishmentHistoryDAO();
    }

    public List<PunishmentHistoryCus> getAllPunishmentHistories() {
        return punishmentHistoryDAO.getAllPunishmentHistories();
    }

    public PunishmentHistoryCus getPunishmentHistoryById(int punishmentID) {
        return punishmentHistoryDAO.getPunishmentHistoryById(punishmentID);
    }

    public List<PunishmentHistoryCus> getPunishmentHistoriesByCustomerID(int customerID) {
        return punishmentHistoryDAO.getPunishmentHistoriesByCustomerID(customerID);
    }

    public void addPunishmentHistory(PunishmentHistoryCus punishmentHistoryCus) {
        punishmentHistoryDAO.addPunishmentHistory(punishmentHistoryCus);
    }

    public void updatePunishmentHistory(PunishmentHistoryCus punishmentHistoryCus) {
        punishmentHistoryDAO.updatePunishmentHistory(punishmentHistoryCus);
    }

    public void deletePunishmentHistory(int punishmentID) {
        PunishmentHistoryDAO punishmentHistoryDAO = new PunishmentHistoryDAO();
        punishmentHistoryDAO.deletePunishmentHistory(punishmentID);
    }
}
       
