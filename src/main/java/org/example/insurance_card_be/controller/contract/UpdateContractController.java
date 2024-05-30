package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.ContractDetail;
import org.example.insurance_card_be.service.UpdateContractService;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "UpdateContractController", urlPatterns = "/updateContract")
public class UpdateContractController {
    // Khai bao updateContractService
    private UpdateContractService updateContractService;

    // Khoi tao updateContractService
    public UpdateContractController(UpdateContractService updateContractService) {
        this.updateContractService = updateContractService;
    }

    // Ham get de hien thi trang update contract
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        Contract contract = updateContractService.geContractDetailByID(contractID);
        req.setAttribute("contract", contractID);
        req.getRequestDispatcher("/views/contract/updateContract.jsp").forward(req, resp);
    }

    // Ham post de update contract
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {
        // Lay thong tin tu request
        int contractID = Integer.parseInt(req.getParameter("contractID"));
        String contractInfo = req.getParameter("contractInfo");
        String status = req.getParameter("status");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String insuranceType = req.getParameter("insuranceType");
        String coverage = req.getParameter("coverage");
        double premium = Double.parseDouble(req.getParameter("premium"));
        double value = Double.parseDouble(req.getParameter("value"));
        String detail = req.getParameter("detail");

        Contract contract = new Contract();
        contract.setContractID(contractID);
        contract.setContractInfo(contractInfo);
        contract.setStatus(status);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            contract.setStartDate(formatter.parse(startDate));
            contract.setEndDate(formatter.parse(endDate));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        contract.setInsuranceType(insuranceType);
        contract.setCoverage(coverage);
        contract.setPremium(premium);

        updateContractService.updateContract(contract);

        ContractDetail contractDetail = new ContractDetail();
        contractDetail.setContractID(contractID);
        contractDetail.setDetail(detail);
        contractDetail.setValue(BigDecimal.valueOf(value));

        updateContractService.updateContractDetail(contractDetail);

        resp.sendRedirect(req.getContextPath() + "/viewContract?contractID=" + contractID);
    }
}