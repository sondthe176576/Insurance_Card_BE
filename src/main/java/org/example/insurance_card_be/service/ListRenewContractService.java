package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ListRenewContractDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;
import java.util.List;

public class ListRenewContractService {
    private ListRenewContractDAO listRenewContractDAO;

    public ListRenewContractService() {
        this.listRenewContractDAO = new ListRenewContractDAO();
    }

    public List<Contract> getExpiredContracts(int page, int limit, String customerName) throws SQLException {
        return listRenewContractDAO.getExpiredContracts(page, limit, customerName);
    }

    public int getTotalExpiredContracts(String customerName) throws SQLException {
        return listRenewContractDAO.getTotalExpiredContracts(customerName);
    }
}