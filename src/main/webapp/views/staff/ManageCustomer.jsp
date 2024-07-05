<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/3/2024
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
---%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Customer</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listAccident.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listHeader.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- Thiết lập biến để nhận diện trang hiện tại --%>
<c:set var="page" value="accidents"/>

<!-- Include header -->
<jsp:include page="/views/includes/header_list.jsp"/>
<!-- End of header -->

<!-- Include sidebar -->
<jsp:include page="/views/includes/sidebar.jsp"/>
<!-- End of sidebar -->

<!-- Main Content -->
<div class="main-content">
    <div class="container mt-5">
        <div class="card p-4 shadow-sm">
            <h2 class="text-center mb-4 mt-4">Customer Management</h2>
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


            <table class="table table-hover mt-4">
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
            <!-- Pagination -->
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
    </div>
</div>
<!-- End of Main Content -->
</body>
</html>