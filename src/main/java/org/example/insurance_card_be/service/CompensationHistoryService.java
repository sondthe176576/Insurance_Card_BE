package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CompensationHistoryDAO;
import org.example.insurance_card_be.model.CompensationRequests;

import java.sql.SQLException;
import java.util.List;

public class CompensationHistoryService {
    private final CompensationHistoryDAO compensationHistoryDAO;

    public CompensationHistoryService() {
        this.compensationHistoryDAO = new CompensationHistoryDAO();
    }

    public boolean isContractValidForCustomer(int contractID, int customerID) throws SQLException {
        return compensationHistoryDAO.isContractValidForCustomer(contractID, customerID);
    }

    public void addCompensationRequest(CompensationRequests request) throws SQLException {
        compensationHistoryDAO.addCompensationRequest(request);
    }

    public void updateCompensationRequest(CompensationRequests request) throws SQLException {
        compensationHistoryDAO.updateCompensationRequest(request);
    }

    public void deleteCompensationRequest(int requestID) throws SQLException {
        compensationHistoryDAO.deleteCompensationRequest(requestID);
    }

    public CompensationRequests getCompensationRequestById(int requestID) throws SQLException {
        return compensationHistoryDAO.getCompensationRequestById(requestID);
    }

    public List<CompensationRequests> getAllCompensationRequests() throws SQLException {
        return compensationHistoryDAO.getAllCompensationRequests();
    }

    public List<CompensationRequests> getCompensationRequestsByCustomerID(int customerID, int offset, int limit) throws SQLException {
        return compensationHistoryDAO.getCompensationRequestsByCustomerID(customerID, offset, limit);
    }

    public int getTotalCompensationRequestsByCustomerID(int customerID) throws SQLException {
        return compensationHistoryDAO.getTotalCompensationRequestsByCustomerID(customerID);
    }


}
