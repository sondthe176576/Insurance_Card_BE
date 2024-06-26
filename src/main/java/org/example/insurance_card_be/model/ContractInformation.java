package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContractInformation {
    private int ContractID;
    private int CustomerID;
    private String ContractInfo;
    private String Status;
    private Date StartDate;
    private Date EndDate;
}
