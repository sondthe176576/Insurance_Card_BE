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

    public List<CompensationRequests> getAllCompensationRequests(int page, int limit) throws SQLException {
        return compensationRequestDAO.getAllCompensationRequests(page, limit);
    }

    public int getTotalCompensationRequests() throws SQLException {
        return compensationRequestDAO.getTotalCompensationRequests();
    }

    // Ham main de kiem tra
    public static void main(String[] args) {
        try (Connection connection = DBContext.getConnection()) {
            CompensationService service = new CompensationService(connection);
            List<CompensationRequests> requests = service.getAllCompensationRequests(1, 5);
            for (CompensationRequests request : requests) {
                System.out.println("Request ID: " + request.getRequestID());
                System.out.println("Customer ID: " + request.getCustomerID());
                System.out.println("Contract ID: " + request.getContractID());
                System.out.println("Customer Name: " + request.getCustomerName());
                System.out.println("Description: " + request.getDescription());
                System.out.println("Amount: " + request.getAmount());
                System.out.println("Status: " + request.getStatus());
                System.out.println("Request Date: " + request.getRequestDate());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}