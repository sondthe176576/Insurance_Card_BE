<%--
  Created by IntelliJ IDEA.
  User: 09114
  Date: 6/7/2024
  Time: 1:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-submit {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        .btn-submit:hover {
            background-color: #2980b9;
        }
        .btn-reset {
            background-color: #e74c3c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
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
<jsp:include page="/views/includes/header.jsp"/>
<jsp:include page="/views/includes/navbar.jsp"/>
<div class="form-container">
    <h2>Edit Customer</h2>
    <form method="post" action="${pageContext.request.contextPath}/customer-staff?action=update">
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
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="${customer.fullName}" required />
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
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${customer.address}" required />
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
</script>
</body>
<jsp:include page="/views/includes/footer.jsp"/>
</html>
