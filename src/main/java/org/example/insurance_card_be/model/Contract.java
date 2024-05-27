package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Contract {
    private int ContractID;
    private int CustomerID;
    private String ContractInfo;
    private String status;
    private Date StartDate;
    private Date EndDate;
    private String detail;
    private double value;
    private String Coverage;
    private String InsuranceType;
    private double Premium;

    public void setCustomer(Customers customer) {
    }

    public void setUser(Users user) {
    }

    public void setMotorbikes(List<Motorcycle> motorbikes) {
    }

    public void setContractDetails(List<Contract> contractDetails) {
    }
}
