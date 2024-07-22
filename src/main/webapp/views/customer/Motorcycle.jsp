<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%@ page import="org.example.insurance_card_be.model.Motorcycles" %>

<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login");
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    int customerID = userDAO.getCustomerIDByUserID(loggedInUser.getUserID());
    Motorcycles motorcycle = userDAO.getMotorcycleByCustomerID(customerID);
    if (userFromDB == null) {
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f0f0; }
        .form-container { background-color: #ffffff; border-radius: 10px; box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1); padding: 30px; margin-top: 50px; }
        .form-control:focus { box-shadow: none; border-color: #BA68C8; }
        .profile-button { background: rgb(99, 39, 120); box-shadow: none; border: none; }
        .profile-button:hover, .profile-button:focus, .profile-button:active { background: #682773; box-shadow: none; }
        .back:hover { color: #682773; cursor: pointer; }
        .labels { font-size: 11px; }
        .add-experience:hover { background: #BA68C8; color: #fff; cursor: pointer; border: solid 1px #BA68C8; }

        .css_select_div {
            display: flex;
            gap: 10px; /* Adjust the gap between the selects as needed */
        }

        .css_select {
            flex: 1; /* Allows the selects to grow and fill the container */
            min-width: 100px; /* Ensures a minimum width for the selects */
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <form action="${pageContext.request.contextPath}/motorcycle" method="post">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-container">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                                <span class="font-weight-bold"><%= userFromDB.getFullName() %></span>
                                <span> </span>
                            </div>
                        </div>
                        <div class="col-md-5 border-right">
                            <p class="text-black-50" name="username"><%= userFromDB.getUsername() %></p>
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile Settings</h4>
                                </div>
                                <div class="row mt-2">
                                <hr class="my-6">
                                <h2 class="text-2xl font-bold mb-6">Additional Information</h2>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Personal Info</label>
                                        <input type="text" name="personal_info" class="form-control" placeholder="Name for your motorbike information" required>
                                    </div>
                                </div>
                                <hr class="my-6">
                                <h2 class="text-2xl font-bold mb-6">Motorcycle Information</h2>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">License Plate</label>
                                        <input type="text" name="license_plate" class="form-control" placeholder="License Plate" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Brand</label>
                                        <input type="text" name="brand" class="form-control" placeholder="Brand" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Model</label>
                                        <input type="text" name="model" class="form-control" placeholder="Model" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Frame Number</label>
                                        <input type="text" name="frame_number" class="form-control" placeholder="Frame Number"  required>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Engine Number</label>
                                        <input type="text" name="engine_number" class="form-control" placeholder="Engine Number" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Year of Manufacture</label>
                                        <input type="number" name="year_of_manufacture" class="form-control" placeholder="Year of Manufacture" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Color</label>
                                        <input type="text" name="color" class="form-control" placeholder="Color" required>
                                    </div>
                                </div>

                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit">Save</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-3 py-5">
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
