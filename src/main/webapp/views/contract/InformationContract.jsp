<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/includes/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contract Details</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            font-size: 1.25rem; /* Increase base font size */
        }
        .input-field {
            border: 2px solid #e2e8f0;
            padding: 0.75rem 1rem;
            border-radius: 0.375rem;
            width: 100%;
            transition: border-color 0.3s ease;
        }
        .input-field:focus {
            border-color: #63b3ed;
            outline: none;
        }
        .input-label {
            font-weight: bold;
            margin-bottom: 0.5rem;
            display: block;
        }
        .alert {
            padding: 1rem 1.5rem;
            border-radius: 0.375rem;
            margin-bottom: 1.5rem;
        }
        .alert-info {
            background-color: #e5f6ff;
            color: #3182ce;
        }
        .btn {
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border-radius: 0.5rem;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .table-header {
            background-color: #004d99; /* Dark Blue */
            color: white;
        }
        .table-row {
            transition: all 0.2s ease-in-out;
        }
        .table-row:hover {
            background-color: #f1f1f1;
        }
        .modal {
            display: none;
        }
        .modal.show {
            display: block;
        }
        .modal-content {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            overflow: hidden;
        }
        .modal-header, .modal-footer {
            padding: 1rem;
            border-bottom: 1px solid #e2e8f0;
        }
        .modal-footer {
            border-top: 1px solid #e2e8f0;
            text-align: right;
        }
        .modal-body {
            padding: 1rem;
        }
        .text-red-500 {
            color: #f56565;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">
<!-- Include navbar -->
<nav class="bg-blue-900 border-b-4 border-orange-600">
    <div class="container mx-auto px-4 py-2 flex justify-center">
        <ul class="flex space-x-6">
            <li>
                <a href="${pageContext.request.contextPath}/homepageforcustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
            </li>
            <li>
                <a href="#" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/contractForCustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- End of navbar -->

<div class="container mx-auto py-8">
    <h1 class="text-4xl font-bold text-blue-900 mb-6 text-center animate__animated animate__fadeIn">Contract Details</h1>

    <div class="bg-white shadow-md rounded-lg p-6 mb-8">
        <div class="alert alert-info">
            <div class="mb-4">
                <label class="input-label">Contract ID:</label>
                <input type="text" class="input-field" value="${contract.contractID}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Customer ID:</label>
                <input type="text" class="input-field" value="${contract.customer.customerID}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Contract Info:</label>
                <input type="text" class="input-field" value="${contract.contractInfo}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Status:</label>
                <input type="text" class="input-field" value="${contract.status}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Start Date:</label>
                <input type="text" class="input-field" value="<fmt:formatDate value='${contract.startDate}' pattern='yyyy-MM-dd'/>" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">End Date:</label>
                <input type="text" class="input-field" value="<fmt:formatDate value='${contract.endDate}' pattern='yyyy-MM-dd'/>" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Days Remaining:</label>
                <input type="text" class="input-field" value="${diffDays} days remaining" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Insurance Type:</label>
                <input type="text" class="input-field" value="${contract.insuranceType}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Coverage:</label>
                <input type="text" class="input-field" value="${contract.coverage}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Premium:</label>
                <input type="text" class="input-field" value="<fmt:formatNumber value='${contract.premium}' type='currency' currencySymbol='$'/>" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Cancellation Date:</label>
                <input type="text" class="input-field" value="<fmt:formatDate value='${contract.cancellationDate}' pattern='yyyy-MM-dd'/>" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Detail:</label>
                <textarea class="input-field" readonly>${contract.detail}</textarea>
            </div>
            <div class="mb-4">
                <label class="input-label">Value:</label>
                <input type="text" class="input-field" value="<fmt:formatNumber value='${contract.value}' type='currency' currencySymbol='$'/>" readonly>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <div class="bg-white shadow-md rounded-lg p-6">
            <h2 class="text-2xl font-bold text-blue-900 mb-4 animate__animated animate__fadeIn">Customer Information</h2>
            <div class="mb-4">
                <label class="input-label">User ID:</label>
                <input type="text" class="input-field" value="${contract.customer.user.userID}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Username:</label>
                <input type="text" class="input-field" value="${contract.customer.user.username}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Email:</label>
                <input type="email" class="input-field" value="${contract.customer.user.email}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Mobile:</label>
                <input type="text" class="input-field" value="${contract.customer.user.mobile}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Full Name:</label>
                <input type="text" class="input-field" value="${contract.customer.user.fullName}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Gender:</label>
                <input type="text" class="input-field" value="${contract.customer.user.gender}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Province:</label>
                <input type="text" class="input-field" value="${contract.customer.user.province}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">District:</label>
                <input type="text" class="input-field" value="${contract.customer.user.district}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Country:</label>
                <input type="text" class="input-field" value="${contract.customer.user.country}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">First Name:</label>
                <input type="text" class="input-field" value="${contract.customer.user.firstName}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Last Name:</label>
                <input type="text" class="input-field" value="${contract.customer.user.lastName}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Birth Date:</label>
                <input type="text" class="input-field" value="<fmt:formatDate value='${contract.customer.user.birthDate}' pattern='yyyy-MM-dd'/>" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Personal Info:</label>
                <textarea class="input-field" readonly>${contract.customer.personalInfo}</textarea>
            </div>
        </div>

        <div class="bg-white shadow-md rounded-lg p-6">
            <h2 class="text-2xl font-bold text-blue-900 mb-4 animate__animated animate__fadeIn">Motorcycle Information</h2>
            <div class="mb-4">
                <label class="input-label">Motorcycle ID:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.motorcycleID}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">License Plate:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.licensePlate}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Brand:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.brand}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Model:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.model}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Frame Number:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.frameNumber}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Engine Number:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.engineNumber}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Year of Manufacture:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.yearOfManufacture}" readonly>
            </div>
            <div class="mb-4">
                <label class="input-label">Color:</label>
                <input type="text" class="input-field" value="${contract.motorcycle.color}" readonly>
            </div>
        </div>
    </div>

    <div class="flex justify-center space-x-4">
        <c:choose>
            <c:when test="${contract.status == 'Rejected'}">
                <div class="alert alert-warning text-red-500">
                    Your contract has been rejected.
                </div>
            </c:when>
            <c:otherwise>
                <button type="button" class="btn btn-primary" onclick="requestRenewal('${contract.contractID}', '${contract.customer.user.email}')">
                    <i class="fas fa-sync-alt mr-2"></i>Request Renew Contract
                </button>
                <form id="cancelForm" action="${pageContext.request.contextPath}/cancelContract" method="post" class="inline">
                    <input type="hidden" name="contractId" value="${contract.contractID}">
                    <input type="hidden" name="contractValue" value="${contract.value}">
                    <input type="hidden" name="contractStatus" value="${contract.status}">
                    <button type="button" class="btn btn-danger" onclick="showCancelModal('${contract.status}')">
                        <i class="fas fa-times mr-2"></i>Cancel Contract
                    </button>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Renew Confirmation Modal -->
<div class="fixed z-10 inset-0 overflow-y-auto modal" id="renewModal">
    <div class="flex items-center justify-center min-h-screen">
        <div class="modal-content w-full max-w-md">
            <div class="modal-header bg-blue-900 text-white">
                <h5 class="text-2xl font-bold">Request Renew Contract</h5>
            </div>
            <div class="modal-body">
                <form id="renewForm" action="${pageContext.request.contextPath}/requestRenewContract" method="post">
                    <div class="mb-4">
                        <label for="renewYears" class="input-label">Number of years to renew:</label>
                        <input type="number" class="input-field mt-1" id="renewYears" name="renewYears" required min="1" value="1" oninput="updateRenewalInfo()">
                    </div>
                    <input type="hidden" id="customerEmail" name="customerEmail" value="">
                    <input type="hidden" id="contractId" name="contractId" value="">
                    <div class="mb-4">
                        <label class="input-label">New End Date:</label>
                        <input type="text" class="input-field mt-1" id="newEndDate" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="input-label">Premium:</label>
                        <input type="text" class="input-field mt-1" id="newPremium" readonly>
                    </div>
                    <div class="mb-4">
                        <label class="input-label">Total Value:</label>
                        <input type="text" class="input-field mt-1" id="newValue" readonly>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary mr-2" onclick="hideRenewModal()">No</button>
                <button type="button" class="btn btn-primary" onclick="submitRenewForm()">Yes, Renew Contract</button>
            </div>
        </div>
    </div>
</div>

<!-- Cancel Confirmation Modal -->
<div class="fixed z-10 inset-0 overflow-y-auto modal" id="cancelModal">
    <div class="flex items-center justify-center min-h-screen">
        <div class="modal-content w-full max-w-md">
            <div class="modal-header bg-red-600 text-white">
                <h5 class="text-2xl font-bold">Cancel Contract</h5>
            </div>
            <div class="modal-body">
                <div id="cancelMessage" class="mb-4">
                    <!-- The message will be dynamically set by JavaScript -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary mr-2" onclick="hideCancelModal()">No</button>
                <button type="button" class="btn btn-danger" onclick="confirmCancel()">Yes, Cancel Contract</button>
            </div>
        </div>
    </div>
</div>

<!-- Alert Modal -->
<div class="fixed z-10 inset-0 overflow-y-auto modal" id="alertModal">
    <div class="flex items-center justify-center min-h-screen">
        <div class="modal-content w-full max-w-md">
            <div class="modal-header bg-yellow-500 text-white">
                <h5 class="text-2xl font-bold">Alert</h5>
            </div>
            <div class="modal-body">
                <div id="alertMessage" class="mb-4">
                    <!-- The message will be dynamically set by JavaScript -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary mr-2" onclick="hideAlertModal()">OK</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<script>
    function showCancelModal(status) {
        if (status === "Canceled") {
            showAlertModal("Your contract has already been canceled.");
            return;
        }

        const endDate = new Date("${contract.endDate}");
        const currentDate = new Date();
        const contractValue = ${contract.value};
        const penalty = (contractValue * 0.30).toFixed(2);
        const formattedPenalty = parseFloat(penalty).toLocaleString('en-US', { style: 'currency', currency: 'USD' });

        let message = "Are you sure you want to cancel this contract?";
        if (status === "Accepted" && currentDate < endDate) {
            message += "<br>You will be penalized 30% of the contract value (Penalty: " + formattedPenalty + ").";
            message += "<br><span class='text-red-500'>Note: Canceling an accepted contract will incur a penalty.</span>";
        } else if (status === "Pending") {
            message += "<br><span class='text-red-500'>Note: Canceling a pending contract will not incur any penalty.</span>";
        }

        document.getElementById('cancelMessage').innerHTML = message;
        document.getElementById('cancelModal').classList.add('show');
    }

    function hideCancelModal() {
        document.getElementById('cancelModal').classList.remove('show');
    }

    function confirmCancel() {
        document.getElementById('cancelForm').submit();
    }

    function requestRenewal(contractId, customerEmail) {
        const daysRemainingText = document.querySelector('input[value="${diffDays} days remaining"]').value;
        const daysRemaining = parseInt(daysRemainingText.split(' ')[0]);

        if (daysRemaining > 0) {
            showAlertModal("Your contract has not yet expired, so you cannot request a renewal.");
        } else {
            showRenewModal(contractId, customerEmail);
        }
    }

    function showRenewModal(contractId, customerEmail) {
        document.getElementById('contractId').value = contractId;
        document.getElementById('customerEmail').value = customerEmail;
        updateRenewalInfo();
        document.getElementById('renewModal').classList.add('show');
    }

    function hideRenewModal() {
        document.getElementById('renewModal').classList.remove('show');
    }

    function submitRenewForm() {
        document.getElementById('renewForm').submit();
    }

    function updateRenewalInfo() {
        const years = parseInt(document.getElementById('renewYears').value);
        const premium = ${contract.premium};
        const currentDate = new Date();
        const newEndDate = new Date(currentDate.setFullYear(currentDate.getFullYear() + years));
        const newValue = (premium * years).toFixed(2);

        document.getElementById('newEndDate').value = newEndDate.toLocaleDateString();
        document.getElementById('newPremium').value = premium.toFixed(2);
        document.getElementById('newValue').value = newValue;
    }

    function showAlertModal(message) {
        document.getElementById('alertMessage').innerHTML = message;
        document.getElementById('alertModal').classList.add('show');
    }

    function hideAlertModal() {
        document.getElementById('alertModal').classList.remove('show');
    }
</script>
</body>
</html>