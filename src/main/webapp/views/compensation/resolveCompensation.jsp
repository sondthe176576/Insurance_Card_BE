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
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/css/resolveCompensation.css" defer></script>
    <script>
        function showModal(status) {
            document.getElementById('modal-status').value = status;
            new bootstrap.Modal(document.getElementById('confirmationModal')).show();
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
<div class="container mt-4">
    <div class="card">
        <div class="card-header text-center">
            <h2><i class="bi bi-info-circle-fill"></i> Compensation Detail</h2>
        </div>
        <div class="card-body">
            <h3 class="text-primary">Request Information</h3>
            <div class="row mb-4">
                <div class="col-md-6">
                    <label class="fw-bold">Compensation ID:</label>
                    <p><c:out value="${compensation.requestID}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Description:</label>
                    <p><c:out value="${compensation.description}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Amount:</label>
                    <p><fmt:formatNumber value="${compensation.amount}" type="currency" currencySymbol="$"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Status:</label>
                    <p><c:out value="${compensation.status}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Date:</label>
                    <p><fmt:formatDate value="${compensation.requestDate}" pattern="dd-MM-yyyy"/></p>
                </div>
            </div>
            <h3 class="text-primary">Customer Information</h3>
            <div class="row mb-4">
                <div class="col-md-6">
                    <label class="fw-bold">Customer ID:</label>
                    <p><c:out value="${compensation.customerID}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Customer Name:</label>
                    <p><c:out value="${compensation.customerName}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Full Name:</label>
                    <p><c:out value="${compensation.contract.customer.user.fullName}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">First Name:</label>
                    <p><c:out value="${compensation.contract.customer.user.firstName}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Last Name:</label>
                    <p><c:out value="${compensation.contract.customer.user.lastName}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Phone Number:</label>
                    <p><c:out value="${compensation.contract.customer.user.mobile}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Email:</label>
                    <p><c:out value="${compensation.contract.customer.user.email}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Province:</label>
                    <p><c:out value="${compensation.contract.customer.user.province}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">District:</label>
                    <p><c:out value="${compensation.contract.customer.user.district}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Country:</label>
                    <p><c:out value="${compensation.contract.customer.user.country}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Gender:</label>
                    <p><c:out value="${compensation.contract.customer.user.gender}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Birth Date:</label>
                    <p><fmt:formatDate value="${compensation.contract.customer.user.birthDate}"
                                       pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Personal Info:</label>
                    <p><c:out value="${compensation.contract.customer.personalInfo}"/></p>
                </div>
            </div>
            <h3 class="text-primary">Contract Information</h3>
            <div class="row mb-4">
                <div class="col-md-6">
                    <label class="fw-bold">Contract ID:</label>
                    <p><c:out value="${compensation.contractID}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Contract Info:</label>
                    <p><c:out value="${compensation.contract.contractInfo}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Contract Status:</label>
                    <p><c:out value="${compensation.contract.status}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Start Date:</label>
                    <p><fmt:formatDate value="${compensation.contract.startDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">End Date:</label>
                    <p><fmt:formatDate value="${compensation.contract.endDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Insurance Type:</label>
                    <p><c:out value="${compensation.contract.insuranceType}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Coverage:</label>
                    <p><c:out value="${compensation.contract.coverage}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Premium:</label>
                    <p><fmt:formatNumber value="${compensation.contract.premium}" type="currency"
                                         currencySymbol="$"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Detail:</label>
                    <p><c:out value="${compensation.contract.detail}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Value:</label>
                    <p><fmt:formatNumber value="${compensation.contract.value}" type="currency" currencySymbol="$"/></p>
                </div>
            </div>
            <h3 class="text-primary">Motorcycle Information</h3>
            <div class="row mb-4">
                <div class="col-md-6">
                    <label class="fw-bold">License Plate:</label>
                    <p><c:out value="${compensation.contract.motorcycle.licensePlate}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Brand:</label>
                    <p><c:out value="${compensation.contract.motorcycle.brand}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Model:</label>
                    <p><c:out value="${compensation.contract.motorcycle.model}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Frame Number:</label>
                    <p><c:out value="${compensation.contract.motorcycle.frameNumber}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Engine Number:</label>
                    <p><c:out value="${compensation.contract.motorcycle.engineNumber}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Year Of Manufacture:</label>
                    <p><c:out value="${compensation.contract.motorcycle.yearOfManufacture}"/></p>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold">Color:</label>
                    <p><c:out value="${compensation.contract.motorcycle.color}"/></p>
                </div>
            </div>
            <form id="resolveForm" method="post" action="${pageContext.request.contextPath}/resolveCompensation">
                <input type="hidden" id="status" name="status" value=""/>
                <input type="hidden" name="requestID" value="${compensation.requestID}"/>
                <div class="text-center">
                    <button type="button" onclick="showModal('Approved')" class="btn btn-success me-2">
                        <i class="bi bi-check-circle-fill"></i> Approve
                    </button>
                    <button type="button" onclick="showModal('Rejected')" class="btn btn-danger me-2">
                        <i class="bi bi-x-circle-fill"></i> Reject
                    </button>
                    <a href="${pageContext.request.contextPath}/listCompensation" class="btn btn-secondary">
                        <i class="bi bi-arrow-left-circle-fill"></i> Back to List
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmationModalLabel">Confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to proceed?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="confirmAction()">Yes</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <input type="hidden" id="modal-status" value=""/>
            </div>
        </div>
    </div>
</div>
<!-- End of modal -->
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>