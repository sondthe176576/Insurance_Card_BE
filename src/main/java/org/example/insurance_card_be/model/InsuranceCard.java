package org.example.insurance_card_be.model;

import com.google.gson.Gson;

public class InsuranceCard {
    private String cardNumber;
    private String issueDate;
    private String expiryDate;

    public InsuranceCard(String cardNumber, String issueDate, String expiryDate) {
        this.cardNumber = cardNumber;
        this.issueDate = issueDate;
        this.expiryDate = expiryDate;
    }

    // Getters and setters...

    public String toJson() {
        return new Gson().toJson(this);
    }
}
