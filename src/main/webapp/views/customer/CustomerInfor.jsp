<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%@ page import="org.example.insurance_card_be.model.Customers" %>
<%@ page import="org.example.insurance_card_be.model.Motorcycle" %>

<%
    // Lấy thông tin người dùng từ session (giả sử bạn đã set session từ trước)
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        // Xử lý khi không có thông tin người dùng trong session
        response.sendRedirect("login.jsp"); // Chuyển hướng đến trang login nếu không có thông tin người dùng
        return;
    }

    // Kết nối và lấy thông tin người dùng từ cơ sở dữ liệu
    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        // Xử lý khi không lấy được thông tin người dùng từ cơ sở dữ liệu
        return;
    }

    Customers customerFromDB = (Customers) request.getAttribute("customer");
    Motorcycle motorcycleFromDB = (Motorcycle) request.getAttribute("motorcycle");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
        }
        .form-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 50px;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8;
        }
        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none;
        }
        .profile-button:hover,
        .profile-button:focus,
        .profile-button:active {
            background: #682773;
            box-shadow: none;
        }
        .back:hover {
            color: #682773;
            cursor: pointer;
        }
        .labels {
            font-size: 11px;
        }
        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8;
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
                            <span class="text-black-50"><%= userFromDB.getEmail() %></span>
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile Settings</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-6">
                                        <label class="labels">First Name</label>
                                        <input type="text" class="form-control" placeholder="First Name" value="<%= userFromDB.getFirstName() %>" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Last Name</label>
                                        <input type="text" class="form-control" placeholder="Last Name" value="<%= userFromDB.getLastName() %>" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Full Name</label>
                                        <input type="text" class="form-control" placeholder="Full Name" value="<%= userFromDB.getFullName() %>" readonly>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Mobile Number</label>
                                        <input type="text" class="form-control" placeholder="Mobile Number" value="<%= userFromDB.getMobile() %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">BirthDate</label>
                                        <input type="text" class="form-control" placeholder="BirthDate" value="<%= userFromDB.getBirthDate() %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Address</label>
                                        <input type="text" id="address" class="form-control" placeholder="Address" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Email ID</label>
                                        <input type="text" class="form-control" placeholder="Email ID" value="<%= userFromDB.getEmail() %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <input type="text" class="form-control" placeholder="Gender" value="<%= userFromDB.getGender() %>" readonly>
                                    </div>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Additional Information</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <label class="labels">Personal Info</label>
                                        <input type="text" class="form-control" placeholder="Personal Info" value="<%= customerFromDB != null ? customerFromDB.getPersonalInfo() : "" %>" readonly>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Motorcycle Information</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <label class="labels">License Plate</label>
                                        <input type="text" class="form-control" placeholder="License Plate" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getLicensePlate() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Brand</label>
                                        <input type="text" class="form-control" placeholder="Brand" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getBrand() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Model</label>
                                        <input type="text" class="form-control" placeholder="Model" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getModel() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Frame Number</label>
                                        <input type="text" class="form-control" placeholder="Frame Number" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getFrameNumber() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Engine Number</label>
                                        <input type="text" class="form-control" placeholder="Engine Number" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getEngineNumber() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Year of Manufacture</label>
                                        <input type="text" class="form-control" placeholder="Year of Manufacture" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getYearOfManufacture() : "" %>" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Color</label>
                                        <input type="text" class="form-control" placeholder="Color" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getColor() : "" %>" readonly>
                                    </div>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit">Edit Profile</button>
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
<script src="https://esgoo.net/scripts/jquery.js"></script>
<script>
    $(document).ready(function() {
        var provinceId = "<%= userFromDB.getProvince() %>";
        var districtId = "<%= userFromDB.getDistrict() %>";
        var wardId = "<%= userFromDB.getCountry() %>";

        console.log('Fetching ward with ID:', wardId);
        $.getJSON('https://esgoo.net/api-tinhthanh/5/' + wardId + '.htm', function(data) {
            console.log('Ward API response:', data);
            if (data.error == 0) {
                $('#address').val(data.data.full_name);
            } else {
                console.error('Error fetching ward:', data.error_text);
            }
        });
    });
</script>
</body>
</html>