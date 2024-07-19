package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Motorcycles {
    private int motorcycleID;
    private int customerID;
    private String licensePlate;
    private String brand;
    private String model;
    private String frameNumber;
    private String engineNumber;
    private int yearOfManufacture;
    private String color;
}
