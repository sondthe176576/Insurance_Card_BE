<%--
  Created by IntelliJ IDEA.
  User: 09114
  Date: 5/28/2024
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Account</title>
    <style>
        /* Your CSS styling here */
    </style>
</head>
<body>

<h1>Create Account</h1>

<div class="form-container">
    <form action="createAccount" method="POST">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="${sessionScope.customerUsername}" required readonly>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <button type="submit">Save</button>
        </div>
    </form>
</div>

</body>
</html>
