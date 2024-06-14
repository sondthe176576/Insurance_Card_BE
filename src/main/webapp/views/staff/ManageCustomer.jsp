<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Manage Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 1200px;
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

        .form-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
            font-size: 24px;
        }

        .filter-form {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .filter-form .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .filter-form label {
            margin-right: 10px;
            color: #2980b9;
            font-weight: bold;
        }

        .filter-form input, .filter-form select {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .filter-form button {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .filter-form button:hover {
            background-color: #2980b9;
        }

        .customer-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .customer-table th, .customer-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .customer-table th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        .customer-table tr:nth-child(even) {
            background-color: #f4f7f6;
        }

        .btn-submit, .btn-view {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }

        .btn-submit:hover, .btn-view:hover {
            background-color: #2980b9;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .pagination a {
            color: #3498db;
            padding: 10px 15px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 5px;
            border-radius: 5px;
        }

        .pagination a.active {
            background-color: #3498db;
            color: white;
            border: 1px solid #3498db;
        }

        .pagination a:hover {
            background-color: #ecf0f1;
        }

        .message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 15px;
            border: 1px solid #d6e9c6;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: bold;
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            display: none; /* Ẩn thông báo mặc định */
        }
    </style>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->

<!-- Form -->
<div class="form-container">
    <h2>Customer Management</h2>
    <h3>List of Customers</h3>

    <!-- Hiển thị thông báo nếu có -->
    <c:if test="${not empty message}">
        <div class="message" id="message">
                ${message}
        </div>
    </c:if>

    <form method="post" class="filter-form" action="${pageContext.request.contextPath}/customer-staff?action=search">
        <div class="form-group">
            <label for="customerNameSearch">Search by Customer Name:</label>
            <input type="text" id="customerNameSearch" name="keyword" value="${param.customerName}" placeholder="Enter customer name"/>
        </div>
        <button type="submit" class="btn-submit">Filter</button>
    </form>
    <button class="btn-submit" onclick="window.location.href='${pageContext.request.contextPath}/customer-staff?action=create'">Create Customer</button>
    <table class="customer-table">
        <thead>
        <tr>
            <th>No</th>
            <th style="display: none">username</th>
            <th style="display: none">PassWord</th>
            <th>FullName</th>
            <th style="display: none">Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th style="display: none">Gender</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.listCustomer}" var="c" varStatus="status">
            <tr>
                <td>${(currentPage-1)*CUSTOMERS_PER_PAGE + status.index + 1}</td>
                <td name="username" style="display: none">${c.username} </td>
                <td name="password" style="display: none">${c.password}</td>
                <td name="fullName">${c.fullName}</td>
                <td name="address"style="display: none" >${c.address}</td>
                <td name="mobile">${c.mobile}</td>
                <td name="email">${c.email}</td>
                <td name="gender" style="display: none">${c.gender}</td>
                <td>
                    <div class="button-container">
                        <a href="${pageContext.request.contextPath}/customer-staff?action=view&userID=${c.userID}" class="btn-view">View Info</a>
                        <form action="${pageContext.request.contextPath}/customer-staff?action=delete" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${c.userID}" />
                            <button type="button" onclick="deleteCustomer(this)" class="btn-submit">Delete</button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="${pageContext.request.contextPath}/customer-staff?page=${i}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/customer-staff?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
<script>
    function deleteCustomer(e){
        if (confirm('Are you sure you want to delete this customer?')) {
            e.closest('form').submit();
        }
    }

    window.onload = function() {
        var messageElement = document.getElementById("message");
        if (messageElement) {
            messageElement.style.display = "block";
            setTimeout(function() {
                messageElement.style.display = "none";
            }, 5000);
        }
    };
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
