<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resolve Accident</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/resolveAccident.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js" defer></script>
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
<!-- Notification Message -->
<c:if test="${not empty message}">
    <div class="alert ${status ? 'alert-success' : 'alert-danger'} alert-dismissible fade show" role="alert">
        <i class="bi ${status ? 'bi-check-circle-fill' : 'bi-exclamation-triangle-fill'}"></i>
        <c:out value="${message}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<!-- End of notification message -->
<!-- Form -->
<div class="container mt-5">
    <div class="card card-custom">
        <div class="card-header card-header-custom">
            <h2><i class="bi bi-info-circle-fill"></i> Accident Detail</h2>
        </div>
        <div class="card-body">
            <h3 class="card-section-title text-primary">Accident Information</h3>
            <div class="details">
                <label class="details-label">Accident ID:</label>
                <p class="details-value"><c:out value="${accident.accidentID}"/></p>
                <label class="details-label">Customer Name:</label>
                <p class="details-value"><c:out value="${accident.customer.user.fullName}"/></p>
                <label class="details-label">Accident Type:</label>
                <p class="details-value"><c:out value="${accident.accidentType}"/></p>
                <label class="details-label">Accident Date:</label>
                <p class="details-value"><fmt:formatDate value="${accident.accidentDate}" pattern="dd-MM-yyyy"/></p>
                <label class="details-label">Description:</label>
                <p class="details-value"><c:out value="${accident.description}"/></p>
                <label class="details-label">Status:</label>
                <p class="details-value"><c:out value="${accident.status}"/></p>
            </div>
            <h3 class="card-section-title text-primary">Customer Information</h3>
            <div class="details">
                <label class="details-label">Customer ID:</label>
                <p class="details-value"><c:out value="${accident.customerID}"/></p>
                <label class="details-label">Full Name:</label>
                <p class="details-value"><c:out value="${accident.customer.user.fullName}"/></p>
                <label class="details-label">First Name:</label>
                <p class="details-value"><c:out value="${accident.customer.user.firstName}"/></p>
                <label class="details-label">Last Name:</label>
                <p class="details-value"><c:out value="${accident.customer.user.lastName}"/></p>
                <label class="details-label">Phone Number:</label>
                <p class="details-value"><c:out value="${accident.customer.user.mobile}"/></p>
                <label class="details-label">Email:</label>
                <p class="details-value"><c:out value="${accident.customer.user.email}"/></p>
                <label class="details-label">Province:</label>
                <p class="details-value"><c:out value="${accident.customer.user.province}"/></p>
                <label class="details-label">District:</label>
                <p class="details-value"><c:out value="${accident.customer.user.district}"/></p>
                <label class="details-label">Country:</label>
                <p class="details-value"><c:out value="${accident.customer.user.country}"/></p>
                <label class="details-label">Gender:</label>
                <p class="details-value"><c:out value="${accident.customer.user.gender}"/></p>
                <label class="details-label">Birth Date:</label>
                <p class="details-value"><fmt:formatDate value="${accident.customer.user.birthDate}"
                                                         pattern="dd-MM-yyyy"/></p>
                <label class="details-label">Personal Info:</label>
                <p class="details-value"><c:out value="${accident.customer.personalInfo}"/></p>
            </div>
            <h3 class="card-section-title text-primary">Contract Information</h3>
            <div class="details">
                <label class="details-label">Contract ID:</label>
                <p class="details-value"><c:out value="${accident.contractID}"/></p>
                <label class="details-label">Contract Info:</label>
                <p class="details-value"><c:out value="${accident.contract.contractInfo}"/></p>
                <label class="details-label">Contract Status:</label>
                <p class="details-value"><c:out value="${accident.contract.status}"/></p>
                <label class="details-label">Start Date:</label>
                <p class="details-value"><fmt:formatDate value="${accident.contract.startDate}"
                                                         pattern="dd-MM-yyyy"/></p>
                <label class="details-label">End Date:</label>
                <p class="details-value"><fmt:formatDate value="${accident.contract.endDate}" pattern="dd-MM-yyyy"/></p>
                <label class="details-label">Insurance Type:</label>
                <p class="details-value"><c:out value="${accident.contract.insuranceType}"/></p>
                <label class="details-label">Coverage:</label>
                <p class="details-value"><c:out value="${accident.contract.coverage}"/></p>
                <label class="details-label">Premium:</label>
                <p class="details-value"><fmt:formatNumber value="${accident.contract.premium}" type="currency"
                                                           currencySymbol="$"/></p>
                <label class="details-label">Detail:</label>
                <p class="details-value"><c:out value="${accident.contract.detail}"/></p>
                <label class="details-label">Value:</label>
                <p class="details-value"><fmt:formatNumber value="${accident.contract.value}" type="currency"
                                                           currencySymbol="$"/></p>
            </div>
            <h3 class="card-section-title text-primary">Motorcycle Information</h3>
            <div class="details">
                <label class="details-label">License Plate:</label>
                <p class="details-value"><c:out value="${accident.contract.motorcycle.licensePlate}"/></p>
                <label class="details-label">Brand:</label>
                <p class="details-value"><c:out value="${accident.contract.motorcycle.brand}"/></p>
                <label class="details-label">Model:</label>
                <p class="details-value"><c:out value="${accident.contract.motorcycle.model}"/></p>
                <label class="details-label">Frame Number:</label>
                <p class="details-value"><c:out value="${accident.contract.motorcycle.frameNumber}"/></p>
                <label class="details-label">Engine Number:</label>
                <p class="details-value"><c:out value="${accident.contract.motorcycle.engineNumber}"/></p>
                <label class="details-label">Year Of Manufacture:</label>
                <p class="details-value"><c:out value="${accident.contract.motorcycle.yearOfManufacture}"/></p>
                <label class="details-label">Color:</label>
                <p class="details-value"><c:out value="${accident.contract.motorcycle.color}"/></p>
            </div>
            <form id="resolveForm" method="post" action="${pageContext.request.contextPath}/resolveAccident">
                <input type="hidden" id="status" name="status" value=""/>
                <input type="hidden" name="accidentID" value="${accident.accidentID}"/>
                <div class="btn-container">
                    <button type="button" onclick="showModal('Approved')" class="btn-custom btn-approve">
                        <i class="bi bi-check-circle-fill"></i> Approve
                    </button>
                    <button type="button" onclick="showModal('Rejected')" class="btn-custom btn-reject">
                        <i class="bi bi-x-circle-fill"></i> Reject
                    </button>
                    <a href="${pageContext.request.contextPath}/listAccident" class="btn-custom btn-secondary">
                        <i class="bi bi-arrow-left-circle-fill"></i> Back to List
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade modal-custom" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-content-custom">
            <div class="modal-header">
                <h5 class="modal-title modal-title-custom" id="confirmationModalLabel">Confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to proceed?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn modal-btn btn-yes" onclick="confirmAction()">Yes</button>
                <button type="button" class="btn modal-btn btn-no" data-bs-dismiss="modal">No</button>
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