<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bill</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewBill.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Include sidebar -->
<img src="${pageContext.request.contextPath}/img/slider.jpg" alt="Slider Image" style="width: 100%; margin-bottom: 20px;">
<!-- End of sidebar -->
<h2 style="text-align: center; margin-top: 20px;">Bill Details</h2>
<div class="table-container">
    <table>
        <thead>
        <tr>
            <th>Contract ID</th>
            <th>Customer ID</th>
            <th>Contract Info</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Value</th>
            <th>Detail</th>
            <th>Coverage</th>
            <th>Premium</th>
            <th>Payment Method</th> <!-- Thêm Payment Method -->
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><c:out value="${contract.contractID}"/></td>
            <td><c:out value="${contract.customerID}"/></td>
            <td><c:out value="${contract.contractInfo}"/></td>
            <td><c:out value="${contract.startDate}"/></td>
            <td><c:out value="${contract.endDate}"/></td>
            <td><c:out value="${contract.value}"/></td>
            <td><c:out value="${contract.detail}"/></td>
            <td><c:out value="${contract.coverage}"/></td>
            <td><c:out value="${contract.premium}"/></td>
            <td><c:out value="${contract.methodPaymentType}"/></td> <!-- Thêm methodPaymentType -->
            <td>
                <a href="${pageContext.request.contextPath}/viewContract?contractID=${contract.contractID}" class="btn-view-detail" title="View Detail">
                    <i class="fas fa-eye"></i>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>