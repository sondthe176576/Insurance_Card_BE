package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;


public class ContractService {
    private ContractDAO contractDAO;

    public ContractService() {
        this.contractDAO = new ContractDAO();
    }

    public void createContract(Contract contract) throws SQLException {
        contractDAO.createContract(contract);
    }

}
