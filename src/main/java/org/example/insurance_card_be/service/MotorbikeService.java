package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.MotorbikeDAO;

public class MotorbikeService {
    // Service dung de xu ly logic cua motorbike
    private MotorbikeDAO motorbikeDAO;

    // Khoi tao motorbikeDAO
    public MotorbikeService() {
        this.motorbikeDAO = new MotorbikeDAO();
    }

    // Ham lay thong tin motorbike
    public void getMotorbikeInfo(int customerID) {
        motorbikeDAO.getMotorbikeInfo(customerID);
    }
}
