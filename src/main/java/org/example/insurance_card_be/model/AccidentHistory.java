package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccidentHistory {
    private int accidentID;
    private int customerID;
    private String description;
    private Date date;
}