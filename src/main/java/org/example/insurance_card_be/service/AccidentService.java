package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.dao.implement.AccidentDAO;
import org.example.insurance_card_be.model.Accident;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class AccidentService {
    // Khai bao accidentDAO
    private AccidentDAO accidentDAO;

    // Khoi tao connection
    public AccidentService(Connection connection) {
        this.accidentDAO = new AccidentDAO(connection);
    }

    // Ham lay thong tin tat ca cac tai nan
    public List<Accident> getAllAccidents(int page, int limit, String status, String customerName) throws SQLException {
        return accidentDAO.getAllAccidents(page, limit, status, customerName);
    }

    // Ham lay tong so tai nan
    public int getTotalAccidents(String status, String customerName) throws SQLException {
        return accidentDAO.getTotalAccidents(status, customerName);
    }

    // Ham cap nhat trang thai cua tai nan
    public void updateAccidentStatus(int accidentID, String status) throws SQLException {
        accidentDAO.updateAccidentStatus(accidentID, status);
    }

}
