<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Renew Contract</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.4.2/cdn.min.js" defer></script>
    <script>
        function calculateEndDate() {
            const startDate = new Date(document.getElementById('newStartDate').value);
            const renewalYears = parseInt(document.getElementById('renewalYears').value);
            const value = parseFloat(document.getElementById('value').dataset.originalValue);

            if (!isNaN(renewalYears) && renewalYears > 0 && !isNaN(value) && !isNaN(startDate.getTime())) {
                const endDate = new Date(startDate);
                endDate.setFullYear(startDate.getFullYear() + renewalYears);
                document.getElementById('newEndDate').value = endDate.toISOString().split('T')[0];

                const newValue = value * renewalYears;
                document.getElementById('value').value = newValue.toFixed(2);
            }
        }

        function showConfirmationModal() {
            document.getElementById('confirmationModal').classList.remove('hidden');
        }

        function confirmRenewal() {
            document.getElementById('renewContractForm').submit();
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('newStartDate').value = today;
            calculateEndDate();
        });
    </script>
</head>
<body class="bg-gray-100 font-sans">
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Notification Message -->
<c:if test="${not empty message}">
    <div id="notification" class="alert ${status ? 'alert-success' : 'alert-danger'} alert-dismissible fade show fixed top-0 left-1/2 transform -translate-x-1/2 z-50"
         role="alert">
        <c:out value="${message}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<!-- End of Notification Message -->
<!-- Form -->
<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-lg">
    <div class="card">
        <div class="card-header text-center bg-blue-600 text-white">
            <h2 class="text-3xl font-bold"><i class="fas fa-file-signature"></i> Renew Contract</h2>
        </div>
        <div class="card-body mt-6">
            <form id="renewContractForm" action="${pageContext.request.contextPath}/renewContract" method="post">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                        <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-user"></i> Customer Information</h4>
                        <div class="mb-4">
                            <label for="customerID" class="form-label font-bold text-gray-700">Customer ID:</label>
                            <input type="number" id="customerID" name="customerID" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.customerID}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="fullName" class="form-label font-bold text-gray-700">Full Name:</label>
                            <input type="text" id="fullName" name="fullName" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.fullName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="firstName" class="form-label font-bold text-gray-700">First Name:</label>
                            <input type="text" id="firstName" name="firstName" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.firstName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="lastName" class="form-label font-bold text-gray-700">Last Name:</label>
                            <input type="text" id="lastName" name="lastName" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.lastName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="province" class="form-label font-bold text-gray-700">Province:</label>
                            <input type="text" id="province" name="province" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.province}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="district" class="form-label font-bold text-gray-700">District:</label>
                            <input type="text" id="district" name="district" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.district}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="country" class="form-label font-bold text-gray-700">Country:</label>
                            <input type="text" id="country" name="country" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.country}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="birthDate" class="form-label font-bold text-gray-700">Birth Date:</label>
                            <input type="date" id="birthDate" name="birthDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.customer.user.birthDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="mobile" class="form-label font-bold text-gray-700">Mobile:</label>
                            <input type="text" id="mobile" name="mobile" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.mobile}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="email" class="form-label font-bold text-gray-700">Email:</label>
                            <input type="email" id="email" name="email" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.email}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="gender" class="form-label font-bold text-gray-700">Gender:</label>
                            <input type="text" id="gender" name="gender" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.gender}" readonly>
                        </div>
                    </div>
                    <div>
                        <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-motorcycle"></i> Vehicle Information</h4>
                        <div class="mb-4">
                            <label for="motorcycleID" class="form-label font-bold text-gray-700">Motorcycle ID:</label>
                            <input type="number" id="motorcycleID" name="motorcycleID" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.motorcycleID}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="licensePlate" class="form-label font-bold text-gray-700">License Plate:</label>
                            <input type="text" id="licensePlate" name="licensePlate" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.licensePlate}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="brand" class="form-label font-bold text-gray-700">Brand:</label>
                            <input type="text" id="brand" name="brand" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.brand}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="model" class="form-label font-bold text-gray-700">Model:</label>
                            <input type="text" id="model" name="model" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.model}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="yearOfManufacture" class="form-label font-bold text-gray-700">Year of Manufacture:</label>
                            <input type="number" id="yearOfManufacture" name="yearOfManufacture" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.yearOfManufacture}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="color" class="form-label font-bold text-gray-700">Color:</label>
                            <input type="text" id="color" name="color" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.color}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="engineNumber" class="form-label font-bold text-gray-700">Engine Number:</label>
                            <input type="text" id="engineNumber" name="engineNumber" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.engineNumber}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="frameNumber" class="form-label font-bold text-gray-700">Frame Number:</label>
                            <input type="text" id="frameNumber" name="frameNumber" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.motorcycle.frameNumber}" readonly>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                    <div>
                        <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-file-contract"></i> Contract Information</h4>
                        <div class="mb-4">
                            <label for="contractID" class="form-label font-bold text-gray-700">Contract ID:</label>
                            <input type="number" id="contractID" name="contractID" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.contractID}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="contractInfo" class="form-label font-bold text-gray-700">Contract Info:</label>
                            <input type="text" id="contractInfo" name="contractInfo" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.contractInfo}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="status" class="form-label font-bold text-gray-700">Status:</label>
                            <input type="text" id="status" name="status" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.status}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="startDate" class="form-label font-bold text-gray-700">Start Date:</label>
                            <input type="date" id="startDate" name="startDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.startDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="endDate" class="form-label font-bold text-gray-700">End Date:</label>
                            <input type="date" id="endDate" name="endDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.endDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="premium" class="form-label font-bold text-gray-700">Premium:</label>
                            <input type="number" id="premium" name="premium" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.premium}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="detail" class="form-label font-bold text-gray-700">Detail:</label>
                            <textarea id="detail" name="detail" class="form-textarea bg-gray-100 p-2 rounded w-full" rows="3" readonly>${contract.detail}</textarea>
                        </div>
                        <div class="mb-4">
                            <label for="insuranceType" class="form-label font-bold text-gray-700">Insurance Type:</label>
                            <input type="text" id="insuranceType" name="insuranceType" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.insuranceType}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="coverage" class="form-label font-bold text-gray-700">Coverage:</label>
                            <input type="text" id="coverage" name="coverage" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.coverage}" readonly>
                        </div>
                    </div>
                    <div>
                        <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-pen"></i> Renew Contract</h4>
                        <div class="mb-4">
                            <label for="renewalYears" class="form-label font-bold text-gray-700">Renewal Years:</label>
                            <input type="number" id="renewalYears" name="renewalYears" class="form-input bg-gray-100 p-2 rounded w-full" min="1" required oninput="calculateEndDate()">
                        </div>
                        <div class="mb-4">
                            <label for="newStartDate" class="form-label font-bold text-gray-700">New Start Date:</label>
                            <input type="date" id="newStartDate" name="newStartDate" class="form-input bg-gray-100 p-2 rounded w-full" required readonly>
                        </div>
                        <div class="mb-4">
                            <label for="newEndDate" class="form-label font-bold text-gray-700">New End Date:</label>
                            <input type="date" id="newEndDate" name="newEndDate" class="form-input bg-gray-100 p-2 rounded w-full" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="value" class="form-label font-bold text-gray-700">Value:</label>
                            <input type="number" id="value" name="value" class="form-input bg-gray-100 p-2 rounded w-full" data-original-value="${contract.value}" readonly>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center mt-6">
                    <button type="button" class="btn-custom bg-blue-600 text-white py-2 px-4 rounded shadow-md transition transform hover:scale-105 hover:bg-blue-700 mr-4" onclick="showConfirmationModal()"><i class="fas fa-file-signature"></i> Renew Contract</button>
                    <a href="${pageContext.request.contextPath}/listRenewContract" class="btn-custom bg-gray-600 text-white py-2 px-4 rounded shadow-md transition transform hover:scale-105 hover:bg-gray-700"><i class="fas fa-arrow-left"></i> Back to List</a>
                </div>
            </form>
        </div>
        <div class="card-footer text-center bg-blue-600 text-white mt-6 py-4">
            <p>Motorcycle Insurance Company, 123 Hola Street, District Thach That, Ha Noi, Vietnam</p>
            <p>Phone: 0123-456-789 | <a href="http://www.motorcycleinsurance.vn" class="text-white">www.motorcycleinsurance.vn</a></p>
        </div>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->

<!-- Modal -->
<div class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden" id="confirmationModal">
    <div class="bg-white p-6 rounded-lg shadow-lg animate__animated animate__fadeIn">
        <div class="text-center mb-4">
            <h5 class="text-2xl font-bold text-gray-800" id="confirmationModalLabel">Confirmation</h5>
        </div>
        <div class="text-center mb-4">
            Are you sure you want to renew this contract?
        </div>
        <div class="text-center">
            <button type="button" class="btn modal-btn bg-green-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105" onclick="confirmRenewal()">Yes</button>
            <button type="button" class="btn modal-btn bg-red-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-4" onclick="document.getElementById('confirmationModal').classList.add('hidden')">No</button>
        </div>
    </div>
</div>
<!-- End of modal -->
</body>
</html>