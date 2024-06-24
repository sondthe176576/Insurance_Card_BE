package org.example.insurance_card_be.service;

public class RenewContractService {
    // Khai bao renewContractDAO
    private RenewContractDAO renewContractDAO;

    // Khoi tao renewContractDAO
    public RenewContractService() {
        this.renewContractDAO = new RenewContractDAO();
    }

    // Ham lay thong tin cua mot contract theo ID
    public Contract geContractDetailByID(int contractID) throws Exception {
        return renewContractDAO.getContractDetailById(contractID);
    }

    // Ham renew contract
    public void renewContract(Contract contract) throws Exception {
        renewContractDAO.renewContract(contract);
    }
}
