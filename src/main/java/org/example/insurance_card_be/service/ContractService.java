package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;


public class ContractService {
    // Khai bao contractDAO
    private ContractDAO contractDAO;

    // Khoi tao contractDAO
    public ContractService() {
        this.contractDAO = new ContractDAO();
    }

    // Ham tao contract
    public void createContract(Contract contract) throws SQLException {
        contractDAO.createContract(contract);
    }

    public Contract getContractByID(int contractID) {
        return contractDAO.getContractByID(contractID);
    }

    public Contract getLatestContractByCustomerID(int customerID) {
        return contractDAO.getLatestContractByCustomerID(customerID);
    }
}
