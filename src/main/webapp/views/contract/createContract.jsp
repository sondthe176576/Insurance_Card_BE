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
<html>
<head>
    <title>Create New Contract</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createContract.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/createContract.js"></script>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header_logout.jsp"/>
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
<!-- End of notification message -->
<!-- Form -->
<div class="container">
    <div class="card p-4 shadow-sm">
        <h2 class="text-center mb-4">Create New Contract</h2>
        <form id="createContractForm" action="${pageContext.request.contextPath}/createContract" method="post">
            <div class="row mb-4">
                <div class="col-md-6">
                    <h3 class="mb-3">Customer Information</h3>
                    <!-- Customer Information Fields -->
                    <div class="mb-3">
                        <label for="customerID" class="form-label">Customer ID:</label>
                        <input type="number" id="customerID" name="customerID" class="form-control"
                               value="${customer.customerID}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="customerUsername" class="form-label">Customer Username:</label>
                        <input type="text" id="customerUsername" name="customerUsername" class="form-control"
                               value="${customer.user.username}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="customerName" class="form-label">Customer Name:</label>
                        <input type="text" id="customerName" name="customerName" class="form-control"
                               value="${customer.user.fullName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name:</label>
                        <input type="text" id="firstName" name="firstName" class="form-control"
                               value="${customer.user.firstName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" class="form-control"
                               value="${customer.user.lastName}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="customerPhone" class="form-label">Customer Phone:</label>
                        <input type="text" id="customerPhone" name="customerPhone" class="form-control"
                               value="${customer.user.mobile}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="customerEmail" class="form-label">Customer Email:</label>
                        <input type="email" id="customerEmail" name="customerEmail" class="form-control"
                               value="${customer.user.email}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="customerGender" class="form-label">Gender:</label>
                        <input type="text" id="customerGender" name="customerGender" class="form-control"
                               value="${customer.user.gender}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="province" class="form-label">Province:</label>
                        <input type="text" id="province" name="province" class="form-control"
                               value="${customer.user.province}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="district" class="form-label">District:</label>
                        <input type="text" id="district" name="district" class="form-control"
                               value="${customer.user.district}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="country" class="form-label">Country:</label>
                        <input type="text" id="country" name="country" class="form-control"
                               value="${customer.user.country}" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="birthDate" class="form-label">Birth Date:</label>
                        <input type="date" id="birthDate" name="birthDate" class="form-control"
                               value="<fmt:formatDate value='${customer.user.birthDate}' pattern='yyyy-MM-dd'/>"
                               readonly>
                    </div>
                </div>

                <div class="col-md-6">
                    <h3 class="mb-3">Motorcycle Information</h3>
                    <!-- Motorcycle Information Fields -->
                    <c:forEach var="motorcycle" items="${motorcycles}">
                        <div class="mb-3">
                            <label for="motorcycleID" class="form-label">Motorcycle ID:</label>
                            <input type="number" id="motorcycleID" name="motorcycleID" class="form-control"
                                   value="${motorcycle.motorcycleID}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="licensePlate" class="form-label">License Plate:</label>
                            <input type="text" id="licensePlate" name="licensePlate" class="form-control"
                                   value="${motorcycle.licensePlate}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="brand" class="form-label">Brand:</label>
                            <input type="text" id="brand" name="brand" class="form-control" value="${motorcycle.brand}"
                                   readonly>
                        </div>
                        <div class="mb-3">
                            <label for="model" class="form-label">Model:</label>
                            <input type="text" id="model" name="model" class="form-control" value="${motorcycle.model}"
                                   readonly>
                        </div>
                        <div class="mb-3">
                            <label for="yearOfManufacture" class="form-label">Year Of Manufacture:</label>
                            <input type="number" id="yearOfManufacture" name="yearOfManufacture" class="form-control"
                                   value="${motorcycle.yearOfManufacture}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="color" class="form-label">Color:</label>
                            <input type="text" id="color" name="color" class="form-control" value="${motorcycle.color}"
                                   readonly>
                        </div>
                        <div class="mb-3">
                            <label for="engineNumber" class="form-label">Engine Number:</label>
                            <input type="text" id="engineNumber" name="engineNumber" class="form-control"
                                   value="${motorcycle.engineNumber}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="frameNumber" class="form-label">Frame Number:</label>
                            <input type="text" id="frameNumber" name="frameNumber" class="form-control"
                                   value="${motorcycle.frameNumber}" readonly>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <h3 class="mb-3">Contract Information</h3>
                    <div class="mb-3">
                        <label for="contractYears" class="form-label">Contract Years:</label>
                        <input type="number" id="contractYears" name="contractYears" class="form-control" min="1"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Start Date:</label>
                        <input type="date" id="startDate" name="startDate" class="form-control" required readonly>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">End Date:</label>
                        <input type="date" id="endDate" name="endDate" class="form-control" required readonly>
                    </div>
                    <div class="mb-3">
                        <label for="insuranceType" class="form-label">Insurance Type:</label>
                        <select id="insuranceType" name="insuranceType" class="form-select" required>
                            <option value="">Select Insurance Type</option>
                            <option value="Basic">Basic</option>
                            <option value="Comprehensive">Comprehensive</option>
                            <option value="Premium">Premium</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="contractInfo" class="form-label">Contract Info:</label>
                        <input type="text" id="contractInfo" name="contractInfo" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="value" class="form-label">Value:</label>
                        <input type="number" id="value" name="value" class="form-control" step="50" min="50" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="detail" class="form-label">Detail:</label>
                        <textarea id="detail" name="detail" class="form-control" rows="3" required readonly></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="coverage" class="form-label">Coverage:</label>
                        <input type="text" id="coverage" name="coverage" class="form-control" required readonly>
                    </div>
                    <div class="mb-3">
                        <label for="premium" class="form-label">Premium:</label>
                        <input type="number" id="premium" name="premium" class="form-control" step="50" min="50"
                               required readonly>
                    </div>
                </div>

                <div class="col-md-6">
                    <h3 class="mb-3">Payment Information</h3>
                    <div class="mb-3">
                        <label for="paymentMethod" class="form-label">Payment Method:</label>
                        <select id="paymentMethod" name="paymentMethod" class="form-select" required>
                            <option value="">Select Payment Method</option>
                            <option value="cash">Cash</option>
                            <option value="bankTransfer">Bank Transfer</option>
                        </select>
                    </div>
                    <div class="section" id="cashPaymentDetails" style="display:none;">
                        <div class="alert alert-danger">
                            <i class="bi bi-exclamation-circle-fill"></i>
                            <strong>Cash Payment Details</strong>
                            <p>Please bring your contract to our office to complete the payment in cash.</p>
                            <div class="address-info">
                                <p>Motorcycle Insurance Company,<br>
                                    123 Hola Street,<br>
                                    Thach That District, Hanoi,<br>
                                    Vietnam</p>
                                <p>Phone: 0123-456-789<br>
                                    <a href="http://www.motorcycleinsurance.vn">www.motorcycleinsurance.vn</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="section" id="bankTransferDetails" style="display:none;">
                        <div class="alert alert-danger">
                            <i class="bi bi-exclamation-circle-fill"></i>
                            <strong>Bank Transfer Details</strong>
                            <p>You will be redirected to the bank transfer page to complete the payment.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-12">
                    <h3 class="mb-3">Insurance Packages</h3>
                    <div class="accordion" id="insurancePackages">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Basic Motorcycle Insurance
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
                                    Comprehensive Motorcycle Insurance
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
                                    Premium Motorcycle Insurance
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

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary btn-lg w-100">Create Contract</button>
        </form>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>