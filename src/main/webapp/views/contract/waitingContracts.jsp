<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/29/2024
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Waiting Contracts</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listHeader.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%-- Thiết lập biến để nhận diện trang hiện tại --%>
<c:set var="page" value="waitingContracts"/>

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
            <h2 class="text-center mb-4 mt-4">List of Waiting Contracts</h2>
            <table class="table table-hover mt-4">
                <thead class="table-dark">
                <tr>
                    <th>No</th>
                    <th>Contract ID</th>
                    <th>Customer ID</th>
                    <th>Contract Info</th>
                    <th>Status</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Insurance Type</th>
                    <th>Coverage</th>
                    <th>Premium</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="contract" items="${waitingContracts}" varStatus="status">
                    <tr>
                        <td><c:out value="${status.count}"/></td>
                        <td><c:out value="${contract.contractID}"/></td>
                        <td><c:out value="${contract.customerID}"/></td>
                        <td><c:out value="${contract.contractInfo}"/></td>
                        <td><c:out value="${contract.status}"/></td>
                        <td><fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></td>
                        <td><c:out value="${contract.insuranceType}"/></td>
                        <td><c:out value="${contract.coverage}"/></td>
                        <td><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/viewContract?contractID=${contract.contractID}" class="btn btn-info btn-sm"><i class="bi bi-eye-fill"></i> View</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- End of Main Content -->
</body>
</html>