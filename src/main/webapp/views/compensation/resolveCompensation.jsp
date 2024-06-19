<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Resolve Compensation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resolveCompensation.css">
    <script>
        function showModal(status) {
            document.getElementById('modal-status').value = status;
            document.getElementById('confirmationModal').style.display = 'block';
        }

        function hideModal() {
            document.getElementById('confirmationModal').style.display = 'none';
        }

        function confirmAction() {
            var status = document.getElementById('modal-status').value;
            document.getElementById('status').value = status;
            document.getElementById('resolveForm').submit();
        }
    </script>
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
    <h2>Compensation Detail</h2>
    <h3>Request Information</h3>
    <div class="details">
        <label>Compensation ID:</label>
        <p><c:out value="${compensation.requestID}"/></p>
        <label>Description:</label>
        <p><c:out value="${compensation.description}"/></p>
        <label>Amount:</label>
        <p><fmt:formatNumber value="${compensation.amount}" type="currency" currencySymbol="$"/></p>
        <label>Status:</label>
        <p><c:out value="${compensation.status}"/></p>
        <label>Date:</label>
        <p><fmt:formatDate value="${compensation.requestDate}" pattern="dd-MM-yyyy"/></p>
    </div>
    <h3>Customer Information</h3>
    <div class="details">
        <label>Customer ID:</label>
        <p><c:out value="${compensation.customerID}"/></p>
        <label>Customer Name:</label>
        <p><c:out value="${compensation.customerName}"/></p>
        <label>Full Name:</label>
        <p><c:out value="${compensation.contract.customer.user.fullName}"/></p>
        <label>First Name:</label>
        <p><c:out value="${compensation.contract.customer.user.firstName}"/></p>
        <label>Last Name:</label>
        <p><c:out value="${compensation.contract.customer.user.lastName}"/></p>
        <label>Phone Number:</label>
        <p><c:out value="${compensation.contract.customer.user.mobile}"/></p>
        <label>Email:</label>
        <p><c:out value="${compensation.contract.customer.user.email}"/></p>
        <label>Province:</label>
        <p><c:out value="${compensation.contract.customer.user.province}"/></p>
        <label>District:</label>
        <p><c:out value="${compensation.contract.customer.user.district}"/></p>
        <label>Country:</label>
        <p><c:out value="${compensation.contract.customer.user.country}"/></p>
        <label>Gender:</label>
        <p><c:out value="${compensation.contract.customer.user.gender}"/></p>
        <label>Birth Date:</label>
        <p><fmt:formatDate value="${compensation.contract.customer.user.birthDate}" pattern="dd-MM-yyyy"/></p>
        <label>Personal Info:</label>
        <p><c:out value="${compensation.contract.customer.personalInfo}"/></p>
    </div>
    <h3>Contract Information</h3>
    <div class="details">
        <label>Contract ID:</label>
        <p><c:out value="${compensation.contractID}"/></p>
        <label>Contract Info:</label>
        <p><c:out value="${compensation.contract.contractInfo}"/></p>
        <label>Contract Status:</label>
        <p><c:out value="${compensation.contract.status}"/></p>
        <label>Start Date:</label>
        <p><fmt:formatDate value="${compensation.contract.startDate}" pattern="dd-MM-yyyy"/></p>
        <label>End Date:</label>
        <p><fmt:formatDate value="${compensation.contract.endDate}" pattern="dd-MM-yyyy"/></p>
        <label>Insurance Type:</label>
        <p><c:out value="${compensation.contract.insuranceType}"/></p>
        <label>Coverage:</label>
        <p><c:out value="${compensation.contract.coverage}"/></p>
        <label>Premium:</label>
        <p><fmt:formatNumber value="${compensation.contract.premium}" type="currency" currencySymbol="$"/></p>
        <label>Detail:</label>
        <p><c:out value="${compensation.contract.detail}"/></p>
        <label>Value:</label>
        <p><fmt:formatNumber value="${compensation.contract.value}" type="currency" currencySymbol="$"/></p>
    </div>
    <h3>Motorcycle Information</h3>
    <div class="details">
        <label>License Plate:</label>
        <p><c:out value="${compensation.contract.motorcycle.licensePlate}"/></p>
        <label>Brand:</label>
        <p><c:out value="${compensation.contract.motorcycle.brand}"/></p>
        <label>Model:</label>
        <p><c:out value="${compensation.contract.motorcycle.model}"/></p>
        <label>Frame Number:</label>
        <p><c:out value="${compensation.contract.motorcycle.frameNumber}"/></p>
        <label>Engine Number:</label>
        <p><c:out value="${compensation.contract.motorcycle.engineNumber}"/></p>
        <label>Year Of Manufacture:</label>
        <p><c:out value="${compensation.contract.motorcycle.yearOfManufacture}"/></p>
        <label>Color:</label>
        <p><c:out value="${compensation.contract.motorcycle.color}"/></p>
    </div>
    <form id="resolveForm" method="post" action="${pageContext.request.contextPath}/resolveCompensation">
        <input type="hidden" id="status" name="status" value=""/>
        <input type="hidden" name="requestID" value="${compensation.requestID}"/>
        <div class="btn-container">
            <button type="button" onclick="showModal('Approved')" class="btn btn-approve">Approve</button>
            <button type="button" onclick="showModal('Rejected')" class="btn btn-reject">Reject</button>
            <a href="${pageContext.request.contextPath}/listCompensation" class="btn">Back to List</a>
        </div>
    </form>
</div>

<!-- Modal -->
<div id="confirmationModal" class="modal">
    <div class="modal-content">
        <h4>Are you sure you want to proceed?</h4>
        <button class="btn-yes" onclick="confirmAction()">Yes</button>
        <button class="btn-no" onclick="hideModal()">No</button>
        <input type="hidden" id="modal-status" value=""/>
    </div>
</div>
<!-- End of modal -->

<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>