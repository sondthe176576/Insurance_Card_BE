package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CompensationHistoryDAO;
import org.example.insurance_card_be.model.CompensationRequests;

import java.sql.SQLException;
import java.util.List;

public class CompensationHistoryService {
    private CompensationHistoryDAO compensationHistoryDAO;

    public CompensationHistoryService() {
        compensationHistoryDAO = new CompensationHistoryDAO();
    }

    public CompensationRequests getCompensationRequestById(int requestId) throws SQLException {
        return compensationHistoryDAO.getCompensationRequestById(requestId);
    }

    public List<CompensationRequests> getCompensationRequestsByCustomerID(int customerId, int offset, int limit) throws SQLException {
        return compensationHistoryDAO.getCompensationRequestsByCustomerID(customerId, offset, limit);
    }

    public int getTotalCompensationRequestsByCustomerID(int customerId) throws SQLException {
        return compensationHistoryDAO.getTotalCompensationRequestsByCustomerID(customerId);
    }

    public void addCompensationRequest(CompensationRequests request) throws SQLException {
        compensationHistoryDAO.addCompensationRequest(request);
    }

    public void updateCompensationRequest(CompensationRequests request) throws SQLException {
        compensationHistoryDAO.updateCompensationRequest(request);
    }

    public void deleteCompensationRequest(int requestId) throws SQLException {
        compensationHistoryDAO.deleteCompensationRequest(requestId);
    }

    public boolean isContractValidForCustomer(int contractID, int customerID) throws SQLException {
        return compensationHistoryDAO.isContractValidForCustomer(contractID, customerID);
    }
}
