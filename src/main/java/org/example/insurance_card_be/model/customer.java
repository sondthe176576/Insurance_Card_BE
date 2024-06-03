package org.example.insurance_card_be.model;

import java.util.Date;

public class customer {
    private int customerId;
    private int userId;
    private String personalInfo;
    private String fullName;
    private int accidentId;
    private String description;
    private Date date;

    public customer(int customerId, int userId, String personalInfo, String fullName, int accidentId, String description, Date date) {
        this.customerId = customerId;
        this.userId = userId;
        this.personalInfo = personalInfo;
        this.fullName = fullName;
        this.accidentId = accidentId;
        this.description = description;
        this.date = date;
    }

    // Getters and setters
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPersonalInfo() {
        return personalInfo;
    }

    public void setPersonalInfo(String personalInfo) {
        this.personalInfo = personalInfo;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getAccidentId() {
        return accidentId;
    }

    public void setAccidentId(int accidentId) {
        this.accidentId = accidentId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Customer [customerId=" + customerId + ", userId=" + userId + ", personalInfo=" + personalInfo
                + ", fullName=" + fullName + ", accidentId=" + accidentId + ", description=" + description + ", date="
                + date + "]";
    }
}
