<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --background-color: #ecf0f1;
            --text-color: #34495e;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: var(--secondary-color);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--secondary-color);
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"],
        select {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        input[type="date"]:focus,
        select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }

        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #2980b9;
        }

        .btn-reset {
            background-color: var(--accent-color);
            color: #fff;
        }

        .btn-reset:hover {
            background-color: #c0392b;
        }

        .show-password {
            display: inline-block;
            margin-top: 0.5rem;
            color: var(--primary-color);
            cursor: pointer;
        }

        .address-selects {
            display: flex;
            justify-content: space-between;
            gap: 1rem;
        }

        .address-selects select {
            flex: 1;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .address-selects {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2><i class="fas fa-user-edit"></i> Edit Customer</h2>
    <form id="editCustomerForm" method="post" action="${pageContext.request.contextPath}/customer-edit">
        <input type="hidden" name="userID" value="${customer.userID}" />
        <div class="form-group">
            <label for="username" style=""><i class="fas fa-user"></i> Username:</label>
            <input type="text" id="username" name="username" value="${customer.username}" required>
        </div>
        <div class="form-group">
            <label for="password"><i class="fas fa-lock"></i> Password:</label>
            <input type="password" id="password" name="password" value="${customer.password}" required>
            <span class="show-password" onclick="togglePassword()"><i class="fas fa-eye"></i> Show Password</span>
        </div>
        <div class="form-group">
            <label for="firstName"><i class="fas fa-user-tag"></i> First Name:</label>
            <input type="text" id="firstName" name="firstName" value="${customer.firstName}" required>
        </div>
        <div class="form-group">
            <label for="lastName"><i class="fas fa-user-tag"></i> Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="${customer.lastName}" required>
        </div>
        <div class="form-group">
            <label for="fullName"><i class="fas fa-user-circle"></i> Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="${customer.fullName}" required>
        </div>
        <div class="form-group">
            <label for="birthDate"><i class="fas fa-birthday-cake"></i> Birth Date:</label>
            <input type="text" id="birthDate" name="birthDate" value="<fmt:formatDate value='${customer.birthDate}' pattern='yyyy-MM-dd'/>" required>
        </div>
        <div class="form-group">
            <label for="mobile"><i class="fas fa-mobile-alt"></i> Mobile:</label>
            <input type="text" id="mobile" name="mobile" value="${customer.mobile}" required>
        </div>
        <div class="form-group">
            <label for="email"><i class="fas fa-envelope"></i> Email:</label>
            <input type="email" id="email" name="email" value="${customer.email}" required>
        </div>
        <div class="form-group">
            <label><i class="fas fa-map-marker-alt"></i> Address:</label>
            <div class="address-selects">
                <select id="tinh" name="tinh" title="Chọn Tỉnh Thành">
                    <option value="0">Tỉnh Thành</option>
                </select>
                <select id="quan" name="quan" title="Chọn Quận Huyện">
                    <option value="0">Quận Huyện</option>
                </select>
                <select id="phuong" name="phuong" title="Chọn Phường Xã">
                    <option value="0">Phường Xã</option>
                </select>
            </div>
            <input type="hidden" name="hidden_tinh" id="hidden_tinh" value="${customer.province}">
            <input type="hidden" name="hidden_quan" id="hidden_quan" value="${customer.district}">
            <input type="hidden" name="hidden_phuong" id="hidden_phuong" value="${customer.country}">
        </div>
        <div class="form-group">
            <label for="gender"><i class="fas fa-venus-mars"></i> Gender:</label>
            <select id="gender" name="gender" required>
                <option value="Male" ${customer.gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${customer.gender == 'Female' ? 'selected' : ''}>Female</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Update</button>
        <button type="reset" class="btn btn-reset"><i class="fas fa-redo"></i> Reset</button>
    </form>
</div>

<script>
    function togglePassword() {
        var passwordField = document.getElementById("password");
        var showPasswordText = document.querySelector(".show-password");
        if (passwordField.type === "password") {
            passwordField.type = "text";
            showPasswordText.innerHTML = '<i class="fas fa-eye-slash"></i> Hide Password';
        } else {
            passwordField.type = "password";
            showPasswordText.innerHTML = '<i class="fas fa-eye"></i> Show Password';
        }
    }

    flatpickr("#birthDate", {
        dateFormat: "Y-m-d",
        maxDate: "today"
    });

    $(document).ready(function () {
        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
            if (data_tinh.error == 0) {
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    var selected = val_tinh.full_name === '${customer.province}' ? ' selected' : '';
                    $("#tinh").append('<option value="' + val_tinh.id + '"' + selected + '>' + val_tinh.full_name + '</option>');
                });
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
                            var selected = val_quan.full_name === '${customer.district}' ? ' selected' : '';
                            $("#quan").append('<option value="' + val_quan.id + '"' + selected + '>' + val_quan.full_name + '</option>');
                        });
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
                            var selected = val_phuong.full_name === '${customer.country}' ? ' selected' : '';
                            $("#phuong").append('<option value="' + val_phuong.id + '"' + selected + '>' + val_phuong.full_name + '</option>');
                        });
                        updateHiddenFields();
                    }
                });
            }
        }

        function updateHiddenFields() {
            $("#hidden_tinh").val($("#tinh option:selected").text());
            $("#hidden_quan").val($("#quan option:selected").text());
            $("#hidden_phuong").val($("#phuong option:selected").text());
        }

        $("#tinh").change(function () {
            loadDistricts();
        });

        $("#quan").change(function () {
            loadWards();
        });

        $("#phuong").change(function () {
            updateHiddenFields();
        });
    });
</script>
</body>
</html>