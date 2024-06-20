package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompensationHistory {
    private int compensationID;
    private int CustomerID;
    private BigDecimal amount;
    private Date date;
}