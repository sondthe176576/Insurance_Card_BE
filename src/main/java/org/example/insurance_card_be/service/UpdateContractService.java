package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.UpdateContractDAO;
import org.example.insurance_card_be.dao.implement.ViewContractDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.ContractDetail;

public class UpdateContractService {
    // Khai báo các đối tượng DAO cần thiết
    private UpdateContractDAO updateContractDAO;
    private ViewContractDAO viewContractDAO;

    // Hàm khởi tạo
    public UpdateContractService(UpdateContractDAO updateContractDAO, ViewContractDAO viewContractDAO) {
        this.updateContractDAO = updateContractDAO;
        this.viewContractDAO = viewContractDAO;
    }

    // Hàm lấy thông tin hợp đồng theo ID
    public Contract geContractDetailByID(int contractID) {
        try {
            return viewContractDAO.getContractDetailById(contractID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Hàm cập nhật thông tin hợp đồng
    public void updateContract(Contract contract) {
        updateContractDAO.updateContract(contract);
    }

    // Hàm cập nhật thông tin chi tiết hợp đồng
    public void updateContractDetail(ContractDetail contractDetail) {
        updateContractDAO.updateContractDetail(contractDetail);
    }
}