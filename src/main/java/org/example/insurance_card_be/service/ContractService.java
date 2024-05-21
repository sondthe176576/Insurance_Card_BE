package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;


public class ContractService {
    // Service dung de xu ly logic cua contract
    private ContractDAO contractDAO;

    // Khoi tao contractDAO
    public ContractService() {
        this.contractDAO = new ContractDAO();
    }

    // Ham tao contract
    public void createContract(Contract contract) throws SQLException {
        contractDAO.createContract(contract);
    }

}
