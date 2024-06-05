package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Punishments {
    private int punishmentID;
    private int contractID;
    private String punishmentType;
    private Date punishmentDate;
    private String description;
    private String status;
}
