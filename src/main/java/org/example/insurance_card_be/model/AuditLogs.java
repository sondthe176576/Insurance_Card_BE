package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuditLogs {
    private int logID;
    private int userID;
    private String action;
    private Date actionDate;
    private String details;
}
