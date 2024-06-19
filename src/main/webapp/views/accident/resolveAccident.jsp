<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Resolve Accident</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resolveAccident.css">
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
    <h2>Accident Detail</h2>
    <h3>Accident Information</h3>
    <div class="details">
        <label>Accident ID:</label>
        <p><c:out value="${accident.accidentID}"/></p>
        <label>Customer Name:</label>
        <p><c:out value="${accident.customer.user.fullName}"/></p>
        <label>Accident Type:</label>
        <p><c:out value="${accident.accidentType}"/></p>
        <label>Accident Date:</label>
        <p><fmt:formatDate value="${accident.accidentDate}" pattern="dd-MM-yyyy"/></p>
        <label>Description:</label>
        <p><c:out value="${accident.description}"/></p>
        <label>Status:</label>
        <p><c:out value="${accident.status}"/></p>
    </div>
    <h3>Customer Information</h3>
    <div class="details">
        <label>Customer ID:</label>
        <p><c:out value="${accident.customerID}"/></p>
        <label>Full Name:</label>
        <p><c:out value="${accident.customer.user.fullName}"/></p>
        <label>First Name:</label>
        <p><c:out value="${accident.customer.user.firstName}"/></p>
        <label>Last Name:</label>
        <p><c:out value="${accident.customer.user.lastName}"/></p>
        <label>Phone Number:</label>
        <p><c:out value="${accident.customer.user.mobile}"/></p>
        <label>Email:</label>
        <p><c:out value="${accident.customer.user.email}"/></p>
        <label>Province:</label>
        <p><c:out value="${accident.customer.user.province}"/></p>
        <label>District:</label>
        <p><c:out value="${accident.customer.user.district}"/></p>
        <label>Country:</label>
        <p><c:out value="${accident.customer.user.country}"/></p>
        <label>Gender:</label>
        <p><c:out value="${accident.customer.user.gender}"/></p>
        <label>Birth Date:</label>
        <p><fmt:formatDate value="${accident.customer.user.birthDate}" pattern="dd-MM-yyyy"/></p>
        <label>Personal Info:</label>
        <p><c:out value="${accident.customer.personalInfo}"/></p>
    </div>
    <h3>Contract Information</h3>
    <div class="details">
        <label>Contract ID:</label>
        <p><c:out value="${accident.contractID}"/></p>
        <label>Contract Info:</label>
        <p><c:out value="${accident.contract.contractInfo}"/></p>
        <label>Contract Status:</label>
        <p><c:out value="${accident.contract.status}"/></p>
        <label>Start Date:</label>
        <p><fmt:formatDate value="${accident.contract.startDate}" pattern="dd-MM-yyyy"/></p>
        <label>End Date:</label>
        <p><fmt:formatDate value="${accident.contract.endDate}" pattern="dd-MM-yyyy"/></p>
        <label>Insurance Type:</label>
        <p><c:out value="${accident.contract.insuranceType}"/></p>
        <label>Coverage:</label>
        <p><c:out value="${accident.contract.coverage}"/></p>
        <label>Premium:</label>
        <p><fmt:formatNumber value="${accident.contract.premium}" type="currency" currencySymbol="$"/></p>
        <label>Detail:</label>
        <p><c:out value="${accident.contract.detail}"/></p>
        <label>Value:</label>
        <p><fmt:formatNumber value="${accident.contract.value}" type="currency" currencySymbol="$"/></p>
    </div>
    <h3>Motorcycle Information</h3>
    <div class="details">
        <label>License Plate:</label>
        <p><c:out value="${accident.contract.motorcycle.licensePlate}"/></p>
        <label>Brand:</label>
        <p><c:out value="${accident.contract.motorcycle.brand}"/></p>
        <label>Model:</label>
        <p><c:out value="${accident.contract.motorcycle.model}"/></p>
        <label>Frame Number:</label>
        <p><c:out value="${accident.contract.motorcycle.frameNumber}"/></p>
        <label>Engine Number:</label>
        <p><c:out value="${accident.contract.motorcycle.engineNumber}"/></p>
        <label>Year Of Manufacture:</label>
        <p><c:out value="${accident.contract.motorcycle.yearOfManufacture}"/></p>
        <label>Color:</label>
        <p><c:out value="${accident.contract.motorcycle.color}"/></p>
    </div>
    <form id="resolveForm" method="post" action="${pageContext.request.contextPath}/resolveAccident">
        <input type="hidden" id="status" name="status" value=""/>
        <input type="hidden" name="accidentID" value="${accident.accidentID}"/>
        <div class="btn-container">
            <button type="button" onclick="showModal('Approved')" class="btn btn-approve">Approve</button>
            <button type="button" onclick="showModal('Rejected')" class="btn btn-reject">Reject</button>
            <a href="${pageContext.request.contextPath}/listAccident" class="btn">Back to List</a>
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