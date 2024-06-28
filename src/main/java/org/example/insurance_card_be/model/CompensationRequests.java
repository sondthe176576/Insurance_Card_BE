package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompensationRequests {
    private int requestID;
    private int customerID;
    private int contractID;
    private Date requestDate;
    private String status;
    private String description;
    private BigDecimal amount;
    private String customerName;
    private Contract contract;
}
