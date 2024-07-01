package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Staff {
    private int staffID;
    private int userID;
    private String position;
    private String department;
}
