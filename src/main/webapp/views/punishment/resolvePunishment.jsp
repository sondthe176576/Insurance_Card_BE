<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resolve Punishment</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.4.2/cdn.min.js" defer></script>
    <style>
        .btn-custom {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .btn-custom i {
            margin-right: 0.5rem;
        }

        .modal-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .modal-btn i {
            margin-right: 0.5rem;
        }
    </style>
    <script>
        function showModal(status) {
            document.getElementById('modal-status').value = status;
            document.getElementById('confirmationModal').classList.remove('hidden');
        }

        function confirmAction() {
            var status = document.getElementById('modal-status').value;
            document.getElementById('status').value = status;
            document.getElementById('resolveForm').submit();
        }
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
    <div class="alert ${status ? 'alert-success' : 'alert-danger'} alert-dismissible fade show fixed top-0 right-0 m-4 p-4 rounded-lg shadow-lg" role="alert">
        <i class="fas ${status ? 'fa-check-circle text-green-500' : 'fa-exclamation-triangle text-red-500'}"></i>
        <c:out value="${message}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<!-- End of notification message -->
<!-- Form -->
<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-lg animate__animated animate__fadeIn">
    <div class="card">
        <div class="card-header text-center bg-blue-600 text-white p-4 rounded-t-lg">
            <h2 class="text-3xl font-bold"><i class="fas fa-info-circle"></i> Punishment Detail</h2>
        </div>
        <div class="card-body mt-6">
            <h3 class="text-2xl text-blue-600 mb-4">Punishment Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Punishment ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.punishmentID}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Punishment Type:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.punishmentType}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Punishment Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${punishment.punishmentDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Description:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.description}"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Status:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.status}"/></p>
                </div>
            </div>
            <h3 class="text-2xl text-blue-600 mt-6 mb-4">Customer Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Customer ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.customerID}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Username:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.username}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Full Name:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.fullName}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">First Name:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.firstName}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Last Name:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.lastName}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Phone Number:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.mobile}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Email:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.email}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Province:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.province}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">District:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.district}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Country:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.country}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Gender:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.user.gender}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Birth Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${punishment.customer.user.birthDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Personal Info:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.customer.personalInfo}"/></p>
                </div>
            </div>
            <h3 class="text-2xl text-blue-600 mt-6 mb-4">Contract Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Contract ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.contractID}"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Contract Info:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.contractInfo}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Contract Status:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.status}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Start Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${punishment.contract.startDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">End Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${punishment.contract.endDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Insurance Type:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.insuranceType}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Coverage:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.coverage}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Premium:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatNumber value="${punishment.contract.premium}" type="currency" currencySymbol="$"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Detail:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.detail}"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Value:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatNumber value="${punishment.contract.value}" type="currency" currencySymbol="$"/></p>
                </div>
            </div>
            <h3 class="text-2xl text-blue-600 mt-6 mb-4">Motorcycle Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Motorcycle ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.motorcycleID}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">License Plate:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.licensePlate}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Brand:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.brand}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Model:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.model}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Frame Number:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.frameNumber}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Engine Number:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.engineNumber}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Year Of Manufacture:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.yearOfManufacture}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Color:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${punishment.contract.motorcycle.color}"/></p>
                </div>
            </div>
            <form id="resolveForm" method="post" action="${pageContext.request.contextPath}/resolvePunishment">
                <input type="hidden" id="status" name="status" value=""/>
                <input type="hidden" name="punishmentID" value="${punishment.punishmentID}"/>
                <div class="flex justify-center mt-8 space-x-4">
                    <button type="button" onclick="showModal('Approved')" class="btn-custom bg-green-500 hover:bg-green-700 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105">
                        <i class="fas fa-check-circle"></i> Approve
                    </button>
                    <button type="button" onclick="showModal('Rejected')" class="btn-custom bg-red-500 hover:bg-red-700 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105">
                        <i class="fas fa-times-circle"></i> Reject
                    </button>
                    <a href="${pageContext.request.contextPath}/listPunishment" class="btn-custom bg-gray-500 hover:bg-gray-700 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

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
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>