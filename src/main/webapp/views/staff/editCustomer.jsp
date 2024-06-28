<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Edit Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .form-container {
            max-width: 600px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 32px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #2980b9;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-submit, .btn-reset {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
        }
        .btn-reset {
            background-color: #e74c3c;
        }
        .btn-submit:hover {
            background-color: #2980b9;
        }
        .btn-reset:hover {
            background-color: #c0392b;
        }
        .form-group .show-password {
            display: inline-block;
            margin-top: 10px;
            cursor: pointer;
            color: #2980b9;
        }
        .css_select_div {
            text-align: center;
        }
        .css_select {
            display: inline-table;
            width: 30%;
            padding: 5px;
            margin: 5px 2%;
            border: solid 1px #ccc;
            border-radius: 5px;
        }
    </style>
    <script src="https://esgoo.net/scripts/jquery.js"></script>
</head>
<body>
<div class="form-container">
    <h2>Edit Customer</h2>
    <form id="editCustomerForm" method="post" action="${pageContext.request.contextPath}/customer-edit">
        <input type="hidden" name="userID" value="${customer.userID}" />
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${customer.username}" required />
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="${customer.password}" required />
            <span class="show-password" onclick="togglePassword()">Show Password</span>
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" value="${customer.firstName}" required />
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="${customer.lastName}" required />
        </div>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="${customer.fullName}" required />
        </div>
        <div class="form-group">
            <label for="birthDate">Birth Date:</label>
            <input type="date" id="birthDate" name="birthDate" value="<fmt:formatDate value='${customer.birthDate}' pattern='yyyy-MM-dd'/>" required />
        </div>
        <div class="form-group">
            <label for="mobile">Mobile:</label>
            <input type="text" id="mobile" name="mobile" value="${customer.mobile}" required />
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${customer.email}" required />
        </div>
        <div class="form-group">
            <label for="hidden_tinh">Address:</label>
            <div class="css_select_div">
                <select class="css_select" id="tinh" name="tinh" title="Chọn Tỉnh Thành">
                    <option value="0">Tỉnh Thành</option>
                </select>
                <select class="css_select" id="quan" name="quan" title="Chọn Quận Huyện">
                    <option value="0">Quận Huyện</option>
                </select>
                <select class="css_select" id="phuong" name="phuong" title="Chọn Phường Xã">
                    <option value="0">Phường Xã</option>
                </select>
            </div>
            <input type="hidden" name="hidden_tinh" id="hidden_tinh" value="${customer.province}">
            <input type="hidden" name="hidden_quan" id="hidden_quan" value="${customer.district}">
            <input type="hidden" name="hidden_phuong" id="hidden_phuong" value="${customer.country}">
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="Male" ${customer.gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${customer.gender == 'Female' ? 'selected' : ''}>Female</option>
            </select>
        </div>
        <button type="submit" class="btn-submit">Update</button>
        <button type="reset" class="btn-reset">Reset</button>
    </form>
</div>
<script>
    function togglePassword() {
        var passwordField = document.getElementById("password");
        var showPasswordText = document.querySelector(".show-password");
        if (passwordField.type === "password") {
            passwordField.type = "text";
            showPasswordText.textContent = "Hide Password";
        } else {
            passwordField.type = "password";
            showPasswordText.textContent = "Show Password";
        }
    }

    $(document).ready(function () {
        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
            if (data_tinh.error == 0) {
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                });
                $("#tinh").val('${customer.province}');
                loadDistricts();
            }
        });

        function loadDistricts() {
            var idtinh = $("#tinh").val();
            if (idtinh) {
                $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                    if (data_quan.error == 0) {
                        $("#quan").html('<option value="0">Quận Huyện</option>');
                        $("#phuong").html('<option value="0">Phường Xã</option>');
                        $.each(data_quan.data, function (key_quan, val_quan) {
                            $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                        });
                        $("#quan").val('${customer.district}');
                        loadWards();
                    }
                });
            }
        }

        function loadWards() {
            var idquan = $("#quan").val();
            if (idquan) {
                $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                    if (data_phuong.error == 0) {
                        $("#phuong").html('<option value="0">Phường Xã</option>');
                        $.each(data_phuong.data, function (key_phuong, val_phuong) {
                            $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                        });
                        $("#phuong").val('${customer.country}');
                        $("#hidden_tinh").val($("#tinh option:selected").text());
                        $("#hidden_quan").val($("#quan option:selected").text());
                        $("#hidden_phuong").val($("#phuong option:selected").text());
                    }
                });
            }
        }

        $("#tinh").change(function () {
            loadDistricts();
        });

        $("#quan").change(function () {
            loadWards();
        });

        $("#phuong").change(function () {
            $("#hidden_phuong").val($("#phuong option:selected").text());
        });
    });
</script>
</body>
</html>
