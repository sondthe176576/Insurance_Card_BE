package org.example.insurance_card_be.service;

public class UpdateContractService {
    // Khai báo updateContractDAO
    private UpdateContractDAO updateContractDAO;

    // Khởi tạo updateContractDAO
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