<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
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
    </style>
</head>
<body>
<div class="form-container">
    <h2>Create Customer</h2>
    <form method="post" action="${pageContext.request.contextPath}/customer-staff?action=insert">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required />
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />
            <span class="show-password" onclick="togglePassword()">Show Password</span>
        </div>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required />
        </div>
        <div class="form-group">
            <label for="mobile">Mobile:</label>
            <input type="text" id="mobile" name="mobile" required />
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required />
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required />
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
        </div>
        <button type="submit" class="btn-submit">Create</button>
        <button type="reset" class="btn-reset">Reset</button>
    </form>
</div>
</body>
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
</script>
</html>
