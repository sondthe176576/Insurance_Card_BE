<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Contract</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewContract.css">
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Link image slider -->
<img src="${pageContext.request.contextPath}/img/slider.jpg" alt="Slider Image" style="width: 100%; margin-bottom: 20px;">
<!-- End of image slider -->
<!-- Notification Message -->
<c:if test="${param.message != null}">
    <div id="notification" class="notification ${param.status eq 'true' ? 'alert-success' : 'alert-danger'}">
        <button type="button" class="close-btn" onclick="document.getElementById('notification').style.display='none'">&times;</button>
        <c:out value="${param.message}"/>
    </div>
</c:if>
<!-- End of Notification Message -->
<!-- Form -->
<div class="container">
    <div class="title">Contract Information</div>

    <div class="section grid-2-columns">
        <div>
            <h2>Customer Information</h2>
            <div class="form-group">
                <label for="customerID">Customer ID:</label>
                <input type="number" id="customerID" name="customerID" value="${contract.customer.customerID}" readonly>
            </div>
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" value="${contract.customer.user.fullName}" readonly>
            </div>
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" value="${contract.customer.user.firstName}" readonly>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" value="${contract.customer.user.lastName}" readonly>
            </div>
            <div class="form-group">
                <label for="province">Province:</label>
                <input type="text" id="province" name="province" value="${contract.customer.user.province}" readonly>
            </div>
            <div class="form-group">
                <label for="district">District:</label>
                <input type="text" id="district" name="district" value="${contract.customer.user.district}" readonly>
            </div>
            <div class="form-group">
                <label for="country">Country:</label>
                <input type="text" id="country" name="country" value="${contract.customer.user.country}" readonly>
            </div>
            <div class="form-group">
                <label for="birthDate">Birth Date:</label>
                <input type="date" id="birthDate" name="birthDate" value="<fmt:formatDate value='${contract.customer.user.birthDate}' pattern='yyyy-MM-dd'/>" readonly>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile:</label>
                <input type="text" id="mobile" name="mobile" value="${contract.customer.user.mobile}" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${contract.customer.user.email}" readonly>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender" value="${contract.customer.user.gender}" readonly>
            </div>
        </div>

        <div>
            <h2>Vehicle Information</h2>
            <div class="form-group">
                <label for="motorcycleID">Motorcycle ID:</label>
                <input type="number" id="motorcycleID" name="motorcycleID" value="${contract.motorcycle.motorcycleID}" readonly>
            </div>
            <div class="form-group">
                <label for="licensePlate">License Plate:</label>
                <input type="text" id="licensePlate" name="licensePlate" value="${contract.motorcycle.licensePlate}" readonly>
            </div>
            <div class="form-group">
                <label for="brand">Brand:</label>
                <input type="text" id="brand" name="brand" value="${contract.motorcycle.brand}" readonly>
            </div>
            <div class="form-group">
                <label for="model">Model:</label>
                <input type="text" id="model" name="model" value="${contract.motorcycle.model}" readonly>
            </div>
            <div class="form-group">
                <label for="yearOfManufacture">Year of Manufacture:</label>
                <input type="number" id="yearOfManufacture" name="yearOfManufacture" value="${contract.motorcycle.yearOfManufacture}" readonly>
            </div>
            <div class="form-group">
                <label for="color">Color:</label>
                <input type="text" id="color" name="color" value="${contract.motorcycle.color}" readonly>
            </div>
            <div class="form-group">
                <label for="engineNumber">Engine Number:</label>
                <input type="text" id="engineNumber" name="engineNumber" value="${contract.motorcycle.engineNumber}" readonly>
            </div>
            <div class="form-group">
                <label for="frameNumber">Frame Number:</label>
                <input type="text" id="frameNumber" name="frameNumber" value="${contract.motorcycle.frameNumber}" readonly>
            </div>
        </div>
    </div>

    <div class="section grid-2-columns">
        <div>
            <h2>Insurance Information</h2>
            <div class="form-group">
                <label for="contractID">Contract ID:</label>
                <input type="number" id="contractID" name="contractID" value="${contract.contractID}" readonly>
            </div>
            <div class="form-group">
                <label for="contractInfo">Contract Info:</label>
                <input type="text" id="contractInfo" name="contractInfo" value="${contract.contractInfo}" readonly>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" value="${contract.status}" readonly>
            </div>
            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="text" id="startDate" name="startDate" value="<fmt:formatDate value='${contract.startDate}' pattern='dd-MM-yyyy'/>" readonly>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label>
                <input type="text" id="endDate" name="endDate" value="<fmt:formatDate value='${contract.endDate}' pattern='dd-MM-yyyy'/>" readonly>
            </div>
            <div class="form-group">
                <label>Time remaining:</label>
                <p style="color: red;">
                    <c:out value="${diffDays}"/> days
                </p>
            </div>
            <div class="form-group">
                <label for="value">Value: (The corresponding value for the contract detail, which can be the compensation amount or the insurance value)</label>
                <input type="text" id="value" name="value" value="<fmt:formatNumber value='${contract.value}' type='currency' currencySymbol='$'/>" readonly>
            </div>
            <div class="form-group">
                <label for="detail">Detail: (Describe the specific details of the contract, such as insurance terms and conditions)</label>
                <textarea id="detail" name="detail" readonly>${contract.detail}</textarea>
            </div>
            <div class="form-group">
                <label for="insuranceType">Insurance Type:</label>
                <input type="text" id="insuranceType" name="insuranceType" value="${contract.insuranceType}" readonly>
            </div>
            <div class="form-group">
                <label for="coverage">Coverage: (Describe the insurance coverage, risks, and damages covered by the contract)</label>
                <input type="text" id="coverage" name="coverage" value="${contract.coverage}" readonly>
            </div>
            <div class="form-group">
                <label for="premium">Premium: (The insurance fee that the customer must pay to maintain the insurance contract)</label>
                <input type="text" id="premium" name="premium" value="<fmt:formatNumber value='${contract.premium}' type='currency' currencySymbol='$'/>" readonly>
            </div>
        </div>

        <div>
            <h2>Insurance Packages</h2>
            <div class="membership-info">
                <p><strong>Basic Motorcycle Insurance</strong> – This option provides the fundamental coverage for your motorcycle. After completing your contact information and selecting your insurance package, please submit the form to the Insurance Advisor at the address below. You will receive an invitation to attend an information session. We aim to provide you with as much information as possible about our insurance policies. At the end of the session, you may complete the application for insurance and pay the $100 insurance fee.</p>
                <p><strong>Comprehensive Motorcycle Insurance</strong> – This package offers complete protection for your motorcycle, including accident and theft insurance. Additionally, you will receive monthly newsletters with updates on your insurance coverage. The insurance fee is $150 per year. Comprehensive insurance not only covers basic liabilities but also includes coverage for damage caused by natural disasters, fire, and vandalism. This ensures that you have peace of mind in any situation.</p>
                <p><strong>Premium Motorcycle Insurance</strong> – Our premium package provides the highest level of coverage. This includes all the benefits of comprehensive insurance, plus additional features such as roadside assistance, rental reimbursement, and coverage for custom parts and equipment. The premium insurance fee is $250 per year. With this package, you are guaranteed the best support and quickest response in case of any incident. Our premium plan also includes a personal advisor who will assist you with all your insurance needs.</p>
                <p>Choosing the right insurance package ensures that your motorcycle is well-protected and that you receive the support you need in case of any accidents or incidents. Our team is dedicated to helping you understand the different options and choose the one that best suits your needs.</p>
            </div>
        </div>
    </div>

    <div class="section address-info">
        <h3>Application can be dropped off or mailed to:</h3>
        <p>Motorcycle Insurance Company,<br>
            123 Hola Street,<br>
            District Thach That, Ha Noi,<br>
            Vietnam</p>
        <p>Phone: 0123-456-789<br>
            <a href="http://www.motorcycleinsurance.vn">www.motorcycleinsurance.vn</a></p>
    </div>

    <div class="section btn-container">
        <a href="${pageContext.request.contextPath}/updateContract?contractID=${contract.contractID}" class="btn">Update Contract</a>
        <a href="${pageContext.request.contextPath}/renewContract?contractID=${contract.contractID}" class="btn">Renew Contract</a>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
<!-- Notification Message Script -->
<script>
    setTimeout(function () {
        var notification = document.getElementById('notification');
        if (notification) {
            notification.style.opacity = '0';
            setTimeout(function() {
                notification.style.display = 'none';
            }, 300);
        }
    }, 5000);
</script>
<!-- End of Notification Message Script -->
</body>
</html>
