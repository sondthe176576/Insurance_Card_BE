package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccidentHistoryDTO {
    private String fullName;
    private int accidentID;
    private String description;
    private Date date;
    private String accidentType;
    private String status;
    private int customerID;
}