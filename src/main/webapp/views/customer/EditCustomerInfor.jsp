<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>

<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByName(loggedInUser.getUsername());
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
    <form action="${pageContext.request.contextPath}/editinfor" method="post">
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
                                        <input type="text" name="first_name" class="form-control" placeholder="First Name" value="<%= userFromDB.getFirstName() %>">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Last Name</label>
                                        <input type="text" name="last_name" class="form-control" placeholder="Last Name" value="<%= userFromDB.getLastName() %>">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Full Name</label>
                                        <input type="text" name="full_name" class="form-control" placeholder="Full Name" value="<%= userFromDB.getFullName() %>">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Mobile Number</label>
                                        <input type="text" name="mobile" class="form-control" placeholder="Mobile Number" value="<%= userFromDB.getMobile() %>">
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">BirthDate</label>
                                        <input type="date" name="birthdate" class="form-control" placeholder="BirthDate" value="<%= userFromDB.getBirthDate() %>">
                                    </div>
                                    <div class="css_select_div">
                                        <select class="css_select" id="tinh" name="tinh" title="Choose Province" required>
                                            <option value="0">Province</option>
                                        </select>
                                        <select class="css_select" id="quan" name="quan" title="Choose District" required>
                                            <option value="0">District</option>
                                        </select>
                                        <select class="css_select" id="phuong" name="phuong" title="Choose County" required>
                                            <option value="0">Country</option>
                                        </select>
                                    </div>

                                    <input type="hidden" name="tinh" id="hidden_tinh">
                                    <input type="hidden" name="quan" id="hidden_quan">
                                    <input type="hidden" name="phuong" id="hidden_phuong">

                                    <script src="https://esgoo.net/scripts/jquery.js"></script>
                                    <script>
                                        $(document).ready(function () {
                                            $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
                                                if (data_tinh.error == 0) {
                                                    $.each(data_tinh.data, function (key_tinh, val_tinh) {
                                                        $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                                                    });
                                                    $("#tinh").change(function (e) {
                                                        var idtinh = $(this).val();
                                                        $("#hidden_tinh").val($("#tinh option:selected").text());
                                                        $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                                                            if (data_quan.error == 0) {
                                                                $("#quan").html('<option value="0">District</option>');
                                                                $("#phuong").html('<option value="0">Country</option>');
                                                                $.each(data_quan.data, function (key_quan, val_quan) {
                                                                    $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                                                                });
                                                                $("#quan").change(function (e) {
                                                                    var idquan = $(this).val();
                                                                    $("#hidden_quan").val($("#quan option:selected").text());
                                                                    $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                                                        if (data_phuong.error == 0) {
                                                                            $("#phuong").html('<option value="0">Country</option>');
                                                                            $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                                                                $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                                                                            });
                                                                            $("#phuong").change(function (e) {
                                                                                $("#hidden_phuong").val($("#phuong option:selected").text());
                                                                            });
                                                                        }
                                                                    });
                                                                });
                                                            }
                                                        });
                                                    });
                                                }
                                            });
                                        });
                                    </script>
                                    <div class="col-md-12">
                                        <label class="labels">Email ID</label>
                                        <input type="text" name="email_id" class="form-control" placeholder="Email ID" value="<%= userFromDB.getEmail() %>">
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <select name="gender" class="form-control">
                                            <option value="Male" <%= "Male".equals(userFromDB.getGender()) ? "selected" : "" %>>Male</option>
                                            <option value="Female" <%= "Female".equals(userFromDB.getGender()) ? "selected" : "" %>>Female</option>
                                        </select>
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
