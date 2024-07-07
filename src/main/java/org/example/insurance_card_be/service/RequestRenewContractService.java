package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractDetailDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.util.EmailFromCustomer;

import java.sql.SQLException;

public class RequestRenewContractService {
    private ContractDetailDAO contractDetailDAO;

    public RequestRenewContractService() {
        this.contractDetailDAO = new ContractDetailDAO();
    }

    public void requestRenewContract(int contractID, int renewYears, String customerEmail) throws SQLException {
        try {
            Contract contract = contractDetailDAO.getContractDetailById(contractID);

            String subject = "Request to Renew Contract";
            String body = "Customer Email: " + customerEmail + "\n"
                    + "Request to renew contract ID: " + contractID + " for " + renewYears + " years.\n"
                    + "Contract Info: " + contract.getContractInfo() + "\n"
                    + "Insurance Type: " + contract.getInsuranceType() + "\n"
                    + "Coverage: " + contract.getCoverage() + "\n"
                    + "Premium: " + contract.getPremium() + "\n"
                    + "Customer Info: \n"
                    + "Full Name: " + contract.getCustomer().getUser().getFullName() + "\n"
                    + "Email: " + contract.getCustomer().getUser().getEmail() + "\n"
                    + "Mobile: " + contract.getCustomer().getUser().getMobile() + "\n"
                    + "Motorcycle Info: \n"
                    + "License Plate: " + contract.getMotorcycle().getLicensePlate() + "\n"
                    + "Brand: " + contract.getMotorcycle().getBrand() + "\n"
                    + "Model: " + contract.getMotorcycle().getModel() + "\n"
                    + "Frame Number: " + contract.getMotorcycle().getFrameNumber() + "\n"
                    + "Engine Number: " + contract.getMotorcycle().getEngineNumber();

            EmailFromCustomer.sendEmail("insurance_company@example.com", subject, body);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Failed to request renew contract.", e);
        }
    }
}