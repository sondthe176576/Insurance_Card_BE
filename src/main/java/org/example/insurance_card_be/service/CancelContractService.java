package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.CancelContractDAO;
import org.example.insurance_card_be.model.Punishments;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

public class CancelContractService {
    private CancelContractDAO cancelContractDAO;

    public CancelContractService() {
        this.cancelContractDAO = new CancelContractDAO();
    }

    public void cancelContract(int contractID, double contractValue) throws SQLException {
        // Create punishment record
        Punishments punishment = new Punishments();
        punishment.setContractID(contractID);
        punishment.setPunishmentType("Contract Cancellation");
        punishment.setPunishmentDate(Date.valueOf(LocalDate.now()));
        punishment.setDescription("Customer canceled the contract before the expiry date. Penalty: " + (contractValue * 0.30));
        punishment.setStatus("Paid");

        // Insert punishment record and update contract status
        cancelContractDAO.insertPunishment(punishment);
        cancelContractDAO.updateContractStatus(contractID, "Canceled");
        cancelContractDAO.updateCancellationDate(contractID, Date.valueOf(LocalDate.now()));
    }
}