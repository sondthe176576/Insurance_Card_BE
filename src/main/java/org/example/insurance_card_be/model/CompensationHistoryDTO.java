
package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CompensationHistoryDTO {
    private int compensationID;
    private int customerID;
    private BigDecimal amount;
    private Date date;
    private String status;
    private String fullName;
    private String description;
    private int contractID;
    private Users users;
    private Contract contract;
}