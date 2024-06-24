package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QRPayments {
    private int qrPaymentID;
    private int customerID;
    private int contractID;
    private BigDecimal amount;
    private Date paymentDate;
    private String qrCode;
    private String status;
}
