package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.UpdateContractDAO;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.ContractDetail;

import java.math.BigDecimal;
import java.sql.Connection;

public class UpdateContractService {
    // Khai báo các đối tượng DAO cần thiết
    private UpdateContractDAO updateContractDAO;

    // Hàm khởi tạo không tham số
    public UpdateContractService() {
        this.updateContractDAO = new UpdateContractDAO();
    }

    // Hàm lấy thông tin hợp đồng theo ID
    public Contract geContractDetailByID(int contractID) {
        return updateContractDAO.getContractDetailByID(contractID);
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