package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentHistory {
    private int paymentID;
    private int customerID;
    private BigDecimal amount;
    private Date paymentDate;
    private int paymentMethodID;
    private int contractID;
    private String paymentDetails; // Thêm thuộc tính này để chứa thông tin chi tiết trạng thái thanh toán
}
