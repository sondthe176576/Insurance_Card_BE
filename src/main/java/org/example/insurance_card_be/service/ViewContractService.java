package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ViewContractDAO;
import org.example.insurance_card_be.model.*;
import org.example.insurance_card_be.util.EmailUtil;

import java.util.Date;

public class ViewContractService {
    private ViewContractDAO viewContractDAO;

    public ViewContractService() {
        this.viewContractDAO = new ViewContractDAO();
    }

    public Contract getContractDetailByID(int contractID) {
        try {
            return viewContractDAO.getContractDetailById(contractID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

//    public boolean updatePaymentDetails(int contractID, String details, Date paymentDate) {
//        try {
////            return viewContractDAO.updatePaymentDetails(contractID, details, paymentDate);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }

    public void sendPaymentConfirmationEmail(Contract contract) {
        String email = contract.getCustomer().getUser().getEmail();
        String subject = "Insurance Contract Payment Confirmation";
        String message = "Dear " + contract.getCustomer().getUser().getFullName() + ",\n\n"
                + "We are pleased to inform you that your payment for the insurance contract with ID "
                + contract.getContractID() + " has been successfully processed.\n"
                + "Payment Amount: $" + contract.getValue() + "\n"
                + "Payment Date: " + new java.text.SimpleDateFormat("dd-MM-yyyy").format(new Date()) + "\n\n"
                + "Thank you for choosing our insurance services.\n"
                + "Best regards,\n"
                + "Motorcycle Insurance Company";

        EmailUtil.sendEmail(email, subject, message);
    }
}