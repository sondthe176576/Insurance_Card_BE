package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.WaitingContractDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;
import java.util.List;

public class ListAllContractService {
    private WaitingContractDAO contractDAO = new WaitingContractDAO();

    public List<Contract> getAllContracts(String status, String customerName, String startDate, String insuranceType, int page, int pageSize) throws SQLException {
        return contractDAO.getContractsByStatus(status, customerName, startDate, insuranceType, page, pageSize);
    }

    public int getTotalContracts(String status, String customerName, String startDate, String insuranceType) throws SQLException {
        return contractDAO.getTotalContractsByStatus(status, customerName, startDate, insuranceType);
    }
}