package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ViewContractDAO;
import org.example.insurance_card_be.model.*;

public class ViewContractService {
    // Khai bao viewContractDAO
    private ViewContractDAO viewContractDAO;

    // Khoi tao viewContractDAO
    public ViewContractService() {
        this.viewContractDAO = new ViewContractDAO();
    }

    // Ham lay thong tin cua mot contract theo ID
    public Contract getContractDetailByID(int contractID) {
        try {
            return viewContractDAO.getContractDetailById(contractID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}