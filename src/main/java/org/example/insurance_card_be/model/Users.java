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
    private String role;
    private String email;
    private String mobile;
    private String fullName;
    private String gender;
    private int province;
    private int district;
    private int country;
    private String firstName;
    private String lastName;
    private String birthDate;
}
