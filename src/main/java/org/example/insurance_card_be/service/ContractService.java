package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ContractDAO;
import org.example.insurance_card_be.dao.implement.NotificationDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Notifications;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;


public class ContractService {
    private ContractDAO contractDAO = new ContractDAO();
    private NotificationDAO notificationDAO = new NotificationDAO();

    public void createContract(Contract contract) throws SQLException {
        contractDAO.createContract(contract);
        sendNotificationToAllStaff(contract);
    }

    private void sendNotificationToAllStaff(Contract contract) throws SQLException {
        List<Integer> staffUserIDs = notificationDAO.getAllStaffUserIDs();
        for (Integer staffUserID : staffUserIDs) {
            Notifications notification = new Notifications();
            notification.setUserID(staffUserID);
            notification.setMessage("New contract created by customer " + contract.getCustomerID());
            notification.setCreatedDate(new Date());
            notification.setRead(false);
            notificationDAO.addNotification(notification);
        }
    }

    public Contract getContractByID(int contractID) {
        return contractDAO.getContractByID(contractID);
    }

    public Contract getLatestContractByCustomerID(int customerID) {
        return contractDAO.getLatestContractByCustomerID(customerID);
    }
}
