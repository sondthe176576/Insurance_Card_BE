<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resolve Waiting Contracts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewContract.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" defer></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/js/resolveWaitingContracts.js" defer></script>
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
    <div id="notification" class="alert ${status ? 'alert-success' : 'alert-danger'} alert-dismissible fade show"
         role="alert">
        <c:out value="${message}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<!-- End of Notification Message -->
<!-- Form -->
<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white text-center">
            <h2><i class="fas fa-file-alt"></i> Resolve Waiting Contracts</h2>
        </div>
        <div class="card-body p-4">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="text-primary"><i class="fas fa-user"></i> Customer Information</h4>
                    <div class="mb-3">
                        <label for="customerID" class="form-label">Customer ID:</label>
                        <input type="number" id="customerID" name="customerID" class="form-control"
                               value="${contract.customer.customerID}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Full Name:</label>
                        <input type="text" id="fullName" name="fullName" class="form-control"
                               value="${contract.customer.user.fullName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name:</label>
                        <input type="text" id="firstName" name="firstName" class="form-control"
                               value="${contract.customer.user.firstName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" class="form-control"
                               value="${contract.customer.user.lastName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="province" class="form-label">Province:</label>
                        <input type="text" id="province" name="province" class="form-control"
                               value="${contract.customer.user.province}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="district" class="form-label">District:</label>
                        <input type="text" id="district" name="district" class="form-control"
                               value="${contract.customer.user.district}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="country" class="form-label">Country:</label>
                        <input type="text" id="country" name="country" class="form-control"
                               value="${contract.customer.user.country}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="birthDate" class="form-label">Birth Date:</label>
                        <input type="date" id="birthDate" name="birthDate" class="form-control"
                               value="<fmt:formatDate value='${contract.customer.user.birthDate}' pattern='yyyy-MM-dd'/>"
                               readonly>
                    </div>
                    <div class="mb-3">
                        <label for="mobile" class="form-label">Mobile:</label>
                        <input type="text" id="mobile" name="mobile" class="form-control"
                               value="${contract.customer.user.mobile}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" id="email" name="email" class="form-control"
                               value="${contract.customer.user.email}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="gender" class="form-label">Gender:</label>
                        <input type="text" id="gender" name="gender" class="form-control"
                               value="${contract.customer.user.gender}" readonly>
                    </div>
                </div>
                <div class="col-md-6">
                    <h4 class="text-primary"><i class="fas fa-motorcycle"></i> Vehicle Information</h4>
                    <div class="mb-3">
                        <label for="motorcycleID" class="form-label">Motorcycle ID:</label>
                        <input type="number" id="motorcycleID" name="motorcycleID" class="form-control"
                               value="${contract.motorcycle.motorcycleID}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="licensePlate" class="form-label">License Plate:</label>
                        <input type="text" id="licensePlate" name="licensePlate" class="form-control"
                               value="${contract.motorcycle.licensePlate}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="brand" class="form-label">Brand:</label>
                        <input type="text" id="brand" name="brand" class="form-control"
                               value="${contract.motorcycle.brand}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="model" class="form-label">Model:</label>
                        <input type="text" id="model" name="model" class="form-control"
                               value="${contract.motorcycle.model}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="yearOfManufacture" class="form-label">Year of Manufacture:</label>
                        <input type="number" id="yearOfManufacture" name="yearOfManufacture" class="form-control"
                               value="${contract.motorcycle.yearOfManufacture}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="color" class="form-label">Color:</label>
                        <input type="text" id="color" name="color" class="form-control"
                               value="${contract.motorcycle.color}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="engineNumber" class="form-label">Engine Number:</label>
                        <input type="text" id="engineNumber" name="engineNumber" class="form-control"
                               value="${contract.motorcycle.engineNumber}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="frameNumber" class="form-label">Frame Number:</label>
                        <input type="text" id="frameNumber" name="frameNumber" class="form-control"
                               value="${contract.motorcycle.frameNumber}" readonly>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-12">
                    <h4 class="text-primary"><i class="fas fa-file-contract"></i> Contract Information</h4>
                    <div class="mb-3">
                        <label for="contractID" class="form-label">Contract ID:</label>
                        <input type="number" id="contractID" name="contractID" class="form-control"
                               value="${contract.contractID}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="contractInfo" class="form-label">Contract Info:</label>
                        <input type="text" id="contractInfo" name="contractInfo" class="form-control"
                               value="${contract.contractInfo}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Status:</label>
                        <input type="text" id="status" name="status" class="form-control" value="${contract.status}"
                               readonly>
                    </div>
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Start Date:</label>
                        <input type="text" id="startDate" name="startDate" class="form-control"
                               value="<fmt:formatDate value='${contract.startDate}' pattern='dd-MM-yyyy'/>" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">End Date:</label>
                        <input type="text" id="endDate" name="endDate" class="form-control"
                               value="<fmt:formatDate value='${contract.endDate}' pattern='dd-MM-yyyy'/>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Time remaining:</label>
                        <p class="text-danger">
                            <c:out value="${diffDays}"/> days
                        </p>
                    </div>
                    <div class="mb-3">
                        <label for="value" class="form-label">Value:</label>
                        <input type="text" id="value" name="value" class="form-control"
                               value="<fmt:formatNumber value='${contract.value}' type='currency' currencySymbol='$'/>"
                               readonly>
                    </div>
                    <div class="mb-3">
                        <label for="detail" class="form-label">Detail:</label>
                        <textarea id="detail" name="detail" class="form-control" rows="3"
                                  readonly>${contract.detail}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="insuranceType" class="form-label">Insurance Type:</label>
                        <input type="text" id="insuranceType" name="insuranceType" class="form-control"
                               value="${contract.insuranceType}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="coverage" class="form-label">Coverage:</label>
                        <input type="text" id="coverage" name="coverage" class="form-control"
                               value="${contract.coverage}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="premium" class="form-label">Premium:</label>
                        <input type="text" id="premium" name="premium" class="form-control"
                               value="<fmt:formatNumber value='${contract.premium}' type='currency' currencySymbol='$'/>"
                               readonly>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-12">
                    <h4 class="text-primary"><i class="fas fa-dollar-sign"></i> Payment Information</h4>
                    <div class="mb-3">
                        <label for="paymentMethodType" class="form-label">Payment Method:</label>
                        <input type="text" id="paymentMethodType" name="paymentMethodType" class="form-control"
                               value="${contract.paymentMethod.methodType}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="paymentDetails" class="form-label">Payment Details:</label>
                        <textarea id="paymentDetails" name="paymentDetails" class="form-control" rows="3"
                                  readonly>${contract.paymentMethod.details}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="paymentAmount" class="form-label">Payment Amount:</label>
                        <input type="text" id="paymentAmount" name="paymentAmount" class="form-control"
                               value="<fmt:formatNumber value='${contract.paymentHistory.amount}' type='currency' currencySymbol='$'/>"
                               readonly>
                    </div>
                    <div class="mb-3">
                        <label for="paymentDate" class="form-label">Payment Date:</label>
                        <input type="text" id="paymentDate" name="paymentDate" class="form-control"
                               value="<fmt:formatDate value='${contract.paymentHistory.paymentDate}' pattern='dd-MM-yyyy'/>"
                               readonly>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-12">
                    <h4 class="text-primary"><i class="fas fa-box"></i> Insurance Packages</h4>
                    <div class="accordion" id="insurancePackages">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="fas fa-shield-alt"></i> Basic Motorcycle Insurance
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                 data-bs-parent="#insurancePackages">
                                <div class="accordion-body">
                                    <p>This option provides the fundamental coverage for your motorcycle. After
                                        completing your contact information and selecting your insurance package, please
                                        submit the form to the Insurance Advisor at the address below. You will receive
                                        an invitation to attend an information session. We aim to provide you with as
                                        much information as possible about our insurance policies. At the end of the
                                        session, you may complete the application for insurance and pay the $100
                                        insurance fee.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="fas fa-shield-alt"></i> Comprehensive Motorcycle Insurance
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                 data-bs-parent="#insurancePackages">
                                <div class="accordion-body">
                                    <p>This package offers complete protection for your motorcycle, including accident
                                        and theft insurance. Additionally, you will receive monthly newsletters with
                                        updates on your insurance coverage. The insurance fee is $150 per year.
                                        Comprehensive insurance not only covers basic liabilities but also includes
                                        coverage for damage caused by natural disasters, fire, and vandalism. This
                                        ensures that you have peace of mind in any situation.</p>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapseThree" aria-expanded="false"
                                        aria-controls="collapseThree">
                                    <i class="fas fa-shield-alt"></i> Premium Motorcycle Insurance
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                 data-bs-parent="#insurancePackages">
                                <div class="accordion-body">
                                    <p>Our premium package provides the highest level of coverage. This includes all the
                                        benefits of comprehensive insurance, plus additional features such as roadside
                                        assistance, rental reimbursement, and coverage for custom parts and equipment.
                                        The premium insurance fee is $250 per year. With this package, you are
                                        guaranteed the best support and quickest response in case of any incident. Our
                                        premium plan also includes a personal advisor who will assist you with all your
                                        insurance needs.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-4">
                <form id="actionForm" method="post">
                    <input type="hidden" name="contractID" value="${contract.contractID}">
                    <button type="button" onclick="confirmAction('accept')" class="btn btn-success me-2"><i
                            class="fas fa-check"></i> Accept
                    </button>
                    <button type="button" onclick="confirmAction('reject')" class="btn btn-danger me-2"><i
                            class="fas fa-times"></i> Reject
                    </button>
                    <a href="${pageContext.request.contextPath}/updateContract?contractID=${contract.contractID}"
                       class="btn btn-primary me-2"><i class="fas fa-edit"></i> Update</a>
                    <a href="${pageContext.request.contextPath}/listWaitingContract" class="btn btn-secondary"><i
                            class="fas fa-arrow-left"></i> Back to List</a>
                </form>
            </div>
        </div>
        <div class="card-footer text-center bg-primary text-white">
            <p>Motorcycle Insurance Company, 123 Hola Street, District Thach That, Ha Noi, Vietnam</p>
            <p>Phone: 0123-456-789 | <a href="http://www.motorcycleinsurance.vn"
                                        class="text-white text-decoration-none">www.motorcycleinsurance.vn</a></p>
        </div>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>