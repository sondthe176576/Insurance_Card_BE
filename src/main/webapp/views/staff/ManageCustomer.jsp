<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/includes/header.jsp" />

<html>
<head>
    //
    <title>Manage Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .button {
            display: inline-block;
            width: 120px; /* Đặt chiều rộng cố định cho các nút */
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button-create {
            background-color: #28a745;
        }
        .button-create:hover {
            background-color: #218838;
        }
        .button-container {
            display: flex;
            gap: 10px;
        }
        form {
            margin: 0; /* Đảm bảo form không có margin */
        }
    </style>
</head>
<body>

<h1>Manage Customer</h1>

<div style="text-align: center;">
    <button onclick="addCustomer()">Add Cusomer</button>
</div>
<form action="/customer-staff?action=search" method="POST">
    <input type="text" name="keyword" placeholder="Nhap vao name cua san pham"/>
    <input type="submit" value="Search"/>
</form>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${sessionScope.listCustomer}" var="c">
        <tr>
            <td>${c.userID}</td>
            <td>${c.username}</td>
            <td>${c.address}</td>
            <td>${c.mobile}</td>
            <td>${c.email}</td>
            <td>
                <div class="button-container">
                    <a href="/viewCustomer?id=${c.userID}" class="button">Update</a>
                    <a href="/viewCustomerInfo?id=${c.userID}" class="button">View Info</a>
                    <form action="customer-staff?action=delete" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${c.userID}" />
                        <button type="button" onclick="deleteCustomer(this)" class="button">Delete</button>
                    </form>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>
<form action="customer-staff?action=insert" id="formAddEdit" method="post" style="display: none">
    <h1>Form Add Cusomer</h1>
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div class="form-group">
        <label for="mobile">Mobile:</label>
        <input type="text" id="mobile" name="mobile" required>
    </div>
    <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
    </div>
    <div class="form-group">
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required>
    </div>
    <div class="form-group">
        <label for="gender">Gender:</label>
        <input type="text" id="gender" name="gender" required>
    </div>
    <div class="form-group">
        <button onclick="addCustomer()" type="submit">Next</button>
    </div>
</form>


<jsp:include page="/views/includes/footer.jsp" />
</body>
<script>
    function deleteCustomer(e){
        if (confirm('Are you sure you want to delete this customer?')) {
            e.closest('form').submit();
        }
    }
</script>
<script>
    function addCustomer(){
        displayForm();
    }
    function displayForm(){

        let form = document.querySelector('#formAddEdit');
        if(form.style.display === 'none') {
            form.style.display = 'block';
        }else {
            form.style.display = 'none';
        }
    }
</script>
</html>
