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
    <!-- Thiết lập các thẻ meta cơ bản và tiêu đề trang -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resolve Waiting Contracts</title>
    <!-- Đường dẫn đến favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <!-- Bao gồm các thư viện CSS và icon -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.12.0/dist/cdn.min.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    <!-- Định dạng CSS cho trang -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f2f5;
        }

        .card {
            background-color: #ffffff;
            border-radius: 1rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        .btn-custom {
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .form-input:focus, .form-textarea:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
        }
    </style>
    <!-- Thiết lập biến JavaScript cho contextPath -->
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
</head>
<body class="bg-gray-100">
<!-- Bao gồm header và navbar -->
<jsp:include page="/views/includes/header_logout.jsp"/>
<jsp:include page="/views/includes/navbar.jsp"/>

<!-- Nội dung chính của trang -->
<div class="container mx-auto px-4 py-8">
    <div class="card p-8 animate__animated animate__fadeIn">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">
            <i class="fas fa-file-contract text-blue-600 mr-2"></i>Resolve Waiting Contracts
        </h2>

        <!-- Form xử lý hợp đồng chờ -->
        <form id="resolveContractForm" action="${pageContext.request.contextPath}/resolveWaitingContract" method="post">
            <!-- Thông tin khách hàng -->
            <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-user-circle mr-2"></i>Customer Information</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="mb-4">
                    <label for="customerID" class="block text-sm font-medium text-gray-700">Customer ID:</label>
                    <input type="number" id="customerID" name="customerID"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.customerID}" readonly>
                </div>
                <div class="mb-4">
                    <label for="username" class="block text-sm font-medium text-gray-700">Username:</label>
                    <input type="text" id="username" name="username"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.username}" readonly>
                </div>
                <div class="mb-4">
                    <label for="fullName" class="block text-sm font-medium text-gray-700">Full Name:</label>
                    <input type="text" id="fullName" name="fullName"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.fullName}" readonly>
                </div>
                <div class="mb-4">
                    <label for="firstName" class="block text-sm font-medium text-gray-700">First Name:</label>
                    <input type="text" id="firstName" name="firstName"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.firstName}" readonly>
                </div>
                <div class="mb-4">
                    <label for="lastName" class="block text-sm font-medium text-gray-700">Last Name:</label>
                    <input type="text" id="lastName" name="lastName"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.lastName}" readonly>
                </div>
                <div class="mb-4">
                    <label for="province" class="block text-sm font-medium text-gray-700">Province:</label>
                    <input type="text" id="province" name="province"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.province}" readonly>
                </div>
                <div class="mb-4">
                    <label for="district" class="block text-sm font-medium text-gray-700">District:</label>
                    <input type="text" id="district" name="district"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.district}" readonly>
                </div>
                <div class="mb-4">
                    <label for="country" class="block text-sm font-medium text-gray-700">Country:</label>
                    <input type="text" id="country" name="country"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.country}" readonly>
                </div>
                <div class="mb-4">
                    <label for="birthDate" class="block text-sm font-medium text-gray-700">Birth Date:</label>
                    <input type="date" id="birthDate" name="birthDate"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="<fmt:formatDate value='${contract.customer.user.birthDate}' pattern='yyyy-MM-dd'/>"
                           readonly>
                </div>
                <div class="mb-4">
                    <label for="mobile" class="block text-sm font-medium text-gray-700">Mobile:</label>
                    <input type="text" id="mobile" name="mobile"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.mobile}" readonly>
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email:</label>
                    <input type="email" id="email" name="email"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.email}" readonly>
                </div>
                <div class="mb-4">
                    <label for="gender" class="block text-sm font-medium text-gray-700">Gender:</label>
                    <input type="text" id="gender" name="gender"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.user.gender}" readonly>
                </div>
                <div class="mb-4">
                    <label for="personalInfo" class="block text-sm font-medium text-gray-700">Personal Info:</label>
                    <input type="text" id="personalInfo" name="personalInfo"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.customer.personalInfo}" readonly>
                </div>
            </div>

            <!-- Thông tin xe -->
            <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-motorcycle mr-2"></i>Vehicle Information</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="mb-4">
                    <label for="motorcycleID" class="block text-sm font-medium text-gray-700">Motorcycle ID:</label>
                    <input type="number" id="motorcycleID" name="motorcycleID"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.motorcycleID}" readonly>
                </div>
                <div class="mb-4">
                    <label for="licensePlate" class="block text-sm font-medium text-gray-700">License Plate:</label>
                    <input type="text" id="licensePlate" name="licensePlate"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.licensePlate}" readonly>
                </div>
                <div class="mb-4">
                    <label for="brand" class="block text-sm font-medium text-gray-700">Brand:</label>
                    <input type="text" id="brand" name="brand"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.brand}" readonly>
                </div>
                <div class="mb-4">
                    <label for="model" class="block text-sm font-medium text-gray-700">Model:</label>
                    <input type="text" id="model" name="model"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.model}" readonly>
                </div>
                <div class="mb-4">
                    <label for="yearOfManufacture" class="block text-sm font-medium text-gray-700">Year of
                        Manufacture:</label>
                    <input type="number" id="yearOfManufacture" name="yearOfManufacture"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.yearOfManufacture}" readonly>
                </div>
                <div class="mb-4">
                    <label for="color" class="block text-sm font-medium text-gray-700">Color:</label>
                    <input type="text" id="color" name="color"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.color}" readonly>
                </div>
                <div class="mb-4">
                    <label for="engineNumber" class="block text-sm font-medium text-gray-700">Engine Number:</label>
                    <input type="text" id="engineNumber" name="engineNumber"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.engineNumber}" readonly>
                </div>
                <div class="mb-4">
                    <label for="frameNumber" class="block text-sm font-medium text-gray-700">Frame Number:</label>
                    <input type="text" id="frameNumber" name="frameNumber"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.motorcycle.frameNumber}" readonly>
                </div>
            </div>

            <!-- Thông tin hợp đồng -->
            <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-file-contract mr-2"></i>Contract Information</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="mb-4">
                    <label for="contractID" class="block text-sm font-medium text-gray-700">Contract ID:</label>
                    <input type="number" id="contractID" name="contractID"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.contractID}" readonly>
                </div>
                <div class="mb-4">
                    <label for="contractInfo" class="block text-sm font-medium text-gray-700">Contract Info:</label>
                    <input type="text" id="contractInfo" name="contractInfo"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.contractInfo}" readonly>
                </div>
                <div class="mb-4">
                    <label for="status" class="block text-sm font-medium text-gray-700">Status:</label>
                    <input type="text" id="status" name="status"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.status}" readonly>
                </div>
                <div class="mb-4">
                    <label for="startDate" class="block text-sm font-medium text-gray-700">Start Date:</label>
                    <input type="text" id="startDate" name="startDate"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="<fmt:formatDate value='${contract.startDate}' pattern='dd-MM-yyyy'/>" readonly>
                </div>
                <div class="mb-4">
                    <label for="endDate" class="block text-sm font-medium text-gray-700">End Date:</label>
                    <input type="text" id="endDate" name="endDate"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="<fmt:formatDate value='${contract.endDate}' pattern='dd-MM-yyyy'/>" readonly>
                </div>
                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-700">Time remaining:</label>
                    <p class="text-red-500"><c:out value="${diffDays}"/> days</p>
                </div>
                <div class="mb-4">
                    <label for="value" class="block text-sm font-medium text-gray-700">Value:</label>
                    <input type="text" id="value" name="value"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="<fmt:formatNumber value='${contract.value}' type='currency' currencySymbol='$'/>"
                           readonly>
                </div>
                <div class="mb-4">
                    <label for="detail" class="block text-sm font-medium text-gray-700">Detail:</label>
                    <textarea id="detail" name="detail"
                              class="form-textarea mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                              rows="3" readonly>${contract.detail}</textarea>
                </div>
                <div class="mb-4">
                    <label for="insuranceType" class="block text-sm font-medium text-gray-700">Insurance Type:</label>
                    <input type="text" id="insuranceType" name="insuranceType"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.insuranceType}" readonly>
                </div>
                <div class="mb-4">
                    <label for="coverage" class="block text-sm font-medium text-gray-700">Coverage:</label>
                    <input type="text" id="coverage" name="coverage"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.coverage}" readonly>
                </div>
                <div class="mb-4">
                    <label for="premium" class="block text-sm font-medium text-gray-700">Premium:</label>
                    <input type="text" id="premium" name="premium"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="<fmt:formatNumber value='${contract.premium}' type='currency' currencySymbol='$'/>"
                           readonly>
                </div>
            </div>

            <!-- Thông tin thanh toán -->
            <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-dollar-sign mr-2"></i>Payment Information</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="mb-4">
                    <label for="paymentMethodType" class="block text-sm font-medium text-gray-700">Payment
                        Method:</label>
                    <input type="text" id="paymentMethodType" name="paymentMethodType"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="${contract.paymentMethod.methodType}" readonly>
                </div>
                <div class="mb-4">
                    <label for="paymentDetails" class="block text-sm font-medium text-gray-700">Payment Details:</label>
                    <textarea id="paymentDetails" name="paymentDetails"
                              class="form-textarea mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                              rows="3" readonly>${contract.paymentMethod.details}</textarea>
                </div>
                <div class="mb-4">
                    <label for="paymentAmount" class="block text-sm font-medium text-gray-700">Payment Amount:</label>
                    <input type="text" id="paymentAmount" name="paymentAmount"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="<fmt:formatNumber value='${contract.paymentHistory.amount}' type='currency' currencySymbol='$'/>"
                           readonly>
                </div>
                <div class="mb-4">
                    <label for="paymentDate" class="block text-sm font-medium text-gray-700">Payment Date:</label>
                    <input type="text" id="paymentDate" name="paymentDate"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                           value="<fmt:formatDate value='${contract.paymentHistory.paymentDate}' pattern='dd-MM-yyyy'/>"
                           readonly>
                </div>
            </div>

            <!-- Các gói bảo hiểm -->
            <div class="mt-8">
                <h4 class="text-xl text-blue-600 mb-4"><i class="fas fa-box mr-2"></i>Insurance Packages</h4>
                <div x-data="{ open: null }">
                    <div class="border rounded-lg mb-4 overflow-hidden">
                        <button type="button" @click="open = (open === 'basic' ? null : 'basic')"
                                class="w-full text-left p-4 bg-gray-100 font-semibold flex justify-between items-center">
                            <span><i
                                    class="fas fa-check-circle text-green-500 mr-2"></i> Basic Motorcycle Insurance</span>
                            <i :class="open === 'basic' ? 'fas fa-chevron-up' : 'fas fa-chevron-down'"></i>
                        </button>
                        <div x-show="open === 'basic'" x-transition:enter="transition ease-out duration-300"
                             x-transition:enter-start="opacity-0 transform scale-95"
                             x-transition:enter-end="opacity-100 transform scale-100"
                             x-transition:leave="transition ease-in duration-300"
                             x-transition:leave-start="opacity-100 transform scale-100"
                             x-transition:leave-end="opacity-0 transform scale-95" class="p-4 bg-white">
                            <!-- Chi tiết gói cơ bản -->
                            <p>This option provides the fundamental coverage for your motorcycle. After completing your
                                contact information and selecting your insurance package, please submit the form to the
                                Insurance Advisor at the address below. You will receive an invitation to attend an
                                information session. We aim to provide you with as much information as possible about
                                our insurance policies. At the end of the session, you may complete the application for
                                insurance and pay the $100 insurance fee.</p>
                        </div>
                    </div>

                    <div class="border rounded-lg mb-4 overflow-hidden">
                        <button type="button" @click="open = (open === 'comprehensive' ? null : 'comprehensive')"
                                class="w-full text-left p-4 bg-gray-100 font-semibold flex justify-between items-center">
                            <span><i class="fas fa-shield-alt text-blue-500 mr-2"></i> Comprehensive Motorcycle Insurance</span>
                            <i :class="open === 'comprehensive' ? 'fas fa-chevron-up' : 'fas fa-chevron-down'"></i>
                        </button>
                        <div x-show="open === 'comprehensive'" x-transition:enter="transition ease-out duration-300"
                             x-transition:enter-start="opacity-0 transform scale-95"
                             x-transition:enter-end="opacity-100 transform scale-100"
                             x-transition:leave="transition ease-in duration-300"
                             x-transition:leave-start="opacity-100 transform scale-100"
                             x-transition:leave-end="opacity-0 transform scale-95" class="p-4 bg-white">
                            <!-- Chi tiết gói toàn diện -->
                            <p>This package offers complete protection for your motorcycle, including accident and theft
                                insurance. Additionally, you will receive monthly newsletters with updates on your
                                insurance coverage. The insurance fee is $150 per year. Comprehensive insurance not only
                                covers basic liabilities but also includes coverage for damage caused by natural
                                disasters, fire, and vandalism. This ensures that you have peace of mind in any
                                situation.</p>
                        </div>
                    </div>

                    <div class="border rounded-lg mb-4 overflow-hidden">
                        <button type="button" @click="open = (open === 'premium' ? null : 'premium')"
                                class="w-full text-left p-4 bg-gray-100 font-semibold flex justify-between items-center">
                            <span><i class="fas fa-crown text-yellow-500 mr-2"></i> Premium Motorcycle Insurance</span>
                            <i :class="open === 'premium' ? 'fas fa-chevron-up' : 'fas fa-chevron-down'"></i>
                        </button>
                        <div x-show="open === 'premium'" x-transition:enter="transition ease-out duration-300"
                             x-transition:enter-start="opacity-0 transform scale-95"
                             x-transition:enter-end="opacity-100 transform scale-100"
                             x-transition:leave="transition ease-in duration-300"
                             x-transition:leave-start="opacity-100 transform scale-100"
                             x-transition:leave-end="opacity-0 transform scale-95" class="p-4 bg-white">
                            <!-- Chi tiết gói cao cấp -->
                            <p>Our premium package provides the highest level of coverage. This includes all the
                                benefits of comprehensive insurance, plus additional features such as roadside
                                assistance, rental reimbursement, and coverage for custom parts and equipment. The
                                premium insurance fee is $250 per year. With this package, you are guaranteed the best
                                support and quickest response in case of any incident. Our premium plan also includes a
                                personal advisor who will assist you with all your insurance needs.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Các nút hành động -->
            <div class="flex justify-center mt-8 space-x-4">
                <button type="button" onclick="showModal('accept')"
                        class="btn-custom bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-full transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                    <i class="fas fa-check mr-2"></i> Accept
                </button>
                <button type="button" onclick="showModal('reject')"
                        class="btn-custom bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded-full transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                    <i class="fas fa-times mr-2"></i> Reject
                </button>
                <a href="${pageContext.request.contextPath}/listWaitingContract"
                   class="btn-custom bg-gray-600 text-white font-bold py-2 px-4 rounded-full transition duration-300 ease-in-out transform hover:-translate-y-1 hover:scale-110">
                    <i class="fas fa-arrow-left mr-2"></i> Back to List
                </a>
            </div>
        </form>
    </div>
    <div class="card-footer text-center bg-blue-600 text-white mt-6 py-4">
        <p>Motorcycle Insurance Company, 123 Hola Street, District Thach That, Ha Noi, Vietnam</p>
        <p>Phone: 0123-456-789<br>
        </p>
    </div>
</div>

<!-- Bao gồm footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- Kết thúc footer -->

<!-- Modal xác nhận -->
<div class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden" id="confirmationModal">
    <div class="bg-white p-6 rounded-lg shadow-lg animate__animated animate__fadeIn">
        <div class="text-center mb-4">
            <h5 class="text-2xl font-bold text-gray-800" id="confirmationModalLabel">Confirmation</h5>
        </div>
        <div class="text-center mb-4">
            Are you sure you want to proceed?
        </div>
        <div class="text-center">
            <button type="button"
                    class="btn modal-btn bg-green-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105"
                    onclick="confirmAction()">Yes
            </button>
            <button type="button"
                    class="btn modal-btn bg-red-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-4"
                    onclick="document.getElementById('confirmationModal').classList.add('hidden')">No
            </button>
            <input type="hidden" id="modal-status" value=""/>
        </div>
    </div>
</div>
<!-- Kết thúc modal -->

<script>
    // Hàm hiển thị modal xác nhận
    function showModal(action) {
        document.getElementById('modal-status').value = action;
        document.getElementById('confirmationModal').classList.remove('hidden');
    }

    // Hàm xác nhận hành động và gửi form
    function confirmAction() {
        const action = document.getElementById('modal-status').value;
        document.getElementById('resolveContractForm').action = contextPath + "/resolveWaitingContract?action=" + action;
        document.getElementById('resolveContractForm').submit();
    }
</script>
</body>
</html>