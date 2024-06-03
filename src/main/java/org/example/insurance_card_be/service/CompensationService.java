package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.dao.implement.CompensationRequestDAO;
import org.example.insurance_card_be.model.CompensationRequests;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CompensationService {
    private CompensationRequestDAO compensationRequestDAO;

    public CompensationService(Connection connection) {
        this.compensationRequestDAO = new CompensationRequestDAO(connection);
    }

    public List<CompensationRequests> getAllCompensationRequests(int page, int limit, String status) throws SQLException {
        return compensationRequestDAO.getAllCompensationRequests(page, limit, status);
    }

    public int getTotalCompensationRequests(String status) throws SQLException {
        return compensationRequestDAO.getTotalCompensationRequests(status);
    }

    public void updateCompensationRequestStatus(int requestID, String status) throws SQLException{
        compensationRequestDAO.updateCompensationRequestStatus(requestID, status);
    }
}