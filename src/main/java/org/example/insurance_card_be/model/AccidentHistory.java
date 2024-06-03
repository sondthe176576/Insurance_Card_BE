package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccidentHistory {
    private int customerId;
    private int userId;
    private String personalInfo;
    private String fullName;
    private int accidentId;
    private String description;
    private Date date;
}
