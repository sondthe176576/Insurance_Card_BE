package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.WaitingContractDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;
import java.util.List;

public class WaitingContractService {
    private WaitingContractDAO contractDAO = new WaitingContractDAO();

    public List<Contract> getWaitingContracts() throws SQLException {
        return contractDAO.getContractsByStatus("Pending");
    }
}