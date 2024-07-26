package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ListRenewContractDAO;
import org.example.insurance_card_be.model.Contract;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ListRenewContractService {
    private ListRenewContractDAO listRenewContractDAO;

    public ListRenewContractService() {
        this.listRenewContractDAO = new ListRenewContractDAO();
    }

    public Map<Contract, Integer> getExpiredContracts(int page, int limit, String customerName) throws SQLException {
        List<Contract> contracts = listRenewContractDAO.getExpiredContracts(page, limit, customerName);
        Map<Contract, Integer> contractDaysOverdueMap = new HashMap<>();
        for (Contract contract : contracts) {
            int daysOverdue = calculateDaysOverdue(contract.getEndDate());
            contractDaysOverdueMap.put(contract, daysOverdue);
        }
        return contractDaysOverdueMap;
    }

    public int getTotalExpiredContracts(String customerName) throws SQLException {
        return listRenewContractDAO.getTotalExpiredContracts(customerName);
    }

    // Tính toán số ngày quá hạn (có thể âm nếu hợp đồng đã hết hạn)
    private int calculateDaysOverdue(Date endDate) {
        Date currentDate = new Date();
        long diffInMillies = endDate.getTime() - currentDate.getTime();
        long diff = diffInMillies / (1000 * 60 * 60 * 24);
        return (int) diff;
    }
}