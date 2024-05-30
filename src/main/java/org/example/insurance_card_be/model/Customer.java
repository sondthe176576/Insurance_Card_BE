package org.example.insurance_card_be.model;

public class Customer {
    private String email;
    private String fullName;
    private String dob;
    private String gender;
    private String address;
    private String job;
    private String company;
    private String cardNumber;
    private String issueDate;
    private String expiryDate;

    // Constructor
    public Customer(String email, String fullName, String dob, String gender, String address, String job, String company, String cardNumber, String issueDate, String expiryDate) {
        this.email = email;
        this.fullName = fullName;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.job = job;
        this.company = company;
        this.cardNumber = cardNumber;
        this.issueDate = issueDate;
        this.expiryDate = expiryDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public String getDob() {
        return dob;
    }

    public String getGender() {
        return gender;
    }

    public String getAddress() {
        return address;
    }

    public String getJob() {
        return job;
    }

    public String getCompany() {
        return company;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getIssueDate() {
        return issueDate;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

}
