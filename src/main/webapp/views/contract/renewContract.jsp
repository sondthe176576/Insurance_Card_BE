<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Renew Contract</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/renewContract.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/renewContract.js" defer></script>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Notification Message -->
<c:if test="${not empty message}">
    <div id="notification" class="alert ${status ? 'alert-success' : 'alert-danger'} alert-dismissible fade show" role="alert">
        <c:out value="${message}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<!-- End of Notification Message -->
<!-- Form -->
<div class="container mt-4">
    <div class="card">
        <div class="card-header text-center">
            <h2>Renew Contract</h2>
        </div>
        <div class="card-body">
            <form id="renewContractForm" action="${pageContext.request.contextPath}/renewContract" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <h3>Customer Information</h3>
                        <div class="mb-3">
                            <label for="customerID" class="form-label">Customer ID:</label>
                            <input type="number" id="customerID" name="customerID" class="form-control" value="${contract.customer.customerID}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name:</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" value="${contract.customer.user.fullName}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="firstName" class="form-label">First Name:</label>
                            <input type="text" id="firstName" name="firstName" class="form-control" value="${contract.customer.user.firstName}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label">Last Name:</label>
                            <input type="text" id="lastName" name="lastName" class="form-control" value="${contract.customer.user.lastName}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="province" class="form-label">Province:</label>
                            <input type="text" id="province" name="province" class="form-control" value="${contract.customer.user.province}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="district" class="form-label">District:</label>
                            <input type="text" id="district" name="district" class="form-control" value="${contract.customer.user.district}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="country" class="form-label">Country:</label>
                            <input type="text" id="country" name="country" class="form-control" value="${contract.customer.user.country}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="birthDate" class="form-label">Birth Date:</label>
                            <input type="date" id="birthDate" name="birthDate" class="form-control" value="<fmt:formatDate value='${contract.customer.user.birthDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="mobile" class="form-label">Mobile:</label>
                            <input type="text" id="mobile" name="mobile" class="form-control" value="${contract.customer.user.mobile}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" id="email" name="email" class="form-control" value="${contract.customer.user.email}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">Gender:</label>
                            <input type="text" id="gender" name="gender" class="form-control" value="${contract.customer.user.gender}" readonly>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3>Vehicle Information</h3>
                        <div class="mb-3">
                            <label for="licensePlate" class="form-label">License Plate:</label>
                            <input type="text" id="licensePlate" name="licensePlate" class="form-control" value="${contract.motorcycle.licensePlate}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="brand" class="form-label">Brand:</label>
                            <input type="text" id="brand" name="brand" class="form-control" value="${contract.motorcycle.brand}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="model" class="form-label">Model:</label>
                            <input type="text" id="model" name="model" class="form-control" value="${contract.motorcycle.model}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="yearOfManufacture" class="form-label">Year of Manufacture:</label>
                            <input type="number" id="yearOfManufacture" name="yearOfManufacture" class="form-control" value="${contract.motorcycle.yearOfManufacture}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="color" class="form-label">Color:</label>
                            <input type="text" id="color" name="color" class="form-control" value="${contract.motorcycle.color}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="engineNumber" class="form-label">Engine Number:</label>
                            <input type="text" id="engineNumber" name="engineNumber" class="form-control" value="${contract.motorcycle.engineNumber}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="frameNumber" class="form-label">Frame Number:</label>
                            <input type="text" id="frameNumber" name="frameNumber" class="form-control" value="${contract.motorcycle.frameNumber}" readonly>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <h3>Insurance Information</h3>
                        <div class="mb-3">
                            <label for="contractID" class="form-label">Contract ID:</label>
                            <input type="number" id="contractID" name="contractID" class="form-control" value="${contract.contractID}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="contractInfo" class="form-label">Contract Info:</label>
                            <input type="text" id="contractInfo" name="contractInfo" class="form-control" value="${contract.contractInfo}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">Status:</label>
                            <input type="text" id="status" name="status" class="form-control" value="${contract.status}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="startDate" class="form-label">Start Date:</label>
                            <input type="date" id="startDate" name="startDate" class="form-control" value="<fmt:formatDate value='${contract.startDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="endDate" class="form-label">End Date:</label>
                            <input type="date" id="endDate" name="endDate" class="form-control" value="<fmt:formatDate value='${contract.endDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="value" class="form-label">Value:</label>
                            <input type="text" id="value" name="value" class="form-control" value="<fmt:formatNumber value='${contract.value}' type='currency' currencySymbol='$'/>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="detail" class="form-label">Detail:</label>
                            <textarea id="detail" name="detail" class="form-control" rows="3" readonly>${contract.detail}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="insuranceType" class="form-label">Insurance Type:</label>
                            <input type="text" id="insuranceType" name="insuranceType" class="form-control" value="${contract.insuranceType}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="coverage" class="form-label">Coverage:</label>
                            <input type="text" id="coverage" name="coverage" class="form-control" value="${contract.coverage}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="premium" class="form-label">Premium:</label>
                            <input type="text" id="premium" name="premium" class="form-control" value="<fmt:formatNumber value='${contract.premium}' type='currency' currencySymbol='$'/>" readonly>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3>Renew Contract</h3>
                        <div class="mb-3">
                            <label for="renewalDate" class="form-label">Renewal Date:</label>
                            <input type="date" id="renewalDate" name="renewalDate" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="newPremium" class="form-label">New Premium:</label>
                            <input type="number" id="newPremium" name="newPremium" class="form-control" step="50" min="50" required>
                        </div>
                        <div class="mb-3">
                            <label for="newCoverage" class="form-label">New Coverage:</label>
                            <input type="text" id="newCoverage" name="newCoverage" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="newContractInfo" class="form-label">New Contract Info:</label>
                            <input type="text" id="newContractInfo" name="newContractInfo" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="card mt-4">
                    <div class="card-header text-center">
                        <h3>Application can be dropped off or mailed to:</h3>
                    </div>
                    <div class="card-body text-center">
                        <p>Motorcycle Insurance Company,<br>
                            123 Hola Street,<br>
                            District Thach That, Ha Noi,<br>
                            Vietnam</p>
                        <p>Phone: 0123-456-789<br>
                            <a href="http://www.motorcycleinsurance.vn">www.motorcycleinsurance.vn</a></p>
                    </div>
                </div>
                <input type="hidden" name="contractID" value="${contract.contractID}">
                <div class="d-flex justify-content-center mt-4">
                    <button type="submit" class="btn btn-primary">Renew Contract</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>