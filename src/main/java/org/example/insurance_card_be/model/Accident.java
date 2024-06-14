package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accident {
    private int accidentID;
    private int contractID;
    private int customerID;
    private String accidentType;
    private Date accidentDate;
    private String description;
    private String customerName;
    private String status;
    private Contract contract;
    private Customers customer;
}
