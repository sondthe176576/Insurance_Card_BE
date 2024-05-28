package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ViewContractDAO;
import org.example.insurance_card_be.model.*;

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
}