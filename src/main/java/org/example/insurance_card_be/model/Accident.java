package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accident {
    private int accidentID;
    private int contractID;
    private int customerID;
    private String accidentType;
    private String accidentDate;
    private String description;
    private String customerName;
    private String status;
}