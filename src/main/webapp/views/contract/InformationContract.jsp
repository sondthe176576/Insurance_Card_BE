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
    <style>
        .modal-content {
            border-radius: 0.5rem;
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
    <h1 class="text-4xl font-bold text-blue-900 mb-6 text-center">Contract Details</h1>

    <div class="bg-white shadow-md rounded-lg p-6 mb-8">
        <div class="mb-4">
            <p><strong>Contract ID:</strong> ${contract.contractID}</p>
            <p><strong>Customer ID:</strong> ${contract.customer.customerID}</p>
            <p><strong>Contract Info:</strong> ${contract.contractInfo}</p>
            <p><strong>Status:</strong> ${contract.status}</p>
            <p><strong>Start Date:</strong> <fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></p>
            <p><strong>End Date:</strong> <fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></p>
            <p><strong>Days Remaining:</strong>
                <c:choose>
                    <c:when test="${diffDays < 0}">
                        Expired ${-diffDays} days ago
                    </c:when>
                    <c:otherwise>
                        ${diffDays} days remaining
                    </c:otherwise>
                </c:choose>
            </p>
            <p><strong>Insurance Type:</strong> ${contract.insuranceType}</p>
            <p><strong>Coverage:</strong> ${contract.coverage}</p>
            <p><strong>Premium:</strong> ${contract.premium}</p>
            <p><strong>Cancellation Date:</strong> <fmt:formatDate value="${contract.cancellationDate}" pattern="yyyy-MM-dd"/></p>
            <p><strong>Detail:</strong> ${contract.detail}</p>
            <p><strong>Value:</strong> ${contract.value}</p>
        </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <div class="bg-white shadow-md rounded-lg p-6">
            <h2 class="text-2xl font-bold text-blue-900 mb-4">Customer Information</h2>
            <p><strong>User ID:</strong> ${contract.customer.user.userID}</p>
            <p><strong>Username:</strong> ${contract.customer.user.username}</p>
            <p><strong>Email:</strong> ${contract.customer.user.email}</p>
            <p><strong>Mobile:</strong> ${contract.customer.user.mobile}</p>
            <p><strong>Full Name:</strong> ${contract.customer.user.fullName}</p>
            <p><strong>Gender:</strong> ${contract.customer.user.gender}</p>
            <p><strong>Province:</strong> ${contract.customer.user.province}</p>
            <p><strong>District:</strong> ${contract.customer.user.district}</p>
            <p><strong>Country:</strong> ${contract.customer.user.country}</p>
            <p><strong>First Name:</strong> ${contract.customer.user.firstName}</p>
            <p><strong>Last Name:</strong> ${contract.customer.user.lastName}</p>
            <p><strong>Birth Date:</strong> <fmt:formatDate value="${contract.customer.user.birthDate}" pattern="yyyy-MM-dd"/></p>
            <p><strong>Personal Info:</strong> ${contract.customer.personalInfo}</p>
        </div>

        <div class="bg-white shadow-md rounded-lg p-6">
            <h2 class="text-2xl font-bold text-blue-900 mb-4">Motorcycle Information</h2>
            <p><strong>Motorcycle ID:</strong> ${contract.motorcycle.motorcycleID}</p>
            <p><strong>License Plate:</strong> ${contract.motorcycle.licensePlate}</p>
            <p><strong>Brand:</strong> ${contract.motorcycle.brand}</p>
            <p><strong>Model:</strong> ${contract.motorcycle.model}</p>
            <p><strong>Frame Number:</strong> ${contract.motorcycle.frameNumber}</p>
            <p><strong>Engine Number:</strong> ${contract.motorcycle.engineNumber}</p>
            <p><strong>Year of Manufacture:</strong> ${contract.motorcycle.yearOfManufacture}</p>
            <p><strong>Color:</strong> ${contract.motorcycle.color}</p>
        </div>
    </div>

    <div class="flex justify-between action-buttons">
        <button type="button" class="btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" onclick="showRenewModal('${contract.contractID}', '${contract.customer.user.email}')">
            <i class="fas fa-sync-alt mr-2"></i>Request Renew Contract
        </button>
        <form id="cancelForm" action="${pageContext.request.contextPath}/cancelContract" method="post" class="inline">
            <input type="hidden" name="contractId" value="${contract.contractID}">
            <input type="hidden" name="contractValue" value="${contract.value}">
            <button type="button" class="btn bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition duration-300" onclick="showCancelModal()">
                <i class="fas fa-times mr-2"></i>Cancel Contract
            </button>
        </form>
    </div>
</div>

<!-- Renew Confirmation Modal -->
<div class="fixed z-10 inset-0 overflow-y-auto" id="renewModal" style="display: none;">
    <div class="flex items-center justify-center min-h-screen">
        <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-md">
            <h5 class="text-2xl font-bold text-blue-900 mb-4">Request Renew Contract</h5>
            <form id="renewForm" action="${pageContext.request.contextPath}/requestRenewContract" method="post">
                <div class="mb-4">
                    <label for="renewYears" class="block text-gray-700">Number of years to renew:</label>
                    <input type="number" class="form-control mt-1 block w-full" id="renewYears" name="renewYears" required>
                </div>
                <input type="hidden" id="customerEmail" name="customerEmail" value="">
                <input type="hidden" id="contractId" name="contractId" value="">
            </form>
            <div class="flex justify-end">
                <button type="button" class="btn btn-secondary mr-2" onclick="hideRenewModal()">No</button>
                <button type="button" class="btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300" onclick="submitRenewForm()">Yes, Renew Contract</button>
            </div>
        </div>
    </div>
</div>

<!-- Cancel Confirmation Modal -->
<div class="fixed z-10 inset-0 overflow-y-auto" id="cancelModal" style="display: none;">
    <div class="flex items-center justify-center min-h-screen">
        <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-md">
            <h5 class="text-2xl font-bold text-blue-900 mb-4">Cancel Contract</h5>
            <div id="cancelMessage" class="mb-4">
                <!-- The message will be dynamically set by JavaScript -->
            </div>
            <div class="flex justify-end">
                <button type="button" class="btn btn-secondary mr-2" onclick="hideCancelModal()">No</button>
                <button type="button" class="btn bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition duration-300" onclick="confirmCancel()">Yes, Cancel Contract</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<script>
    function showCancelModal() {
        const endDate = new Date("${contract.endDate}");
        const currentDate = new Date();
        const contractValue = ${contract.value};
        const penalty = (contractValue * 0.30).toFixed(2);

        let message = "Are you sure you want to cancel this contract?";
        if (currentDate < endDate) {
            message += "<br>You will be penalized 30% of the contract value (Penalty: $" + penalty + ").";
        }

        document.getElementById('cancelMessage').innerHTML = message;
        document.getElementById('cancelModal').style.display = 'block';
    }

    function hideCancelModal() {
        document.getElementById('cancelModal').style.display = 'none';
    }

    function confirmCancel() {
        document.getElementById('cancelForm').submit();
    }

    function showRenewModal(contractId, customerEmail) {
        document.getElementById('contractId').value = contractId;
        document.getElementById('customerEmail').value = customerEmail;
        document.getElementById('renewModal').style.display = 'block';
    }

    function hideRenewModal() {
        document.getElementById('renewModal').style.display = 'none';
    }

    function submitRenewForm() {
        document.getElementById('renewForm').submit();
    }
</script>
</body>
</html>