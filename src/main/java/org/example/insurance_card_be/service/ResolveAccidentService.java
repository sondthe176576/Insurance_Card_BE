package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolveAccidentDAO;
import org.example.insurance_card_be.model.Accident;

import java.sql.SQLException;

public class ResolveAccidentService {
    // Khai bao resolveAccidentDAO
    private ResolveAccidentDAO resolveAccidentDAO;

    // Khoi tao resolveAccidentDAO
    public ResolveAccidentService() {
        resolveAccidentDAO = new ResolveAccidentDAO();
    }

    // Ham lay thong tin tai nan theo ID
    public Accident getAccidentByID(int accidentID) {
        try {
            return resolveAccidentDAO.getAccidentByID(accidentID);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Ham cap nhat trang thai cua tai nan
    public void updateAccidentStatus(int accidentID, String status) {
        try {
            resolveAccidentDAO.updateAccidentStatus(accidentID, status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
