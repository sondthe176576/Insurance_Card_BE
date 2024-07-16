<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>

<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        response.sendRedirect("login");
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
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
            gap: 10px;
        }

        .css_select {
            flex: 1;
            min-width: 100px;
        }
    </style>
</head>
<body>
<div class="container mx-auto mt-16">
    <form action="${pageContext.request.contextPath}/editinfor" method="post">
        <div class="form-container mx-auto w-full max-w-4xl">
            <div class="flex">
                <div class="w-1/3 border-r-2">
                    <div class="flex flex-col items-center text-center p-3 py-5">
                        <img class="rounded-full mt-5 w-40 h-40" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                        <span class="font-bold text-lg mt-3"><%= userFromDB.getFullName() %></span>
                        <span class="text-gray-500"><%= userFromDB.getEmail() %></span>
                    </div>
                </div>
                <div class="w-2/3 pl-8">
                    <h2 class="text-2xl font-bold mb-6">Profile Settings</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-gray-700">First Name</label>
                            <input type="text" name="first_name" class="form-input mt-1 block w-full" value="<%= userFromDB.getFirstName() %>">
                        </div>
                        <div>
                            <label class="block text-gray-700">Last Name</label>
                            <input type="text" name="last_name" class="form-input mt-1 block w-full" value="<%= userFromDB.getLastName() %>">
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Full Name</label>
                            <input type="text" name="full_name" class="form-input mt-1 block w-full" value="<%= userFromDB.getFullName() %>">
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Mobile Number</label>
                            <input type="text" name="mobile" class="form-input mt-1 block w-full" value="<%= userFromDB.getMobile() %>">
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Birth Date</label>
                            <input type="date" name="birthdate" class="form-input mt-1 block w-full" value="<%= userFromDB.getBirthDate() %>">
                        </div>
                        <div class="css_select_div col-span-2">
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

                        <div class="col-span-2">
                            <label class="block text-gray-700">Email ID</label>
                            <input type="text" name="email_id" class="form-input mt-1 block w-full" value="<%= userFromDB.getEmail() %>">
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Gender</label>
                            <select name="gender" class="form-input mt-1 block w-full">
                                <option value="Male" <%= "Male".equals(userFromDB.getGender()) ? "selected" : "" %>>Male</option>
                                <option value="Female" <%= "Female".equals(userFromDB.getGender()) ? "selected" : "" %>>Female</option>
                            </select>
                        </div>
                    </div>
                    <hr class="my-6">
                    <h2 class="text-2xl font-bold mb-6">Additional Information</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="col-span-2">
                            <label class="block text-gray-700">Personal Info</label>
                            <input type="text" name="personal_info" class="form-input mt-1 block w-full" placeholder="Personal Info">
                        </div>
                    </div>
                    <hr class="my-6">
                    <h2 class="text-2xl font-bold mb-6">Motorcycle Information</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="col-span-2">
                            <label class="block text-gray-700">License Plate</label>
                            <input type="text" name="license_plate" class="form-input mt-1 block w-full" placeholder="License Plate">
                        </div>
                        <div>
                            <label class="block text-gray-700">Brand</label>
                            <input type="text" name="brand" class="form-input mt-1 block w-full" placeholder="Brand">
                        </div>
                        <div>
                            <label class="block text-gray-700">Model</label>
                            <input type="text" name="model" class="form-input mt-1 block w-full" placeholder="Model">
                        </div>
                        <div>
                            <label class="block text-gray-700">Frame Number</label>
                            <input type="text" name="frame_number" class="form-input mt-1 block w-full" placeholder="Frame Number">
                        </div>
                        <div>
                            <label class="block text-gray-700">Engine Number</label>
                            <input type="text" name="engine_number" class="form-input mt-1 block w-full" placeholder="Engine Number">
                        </div>
                        <div>
                            <label class="block text-gray-700">Year of Manufacture</label>
                            <input type="number" name="year_of_manufacture" class="form-input mt-1 block w-full" placeholder="Year of Manufacture">
                        </div>
                        <div>
                            <label class="block text-gray-700">Color</label>
                            <input type="text" name="color" class="form-input mt-1 block w-full" placeholder="Color">
                        </div>
                    </div>
                    <div class="mt-6 text-center">
                        <button class="btn btn-primary profile-button" type="submit">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script>
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
</body>
</html>