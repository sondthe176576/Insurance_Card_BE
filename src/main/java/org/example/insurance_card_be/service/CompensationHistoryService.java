package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CompensationHistoryDAO;
import org.example.insurance_card_be.model.CompensationRequests;

import java.util.List;

public class CompensationHistoryService {

    private CompensationHistoryDAO compensationHistoryDAO;

    public CompensationHistoryService() {
        this.compensationHistoryDAO = new CompensationHistoryDAO();
    }

    public List<CompensationRequests> getAllCompensationRequests() {
        try {
            return compensationHistoryDAO.getAllCompensationRequests();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public CompensationRequests getCompensationRequestById(int requestID) {
        try {
            return compensationHistoryDAO.getCompensationRequestById(requestID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<CompensationRequests> getCompensationRequestsByCustomerID(int customerID) {
        try {
            return compensationHistoryDAO.getCompensationRequestsByCustomerID(customerID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<CompensationRequests> getCompensationRequestsByCustomerID(int customerID, int offset, int limit) {
        try {
            return compensationHistoryDAO.getCompensationRequestsByCustomerID(customerID, offset, limit);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getTotalCompensationRequestsByCustomerID(int customerID) {
        try {
            return compensationHistoryDAO.getTotalCompensationRequestsByCustomerID(customerID);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public boolean isContractValidForCustomer(int contractID, int customerID) {
        try {
            return compensationHistoryDAO.isContractValidForCustomer(contractID, customerID);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addCompensationRequest(CompensationRequests compensationRequest) {
        try {
            compensationHistoryDAO.addCompensationRequest(compensationRequest);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCompensationRequest(CompensationRequests compensationRequest) {
        try {
            compensationHistoryDAO.updateCompensationRequest(compensationRequest);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCompensationRequest(int requestID) {
        try {
            compensationHistoryDAO.deleteCompensationRequest(requestID);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
