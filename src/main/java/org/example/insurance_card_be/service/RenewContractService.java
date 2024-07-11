package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.RenewContractDAO;
import org.example.insurance_card_be.dao.implement.ViewContractDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.util.EmailUtil;

import java.text.SimpleDateFormat;

public class RenewContractService {
    private RenewContractDAO renewContractDAO;

    public RenewContractService() {
        this.renewContractDAO = new RenewContractDAO();
    }

    public Contract getContractDetailByID(int contractID) throws Exception {
        return renewContractDAO.getContractDetailById(contractID);
    }

    public void renewContract(Contract contract) throws Exception {
        renewContractDAO.renewContract(contract);
        sendRenewalEmail(contract);
    }

    private void sendRenewalEmail(Contract contract) {
        String email = contract.getCustomer().getUser().getEmail();
        String subject = "Contract Renewal Confirmation";

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String startDate = sdf.format(contract.getStartDate());
        String endDate = sdf.format(contract.getEndDate());

        String content = "Dear " + contract.getCustomer().getUser().getFullName() + ",\n\n" +
                "We are pleased to inform you that your contract with ID " + contract.getContractID() + " has been successfully renewed.\n\n" +
                "Contract Details:\n" +
                "Start Date: " + startDate + "\n" +
                "End Date: " + endDate + "\n" +
                "Premium: " + contract.getPremium() + "\n" +
                "Please visit our office within the next 15 days to complete the insurance fee payment.\n\n" +
                "Best regards,\n" +
                "Your Insurance Company";

        EmailUtil.sendEmail(email, subject, content);
    }
}