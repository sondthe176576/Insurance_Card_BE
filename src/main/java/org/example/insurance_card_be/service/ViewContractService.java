package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ViewContractDAO;
import org.example.insurance_card_be.model.*;

import java.sql.SQLException;

public class ViewContractService {
    private ViewContractDAO viewContractDAO;

    public ViewContractService() {
        this.viewContractDAO = new ViewContractDAO();
    }
}