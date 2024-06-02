package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.RenewContractDAO;
import org.example.insurance_card_be.dao.implement.ViewContractDAO;
import org.example.insurance_card_be.model.Contract;

public class RenewContractService {
    private RenewContractDAO renewContractDAO;

    public RenewContractService() {
        this.renewContractDAO = new RenewContractDAO();
    }

    // Lay thong tin hop dong theo ID
    public Contract geContractDetailByID(int contractID) throws Exception {
        return renewContractDAO.getContractDetailById(contractID);
    }

    // Ham renew contract
    public void renewContract(Contract contract) throws Exception {
        renewContractDAO.renewContract(contract);
    }
}
