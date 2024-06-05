package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notifications {
    private int notificationID;
    private int userID;
    private String message;
    private Date createdDate;
    private boolean isRead;
}
