<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        request.getRequestDispatcher("/views/homepage/home.jsp").forward(request, response);
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
    <title>Create Customer</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
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

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .animate-fadeIn {
            animation: fadeIn 0.5s ease-out;
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
<div class="container animate-fadeIn">
    <h2><i class="fas fa-user-plus"></i> Create Customer</h2>
    <form action="${pageContext.request.contextPath}/customer-create" method="post" id="customerForm">
        <div class="form-group">
            <label for="username"><i class="fas fa-user"></i> Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password"><i class="fas fa-lock"></i> Password:</label>
            <input type="password" id="password" name="password" required>
            <span class="show-password" onclick="togglePassword()"><i class="fas fa-eye"></i> Show Password</span>
        </div>
        <div class="form-group">
            <label for="firstName"><i class="fas fa-user-tag"></i> First Name:</label>
            <input type="text" id="firstName" name="firstName" required>
        </div>
        <div class="form-group">
            <label for="lastName"><i class="fas fa-user-tag"></i> Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>
        </div>
        <div class="form-group">
            <label for="fullName"><i class="fas fa-user-circle"></i> Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>
        <div class="form-group">
            <label for="birthDate"><i class="fas fa-birthday-cake"></i> Birth Date:</label>
            <input type="text" id="birthDate" name="birthDate" required>
        </div>
        <div class="form-group">
            <label for="mobile"><i class="fas fa-mobile-alt"></i> Mobile:</label>
            <input type="text" id="mobile" name="mobile" required>
        </div>
        <div class="form-group">
            <label for="email"><i class="fas fa-envelope"></i> Email:</label>
            <input type="email" id="email" name="email" required>
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
            <input type="hidden" name="hidden_tinh" id="hidden_tinh">
            <input type="hidden" name="hidden_quan" id="hidden_quan">
            <input type="hidden" name="hidden_phuong" id="hidden_phuong">
        </div>
        <div class="form-group">
            <label for="gender"><i class="fas fa-venus-mars"></i> Gender:</label>
            <select id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Create</button>
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
                    $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                });
                $("#tinh").change(function (e) {
                    var idtinh = $(this).val();
                    $("#hidden_tinh").val($("#tinh option:selected").text());
                    $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                        if (data_quan.error == 0) {
                            $("#quan").html('<option value="0">Quận Huyện</option>');
                            $("#phuong").html('<option value="0">Phường Xã</option>');
                            $.each(data_quan.data, function (key_quan, val_quan) {
                                $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                            });
                            $("#quan").change(function (e) {
                                var idquan = $(this).val();
                                $("#hidden_quan").val($("#quan option:selected").text());
                                $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                    if (data_phuong.error == 0) {
                                        $("#phuong").html('<option value="0">Phường Xã</option>');
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