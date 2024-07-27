<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        request.getRequestDispatcher("/views/homepage/home.jsp").forward(request, response);
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resolve Accident</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.4.2/cdn.min.js" defer></script>
    <style>
        .btn-custom {
            transition: background-color 0.3s, transform 0.3s;
        }
        .modal-btn {
            transition: background-color 0.3s, transform 0.3s;
        }
        .form-input {
            padding: 1rem;
            border-radius: 0.5rem;
        }
        .card-header {
            background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
            color: white;
            padding: 1rem 2rem;
            border-top-left-radius: 0.75rem;
            border-top-right-radius: 0.75rem;
            text-align: center;
        }
        .card-footer {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: white;
            padding: 1rem 2rem;
            border-bottom-left-radius: 0.75rem;
            border-bottom-right-radius: 0.75rem;
            text-align: center;
        }
        .notification {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            padding: 1rem 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 600px;
            width: 100%;
        }
        .notification-success {
            background-color: #38a169;
            color: white;
        }
        .notification-error {
            background-color: #e53e3e;
            color: white;
        }
        .notification .btn-close {
            background: none;
            border: none;
            font-size: 1.5rem;
            line-height: 1;
            color: white;
            cursor: pointer;
            padding: 0;
            margin: 0;
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
<jsp:include page="/views/includes/header_logout.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Notification Message -->
<c:if test="${not empty message}">
    <div class="alert ${status ? 'notification notification-success' : 'notification notification-error'} alert-dismissible fade show fixed top-0 right-0 m-4 p-4 rounded-lg shadow-lg animate__animated animate__fadeInDown" role="alert">
        <i class="fas ${status ? 'fa-check-circle text-green-500' : 'fa-exclamation-triangle text-red-500'}"></i>
        <c:out value="${message}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">&times;</button>
    </div>
</c:if>
<!-- End of notification message -->
<!-- Form -->
<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-lg animate__animated animate__fadeIn">
    <div class="card">
        <div class="card-header">
            <h2 class="text-3xl font-bold"><i class="fas fa-info-circle"></i> Accident Detail</h2>
        </div>
        <div class="card-body mt-6">
            <h3 class="text-2xl text-blue-600 mb-4">Accident Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Accident ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.accidentID}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Customer Name:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.fullName}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Accident Type:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.accidentType}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Accident Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${accident.accidentDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Description:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.description}"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Status:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.status}"/></p>
                </div>
            </div>
            <h3 class="text-2xl text-blue-600 mt-6 mb-4">Customer Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Customer ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customerID}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Username:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.username}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Full Name:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.fullName}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">First Name:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.firstName}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Last Name:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.lastName}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Phone Number:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.mobile}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Email:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.email}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Province:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.province}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">District:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.district}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Country:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.country}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Gender:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.user.gender}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Birth Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${accident.customer.user.birthDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Personal Info:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.customer.personalInfo}"/></p>
                </div>
            </div>
            <h3 class="text-2xl text-blue-600 mt-6 mb-4">Contract Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Contract ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contractID}"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Contract Info:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.contractInfo}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Contract Status:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.status}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Start Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${accident.contract.startDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">End Date:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatDate value="${accident.contract.endDate}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Insurance Type:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.insuranceType}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Coverage:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.coverage}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Premium:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatNumber value="${accident.contract.premium}" type="currency" currencySymbol="$"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Detail:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.detail}"/></p>
                </div>
                <div class="flex flex-col md:col-span-2">
                    <label class="font-bold text-gray-700">Value:</label>
                    <p class="bg-gray-100 p-2 rounded"><fmt:formatNumber value="${accident.contract.value}" type="currency" currencySymbol="$"/></p>
                </div>
            </div>
            <h3 class="text-2xl text-blue-600 mt-6 mb-4">Motorcycle Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Motorcycle ID:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.motorcycleID}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">License Plate:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.licensePlate}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Brand:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.brand}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Model:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.model}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Frame Number:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.frameNumber}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Engine Number:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.engineNumber}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Year Of Manufacture:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.yearOfManufacture}"/></p>
                </div>
                <div class="flex flex-col">
                    <label class="font-bold text-gray-700">Color:</label>
                    <p class="bg-gray-100 p-2 rounded"><c:out value="${accident.contract.motorcycle.color}"/></p>
                </div>
            </div>
            <form id="resolveForm" method="post" action="${pageContext.request.contextPath}/resolveAccident">
                <input type="hidden" id="status" name="status" value=""/>
                <input type="hidden" name="accidentID" value="${accident.accidentID}"/>
                <div class="flex justify-center mt-8">
                    <button type="button" onclick="showModal('Approved')" class="btn-custom bg-green-500 hover:bg-green-700 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105"
                            <c:if test="${accident.status == 'Approved' || accident.status == 'Rejected'}">disabled</c:if>>
                        <i class="fas fa-check-circle"></i> Approve
                    </button>
                    <button type="button" onclick="showModal('Rejected')" class="btn-custom bg-red-500 hover:bg-red-700 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-4"
                            <c:if test="${accident.status == 'Approved' || accident.status == 'Rejected'}">disabled</c:if>>
                        <i class="fas fa-times-circle"></i> Reject
                    </button>
                    <a href="${pageContext.request.contextPath}/listAccident" class="btn-custom bg-gray-500 hover:bg-gray-700 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-4">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                </div>
                <c:if test="${accident.status == 'Approved' || accident.status == 'Rejected'}">
                    <div class="text-center mt-4 text-red-500">
                        You have already processed this contract.
                    </div>
                </c:if>
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