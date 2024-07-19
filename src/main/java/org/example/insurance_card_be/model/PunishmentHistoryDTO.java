package org.example.insurance_card_be.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PunishmentHistoryDTO {

        private int punishmentID;
        private int customerID;
        private String description;
        private Date date;
        private String fullName;
        private String punishmentType;
        private String status;

}

