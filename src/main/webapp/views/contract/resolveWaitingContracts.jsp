<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resolve Waiting Contracts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.4.2/cdn.min.js" defer></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
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
        <div class="card-header bg-blue-600 text-white text-center">
            <h2 class="text-3xl font-bold"><i class="fas fa-file-alt"></i> Resolve Waiting Contracts</h2>
        </div>
        <div class="card-body mt-6">
            <form id="resolveContractForm" action="${pageContext.request.contextPath}/resolveWaitingContract" method="post">
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
                            <input type="text" id="startDate" name="startDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.startDate}' pattern='dd-MM-yyyy'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="endDate" class="form-label font-bold text-gray-700">End Date:</label>
                            <input type="text" id="endDate" name="endDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.endDate}' pattern='dd-MM-yyyy'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label class="form-label font-bold text-gray-700">Time remaining:</label>
                            <p class="text-red-500"><c:out value="${diffDays}"/> days</p>
                        </div>
                        <div class="mb-4">
                            <label for="value" class="form-label font-bold text-gray-700">Value:</label>
                            <input type="text" id="value" name="value" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatNumber value='${contract.value}' type='currency' currencySymbol='$'/>" readonly>
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
                        <div class="mb-4">
                            <label for="premium" class="form-label font-bold text-gray-700">Premium:</label>
                            <input type="text" id="premium" name="premium" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatNumber value='${contract.premium}' type='currency' currencySymbol='$'/>" readonly>
                        </div>
                    </div>
                    <div>
                        <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-dollar-sign"></i> Payment Information</h4>
                        <div class="mb-4">
                            <label for="paymentMethodType" class="form-label font-bold text-gray-700">Payment Method:</label>
                            <input type="text" id="paymentMethodType" name="paymentMethodType" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.paymentMethod.methodType}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="paymentDetails" class="form-label font-bold text-gray-700">Payment Details:</label>
                            <textarea id="paymentDetails" name="paymentDetails" class="form-textarea bg-gray-100 p-2 rounded w-full" rows="3" readonly>${contract.paymentMethod.details}</textarea>
                        </div>
                        <div class="mb-4">
                            <label for="paymentAmount" class="form-label font-bold text-gray-700">Payment Amount:</label>
                            <input type="text" id="paymentAmount" name="paymentAmount" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatNumber value='${contract.paymentHistory.amount}' type='currency' currencySymbol='$'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="paymentDate" class="form-label font-bold text-gray-700">Payment Date:</label>
                            <input type="text" id="paymentDate" name="paymentDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.paymentHistory.paymentDate}' pattern='dd-MM-yyyy'/>" readonly>
                        </div>
                    </div>
                </div>
                <div class="mt-6">
                    <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-box"></i> Insurance Packages</h4>
                    <div x-data="{ open: 'basic' }">
                        <div class="border rounded mb-4">
                            <button type="button" @click="open = (open === 'basic' ? null : 'basic')" class="w-full text-left p-4 bg-gray-100 font-bold flex justify-between items-center">
                                <span><i class="fas fa-check-circle text-success me-2"></i> Basic Motorcycle Insurance</span>
                                <i :class="open === 'basic' ? 'fas fa-chevron-up' : 'fas fa-chevron-down'"></i>
                            </button>
                            <div x-show="open === 'basic'" class="p-4">
                                This option provides the fundamental coverage for your motorcycle. After
                                completing your contact information and selecting your insurance package, please
                                submit the form to the Insurance Advisor at the address below. You will receive
                                an invitation to attend an information session. We aim to provide you with as
                                much information as possible about our insurance policies. At the end of the
                                session, you may complete the application for insurance and pay the $100
                                insurance fee.
                            </div>
                        </div>
                        <div class="border rounded mb-4">
                            <button type="button" @click="open = (open === 'comprehensive' ? null : 'comprehensive')" class="w-full text-left p-4 bg-gray-100 font-bold flex justify-between items-center">
                                <span><i class="fas fa-check-circle text-success me-2"></i> Comprehensive Motorcycle Insurance</span>
                                <i :class="open === 'comprehensive' ? 'fas fa-chevron-up' : 'fas fa-chevron-down'"></i>
                            </button>
                            <div x-show="open === 'comprehensive'" class="p-4">
                                This package offers complete protection for your motorcycle, including accident
                                and theft insurance. Additionally, you will receive monthly newsletters with
                                updates on your insurance coverage. The insurance fee is $150 per year.
                                Comprehensive insurance not only covers basic liabilities but also includes
                                coverage for damage caused by natural disasters, fire, and vandalism. This
                                ensures that you have peace of mind in any situation.
                            </div>
                        </div>
                        <div class="border rounded mb-4">
                            <button type="button" @click="open = (open === 'premium' ? null : 'premium')" class="w-full text-left p-4 bg-gray-100 font-bold flex justify-between items-center">
                                <span><i class="fas fa-check-circle text-success me-2"></i> Premium Motorcycle Insurance</span>
                                <i :class="open === 'premium' ? 'fas fa-chevron-up' : 'fas fa-chevron-down'"></i>
                            </button>
                            <div x-show="open === 'premium'" class="p-4">
                                Our premium package provides the highest level of coverage. This includes all
                                the benefits of comprehensive insurance, plus additional features such as
                                roadside assistance, rental reimbursement, and coverage for custom parts and
                                equipment. The premium insurance fee is $250 per year. With this package, you
                                are guaranteed the best support and quickest response in case of any incident.
                                Our premium plan also includes a personal advisor who will assist you with all
                                your insurance needs.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center mt-6">
                    <input type="hidden" name="contractID" value="${contract.contractID}">
                    <button type="button" onclick="showModal('accept')" class="btn-custom bg-green-600 text-white py-2 px-4 rounded shadow-md transition transform hover:scale-105 hover:bg-green-700 mr-4"><i class="fas fa-check"></i> Accept</button>
                    <button type="button" onclick="showModal('reject')" class="btn-custom bg-red-600 text-white py-2 px-4 rounded shadow-md transition transform hover:scale-105 hover:bg-red-700 mr-4"><i class="fas fa-times"></i> Reject</button>
                    <a href="${pageContext.request.contextPath}/listWaitingContracts" class="btn-custom bg-gray-600 text-white py-2 px-4 rounded shadow-md transition transform hover:scale-105 hover:bg-gray-700"><i class="fas fa-arrow-left"></i> Back to List</a>
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
            Are you sure you want to proceed?
        </div>
        <div class="text-center">
            <button type="button" class="btn modal-btn bg-green-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105" onclick="confirmAction()">Yes</button>
            <button type="button" class="btn modal-btn bg-red-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-4" onclick="document.getElementById('confirmationModal').classList.add('hidden')">No</button>
            <input type="hidden" id="modal-status" value=""/>
        </div>
    </div>
</div>
<!-- End of modal -->
<script>
    function showModal(action) {
        document.getElementById('modal-status').value = action;
        document.getElementById('confirmationModal').classList.remove('hidden');
    }

    function confirmAction() {
        const action = document.getElementById('modal-status').value;
        document.getElementById('resolveContractForm').action = contextPath + "/resolveWaitingContract?action=" + action;
        document.getElementById('resolveContractForm').submit();
    }
</script>
</body>
</html>