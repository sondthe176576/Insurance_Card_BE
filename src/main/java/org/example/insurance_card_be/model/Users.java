package org.example.insurance_card_be.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {
    private int userID;
    private String username;
    private String password;
    private int role;
    private String email;
    private String mobile;
    private String address;
    private String fullName;
    private String gender;
}
