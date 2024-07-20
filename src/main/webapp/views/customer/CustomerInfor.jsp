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
    String personalinfor = userDAO.getNameofPersonalInfor(loggedInUser.getUserID());
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

        .profile-button a {
            color: white; /* Màu chữ trắng */
            text-decoration: none; /* Xóa gạch chân */
        }

        .error{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <form action="${pageContext.request.contextPath}/customerinfo" method="post">
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
                                    <div class="col-md-6">
                                        <label class="labels">First Name</label>
                                        <input type="text" name="first_name" class="form-control" placeholder="First Name" value="<%= userFromDB.getFirstName() %>" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Last Name</label>
                                        <input type="text" name="last_name" class="form-control" placeholder="Last Name" value="<%= userFromDB.getLastName() %>" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Full Name</label>
                                        <input type="text" name="full_name" class="form-control" placeholder="Full Name" value="<%= userFromDB.getFullName() %>" readonly>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Mobile Number</label>
                                        <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" value="<%= userFromDB.getMobile() %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">BirthDate</label>
                                        <input type="date" name="birthdate" class="form-control" placeholder="BirthDate" value="<%= userFromDB.getBirthDate() %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Address</label>
                                        <input type="text" name="address" class="form-control" placeholder="Address" value="<%= userFromDB.getProvince() %>, <%=userFromDB.getDistrict()%>, <%=userFromDB.getCountry()%>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Email ID</label>
                                        <input type="text" name="email_id" class="form-control" placeholder="Email ID" value="<%= userFromDB.getEmail() %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <select name="gender" class="form-control" readonly>
                                            <option value="Male" <%= "Male".equals(userFromDB.getGender()) ? "selected" : "" %>>Male</option>
                                            <option value="Female" <%= "Female".equals(userFromDB.getGender()) ? "selected" : "" %>>Female</option>
                                        </select>
                                    </div>
                                </div>
                                <hr class="my-6">
                                <h2 class="text-2xl font-bold mb-6">Additional Information</h2>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Personal Info</label>
                                        <input type="text" name="personal_info" class="form-control" value="<%= personalinfor %>" readonly>
                                    </div>
                                </div>
                                <hr class="my-6">
                                <h2 class="text-2xl font-bold mb-6">Motorcycle Information</h2>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">License Plate</label>
                                        <input type="text" name="license_plate" class="form-control" value="<%= motorcycle != null && motorcycle.getLicensePlate() != null ? motorcycle.getLicensePlate() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Brand</label>
                                        <input type="text" name="brand" class="form-control" value="<%= motorcycle != null && motorcycle.getBrand() != null ? motorcycle.getBrand() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Model</label>
                                        <input type="text" name="model" class="form-control" value="<%= motorcycle != null && motorcycle.getModel() != null ? motorcycle.getModel() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Frame Number</label>
                                        <input type="text" name="frame_number" class="form-control" value="<%= motorcycle != null && motorcycle.getFrameNumber() != null ? motorcycle.getFrameNumber() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Engine Number</label>
                                        <input type="text" name="engine_number" class="form-control" value="<%= motorcycle != null && motorcycle.getEngineNumber() != null ? motorcycle.getEngineNumber() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Year of Manufacture</label>
                                        <input type="number" name="year_of_manufacture" class="form-control" value="<%= motorcycle != null && motorcycle.getYearOfManufacture()!= 0 ? motorcycle.getYearOfManufacture() : 0 %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Color</label>
                                        <input type="text" name="color" class="form-control" value="<%= motorcycle != null && motorcycle.getColor() != null ? motorcycle.getColor() : "" %>" readonly>
                                    </div>
                                </div>

                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit">Edit</button>
                                    <button class="btn btn-primary profile-button"><a href="${pageContext.request.contextPath}/motorcycle">Add Motorcycle Information</a></button>
                                </div>
                                <p class="error">${requestScope.mess}</p>
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
