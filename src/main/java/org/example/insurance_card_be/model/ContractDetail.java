package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContractDetail {
    private int contractDetailID;
    private int contractID;
    private String detail;
    private BigDecimal value;
}
