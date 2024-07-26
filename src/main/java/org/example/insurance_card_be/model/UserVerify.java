package org.example.insurance_card_be.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVerify {
    String name;
    String email;
    String code;

}
