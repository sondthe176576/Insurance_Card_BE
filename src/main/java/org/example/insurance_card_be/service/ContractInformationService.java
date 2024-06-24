package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractInformationDAO;
import org.example.insurance_card_be.model.ContractInformation;

import java.util.List;

public class ContractInformationService {
    private final ContractInformationDAO contractInformationDAO;

    public ContractInformationService() {
        this.contractInformationDAO = new ContractInformationDAO();
    }

    public void addContract(ContractInformation contract) {
        contractInformationDAO.addContract(contract);
    }

    public ContractInformation getContractById(int contractId) {
        return contractInformationDAO.getContractById(contractId);
    }

    public List<ContractInformation> getAllContracts() {
        return contractInformationDAO.getAllContracts();
    }

    public void updateContract(ContractInformation contract) {
        contractInformationDAO.updateContract(contract);
    }

    public void deleteContract(int contractId) {
        contractInformationDAO.deleteContract(contractId);
    }
}
