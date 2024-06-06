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
        <th style="display: none">username</th>
        <th style="display: none">PassWord</th>
        <th>Address</th>
        <th>FullName</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${sessionScope.listCustomer}" var="c">
        <tr>
            <td name="userID">${c.userID}</td>
            <td name="username"style="display: none">${c.username} </td>
            <td name="password"style="display: none">${c.password}</td>
            <td name="address">${c.address}</td>
            <td name="fullName">${c.fullName}</td>
            <td name="mobile">${c.mobile}</td>
            <td name="email">${c.email}</td>
            <td>${c.gender}</td>

            <td>
                <div class="button-container">
                    <a href="#" onclick="editCustomer(this)" class="button">Edit</a>
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
    <input type="hidden" name="userID" value="0">
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
    function editCustomer(e) {
        displayForm();
        let tr = e.closest('tr');
        let userID = tr.querySelector('td[name="userID"]').innerHTML;
        let username = tr.querySelector('td[name="username"]').innerHTML;
        let password = tr.querySelector('td[name="password"]').innerHTML;
        let address = tr.querySelector('td[name="address"]').innerHTML;
        let fullName = tr.querySelector('td[name="fullName"]').innerHTML;
        let mobile = tr.querySelector('td[name="mobile"]').innerHTML;
        let email = tr.querySelector('td[name="email"]').innerHTML;

        let form = document.querySelector('#formAddEdit');
        form.querySelector('input[name="username"]').value = username;
        form.querySelector('input[name="password"]').value = password;
        form.querySelector('input[name="address"]').value = address;
        form.querySelector('input[name="fullName"]').value = fullName;
        form.querySelector('input[name="mobile"]').value = mobile;
        form.querySelector('input[name="email"]').value = email;
        form.querySelector('input[name="id"]').value = userID;
        form.action = "customer-staff?action=update";

    }
</script>
</html>
