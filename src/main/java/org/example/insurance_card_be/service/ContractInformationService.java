package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractDetailDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;

public class ContractInformationService {
    private ContractDetailDAO contractDetailDAO = new ContractDetailDAO();

    public Contract getContractDetailById(int contractID) throws SQLException {
        return contractDetailDAO.getContractDetailById(contractID);
    }


    public void requestRenewContract(int contractID) throws SQLException {

    }
}
