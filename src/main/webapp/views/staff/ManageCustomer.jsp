<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Manage Customer</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
            flex-direction: column;
            margin-bottom: 15px;
            width: 100%;
        }

        .filter-form label {
            margin-bottom: 5px;
            color: #2980b9;
            font-weight: bold;
        }

        .filter-form input, .filter-form select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }

        .filter-form .form-group-lg {
            flex: 1;
            margin-right: 15px;
        }

        .filter-form .form-group-sm {
            flex: 0.5;
            margin-right: 15px;
        }

        .filter-form .form-group-btn {
            flex: 0.2;
            display: flex;
            align-items: flex-end;
        }

        .filter-form button {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
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

        .btn-group .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            margin: 2px;
        }

        .btn-view {
            background-color: #3498db;
            color: white;
        }

        .btn-view:hover {
            background-color: #2980b9;
        }

        .btn-edit {
            background-color: #f39c12;
            color: white;
        }

        .btn-edit:hover {
            background-color: #e67e22;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c0392b;
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
            display: none;
        }
    </style>
    <script src="https://esgoo.net/scripts/jquery.js"></script>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->

<!-- Form -->
<div class="form-container container mt-5">
    <h2>Customer Management</h2>
    <h3>List of Customers</h3>

    <!-- Display message if exists -->
    <c:if test="${not empty message}">
        <div class="alert alert-success" id="message">
                ${message}
        </div>
    </c:if>

    <form method="get" class="filter-form row g-3" action="${pageContext.request.contextPath}/customer-manage" onsubmit="return validateForm()">
        <div class="col-md-4 form-group form-group-lg">
            <label for="searchType" class="form-label">Search by:</label>
            <select id="searchType" name="searchType" class="form-select">
                <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>Name</option>
                <option value="email" ${param.searchType == 'email' ? 'selected' : ''}>Email</option>
                <option value="phone" ${param.searchType == 'phone' ? 'selected' : ''}>Phone</option>
            </select>
        </div>
        <div class="col-md-4 form-group form-group-lg">
            <label for="searchKeyword" class="form-label">Keyword:</label>
            <input type="text" id="searchKeyword" name="keyword" value="${param.keyword}" placeholder="Enter search keyword" class="form-control"/>
        </div>
        <div class="col-md-4 form-group form-group-sm">
            <label for="genderFilter" class="form-label">Gender:</label>
            <select id="genderFilter" name="genderFilter" class="form-select">
                <option value="" ${param.genderFilter == '' ? 'selected' : ''}>All</option>
                <option value="Male" ${param.genderFilter == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${param.genderFilter == 'Female' ? 'selected' : ''}>Female</option>
            </select>
        </div>
        <div class="col-md-12 form-group form-group-btn">
            <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Filter</button>
        </div>
    </form>

    <button class="btn btn-success mt-4" onclick="window.location.href='${pageContext.request.contextPath}/customer-create'"><i class="bi bi-plus-circle"></i> Create Customer</button>
    <table class="table table-bordered mt-4">
        <thead class="table-dark">
        <tr>
            <th>No</th>
            <th style="display: none">Username</th>
            <th style="display: none">Password</th>
            <th>Full Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Gender</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.listCustomer}" var="c" varStatus="status">
            <tr data-id="${c.userID}" data-username="${c.username}" data-password="${c.password}"
                data-fullname="${c.fullName}" data-mobile="${c.mobile}" data-email="${c.email}"
                data-gender="${c.gender}" data-birthdate="<fmt:formatDate value='${c.birthDate}' pattern='yyyy-MM-dd'/>"
                data-province="${c.province}" data-district="${c.district}" data-country="${c.country}">
                <td>${status.index + 1}</td>
                <td name="username" style="display: none">${c.username}</td>
                <td name="password" style="display: none">${c.password}</td>
                <td name="fullName">${c.fullName}</td>
                <td name="mobile">${c.mobile}</td>
                <td name="email">${c.email}</td>
                <td name="address">${c.province}, ${c.district}, ${c.country}</td>
                <td name="gender">${c.gender}</td>
                <td>
                    <div class="btn-group" role="group">
                        <a href="${pageContext.request.contextPath}/customer-view?userID=${c.userID}" class="btn btn-view"><i class="bi bi-eye"></i></a>
                        <a href="${pageContext.request.contextPath}/customer-edit?userID=${c.userID}" class="btn btn-edit"><i class="bi bi-pencil"></i></a>
                        <form action="${pageContext.request.contextPath}/customer-delete" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${c.userID}" />
                            <button type="submit" class="btn btn-delete"><i class="bi bi-trash"></i></button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <c:forEach var="i" begin="1" end="${sessionScope.totalPages}">
            <c:choose>
                <c:when test="${i == sessionScope.currentPage}">
                    <a href="${pageContext.request.contextPath}/customer-manage?page=${i}&searchType=${param.searchType}&keyword=${param.keyword}&genderFilter=${param.genderFilter}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/customer-manage?page=${i}&searchType=${param.searchType}&keyword=${param.keyword}&genderFilter=${param.genderFilter}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>

    <div>
        <p>Total customers found: ${sessionScope.totalCustomersFound}</p>
        <p>Total customers in database: ${sessionScope.totalCustomers}</p>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
