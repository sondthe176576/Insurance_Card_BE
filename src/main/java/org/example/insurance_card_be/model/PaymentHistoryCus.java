package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentHistoryCus {
    private int paymentID;
    private int customerID;
    private BigDecimal amount;
    private Date paymentDate;
    private int paymentMethodID;
    private int contractID;
}