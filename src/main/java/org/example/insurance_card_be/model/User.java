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

    // getters and setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;

    private int id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String address;
    private String role;
    private String fullname;
    private String gender;

    public User() {
    }

    public User(int id, String username, String password, String email, String phone, String address, String role, String fullname, String gender){
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.fullname = fullname;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;

    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

    public  void setGender (String gender){

        this.gender = gender;
    }

}
