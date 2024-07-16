package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CancelContractDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Punishments;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class CancelContractService {
    private CancelContractDAO cancelContractDAO;

    public CancelContractService() {
        this.cancelContractDAO = new CancelContractDAO();
    }

    public void cancelContract(int contractID, double contractValue, String status) throws SQLException {
        // Update contract status and info
        String contractInfo = "";
        if ("Pending".equals(status)) {
            contractInfo = "Customer canceled the contract while it was in Pending status.";
            cancelContractDAO.updateContractStatus(contractID, "Canceled");
//            cancelContractDAO.updateContractInfo(contractID, contractInfo, Date.valueOf(LocalDate.now()));
        } else if ("Accepted".equals(status)) {
            contractInfo = "Customer canceled the contract while it was in Accepted status.";
            // Create punishment record
            Punishments punishment = new Punishments();
            punishment.setContractID(contractID);
            punishment.setPunishmentType("Contract Cancellation");
            punishment.setPunishmentDate(Date.valueOf(LocalDate.now()));
            punishment.setDescription("Customer canceled the contract before the expiry date. Penalty: " + (contractValue * 0.30));
            punishment.setStatus("Pending");

            // Insert punishment record
            cancelContractDAO.insertPunishment(punishment);
            cancelContractDAO.updateContractStatus(contractID, "Canceled");
//            cancelContractDAO.updateContractInfo(contractID, contractInfo, Date.valueOf(LocalDate.now()));
        }
    }
}