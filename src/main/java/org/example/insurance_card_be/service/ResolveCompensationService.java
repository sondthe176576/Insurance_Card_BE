package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolveCompensationDAO;
import org.example.insurance_card_be.model.CompensationRequests;

import java.sql.SQLException;

public class ResolveCompensationService {
    // Khai bao resolveCompensationDAO
    private ResolveCompensationDAO resolveCompensationDAO;

    // Khoi tao resolveCompensationDAO
    public ResolveCompensationService() {
        resolveCompensationDAO = new ResolveCompensationDAO();
    }

    // Ham lay thong tin tat ca cac yeu cau boi thuong
    public CompensationRequests resolveCompensation(int requestID) {
        try {
            return resolveCompensationDAO.getCompensationRequestByID(requestID);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Cap nhat yeu cau boi thuong
    public void updateCompensationRequestStatus(int requestID, String status) {
        try {
            CompensationRequests request = resolveCompensationDAO.getCompensationRequestByID(requestID);
            if (request != null) {
                request.setStatus(status);
                resolveCompensationDAO.updateCompensationRequest(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Ham main test lay thong tin yeu cau boi thuong
    public static void main(String[] args) {
        ResolveCompensationService resolveCompensationService = new ResolveCompensationService();
        CompensationRequests request = resolveCompensationService.resolveCompensation(1);
        System.out.println(request);
    }
}