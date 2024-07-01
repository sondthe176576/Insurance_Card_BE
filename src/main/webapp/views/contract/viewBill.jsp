<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bill</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewBill.css">
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Include sidebar -->
<img src="${pageContext.request.contextPath}/img/slider.jpg" alt="Slider Image" class="img-fluid mb-4">
<!-- End of sidebar -->
<div class="container mt-4">
    <c:if test="${not empty message}">
        <div class="alert alert-success text-center" role="alert">
            <strong>${message}</strong>
        </div>
    </c:if>
    <h2 class="text-center">Bill Details</h2>
    <div class="table-responsive mt-4">
        <table class="table table-bordered table-striped">
            <thead class="table-primary">
            <tr>
                <th>Contract ID</th>
                <th>Customer ID</th>
                <th>Contract Info</th>
                <th>Status</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Value</th>
                <th>Detail</th>
                <th>Coverage</th>
                <th>Premium</th>
                <th>Payment Method</th>
                <th>Payment Amount</th>
                <th>Payment Date</th>
                <th>Status Payment Detail</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><c:out value="${contract.contractID}"/></td>
                <td><c:out value="${contract.customerID}"/></td>
                <td><c:out value="${contract.contractInfo}"/></td>
                <td><c:out value="${contract.status}"/></td>
                <td><c:out value="${contract.startDate}"/></td>
                <td><c:out value="${contract.endDate}"/></td>
                <td><c:out value="${contract.value}"/></td>
                <td><c:out value="${contract.detail}"/></td>
                <td><c:out value="${contract.coverage}"/></td>
                <td><c:out value="${contract.premium}"/></td>
                <td><c:out value="${contract.methodPaymentType}"/></td>
                <td><c:out value="${contract.paymentHistory.amount}"/></td>
                <td><c:out value="${contract.paymentHistory.paymentDate}"/></td>
                <td><c:out value="${contract.paymentHistory.paymentDetails}"/></td>
                <td class="text-center">
                    <a href="${pageContext.request.contextPath}/viewContract?contractID=${contract.contractID}"
                       class="btn btn-primary" title="View Detail">
                        <i class="bi bi-eye"></i>
                    </a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>