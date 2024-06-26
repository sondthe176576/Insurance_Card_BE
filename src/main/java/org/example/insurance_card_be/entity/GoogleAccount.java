package org.example.insurance_card_be.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class GoogleAccount {
    private String  id, email, name, first_name, given_name, family_name, picture;
    private boolean verified_email;

}
