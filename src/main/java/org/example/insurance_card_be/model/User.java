package org.example.insurance_card_be.model;

public class User {
    private int userID;
    private String username;
    private String password;
    private int role;
    private String email;
    private String mobile;
    private String address;
    private String fullname;
    private String gender;

    public User(int anInt, String string, String rsString, int rsInt, String s, String string1, String rsString1, String s1, String string2) {
    }

    public User(int userID, String username, String password, int role, String email, String mobile, String address, String fullname)
    {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
        this.fullname = fullname;
    }

    // getters and setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender){
        this.gender = gender;
    }

}
