<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Đặt tiêu đề và các thẻ meta cơ bản -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Contract</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <!-- Bao gồm các thư viện CSS từ TailwindCSS, FontAwesome, Animate.css và SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css" rel="stylesheet">
    <!-- Bao gồm thư viện JavaScript từ Alpine.js và SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.10.5/dist/cdn.min.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        /* Định dạng font chữ cho toàn bộ trang */
        body {
            font-family: 'Poppins', sans-serif;
        }

        /* Hiệu ứng fade-in cho trang */
        .animate-fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Hiệu ứng phóng to khi hover */
        .hover-scale {
            transition: transform 0.3s ease-in-out;
        }

        .hover-scale:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body class="bg-gray-100">
<!-- Bao gồm header -->
<jsp:include page="/views/includes/header_logout.jsp"/>
<!-- Kết thúc phần header -->

<!-- Bao gồm navbar -->
<nav class="bg-blue-900 border-b-4 border-orange-600">
    <div class="container mx-auto px-4 py-2 flex justify-center">
        <ul class="flex space-x-6">
            <!-- Liên kết đến trang chủ -->
            <li>
                <a href="${pageContext.request.contextPath}/homepageforcustomer"
                   class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
            </li>
            <!-- Liên kết để tạo hợp đồng bảo hiểm mới -->
            <li>
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}"
                   class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
            </li>
            <!-- Liên kết đến trang About -->
            <li>
                <a href="#" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
            </li>
            <!-- Liên kết đến trang hợp đồng của khách hàng -->
            <li>
                <a href="${pageContext.request.contextPath}/contractForCustomer"
                   class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
            </li>
            <!-- Liên kết đến trang Dashboard của khách hàng -->
            <li>
                <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp"
                   class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- Kết thúc phần navbar -->

<!-- Nội dung chính của trang -->
<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-lg animate-fade-in">
    <div class="card">
        <div class="card-header text-center bg-gradient-to-r from-blue-600 to-blue-400 text-white py-4 rounded-t-lg">
            <h2 class="text-3xl font-bold"><i class="fas fa-file-contract mr-2"></i>Create New Contract</h2>
        </div>
        <div class="card-body mt-6">
            <form id="createContractForm" action="${pageContext.request.contextPath}/createContract" method="post"
                  x-data="formData()" x-on:submit.prevent="validateAndSubmitForm">
                <!-- Phần thông tin khách hàng -->
                <div class="mb-8">
                    <h3 class="text-2xl text-blue-600 mb-4 flex items-center">
                        <i class="fas fa-user mr-2"></i>Customer Information
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- Các trường thông tin khách hàng -->
                        <div class="mb-4">
                            <label for="customerID" class="block text-gray-700 font-bold mb-2">Customer ID:</label>
                            <input type="number" id="customerID" name="customerID"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.customerID}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerUsername" class="block text-gray-700 font-bold mb-2">Customer
                                Username:</label>
                            <input type="text" id="customerUsername" name="customerUsername"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.username}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerName" class="block text-gray-700 font-bold mb-2">Customer Name:</label>
                            <input type="text" id="customerName" name="customerName"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.fullName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="firstName" class="block text-gray-700 font-bold mb-2">First Name:</label>
                            <input type="text" id="firstName" name="firstName"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.firstName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="lastName" class="block text-gray-700 font-bold mb-2">Last Name:</label>
                            <input type="text" id="lastName" name="lastName"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.lastName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerPhone" class="block text-gray-700 font-bold mb-2">Customer
                                Phone:</label>
                            <input type="text" id="customerPhone" name="customerPhone"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.mobile}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerEmail" class="block text-gray-700 font-bold mb-2">Customer
                                Email:</label>
                            <input type="email" id="customerEmail" name="customerEmail"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.email}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerGender" class="block text-gray-700 font-bold mb-2">Gender:</label>
                            <input type="text" id="customerGender" name="customerGender"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.gender}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="province" class="block text-gray-700 font-bold mb-2">Province:</label>
                            <input type="text" id="province" name="province"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.province}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="district" class="block text-gray-700 font-bold mb-2">District:</label>
                            <input type="text" id="district" name="district"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.district}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="country" class="block text-gray-700 font-bold mb-2">Country:</label>
                            <input type="text" id="country" name="country"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.user.country}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="birthDate" class="block text-gray-700 font-bold mb-2">Birth Date:</label>
                            <input type="date" id="birthDate" name="birthDate"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="<fmt:formatDate value='${customer.user.birthDate}' pattern='yyyy-MM-dd'/>"
                                   readonly>
                        </div>
                        <div class="mb-4">
                            <label for="personalInfo" class="block text-gray-700 font-bold mb-2">Personal Info:</label>
                            <input type="text" id="personalInfo" name="personalInfo"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   value="${customer.personalInfo}" readonly>
                        </div>
                    </div>
                </div>

                <!-- Phần thông tin xe máy -->
                <div class="col-span-1">
                    <h3 class="text-2xl text-blue-600 mb-4 flex items-center">
                        <i class="fas fa-motorcycle mr-2"></i>Motorcycle Information
                    </h3>
                    <c:if test="${empty motorcycles}">
                        <!-- Thông báo yêu cầu nhập thông tin xe máy -->
                        <div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 rounded-md mt-4"
                             role="alert">
                            <p class="font-bold"><i class="fas fa-exclamation-circle"></i> Motorcycle Information
                                Required</p>
                            <p>You need to add your motorcycle information before creating a new contract. Please visit
                                the homepage and click on 'Personal Information' to add your motorcycle and personal
                                details.</p>
                        </div>
                    </c:if>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- Các trường thông tin xe máy -->
                        <c:forEach var="motorcycle" items="${motorcycles}">
                            <div class="mb-4">
                                <label for="motorcycleID" class="block text-gray-700 font-bold mb-2">Motorcycle
                                    ID:</label>
                                <input type="number" id="motorcycleID" name="motorcycleID"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.motorcycleID}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="licensePlate" class="block text-gray-700 font-bold mb-2">License
                                    Plate:</label>
                                <input type="text" id="licensePlate" name="licensePlate"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.licensePlate}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="brand" class="block text-gray-700 font-bold mb-2">Brand:</label>
                                <input type="text" id="brand" name="brand"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.brand}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="model" class="block text-gray-700 font-bold mb-2">Model:</label>
                                <input type="text" id="model" name="model"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.model}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="yearOfManufacture" class="block text-gray-700 font-bold mb-2">Year Of
                                    Manufacture:</label>
                                <input type="number" id="yearOfManufacture" name="yearOfManufacture"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.yearOfManufacture}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="color" class="block text-gray-700 font-bold mb-2">Color:</label>
                                <input type="text" id="color" name="color"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.color}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="engineNumber" class="block text-gray-700 font-bold mb-2">Engine
                                    Number:</label>
                                <input type="text" id="engineNumber" name="engineNumber"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.engineNumber}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="frameNumber" class="block text-gray-700 font-bold mb-2">Frame
                                    Number:</label>
                                <input type="text" id="frameNumber" name="frameNumber"
                                       class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       value="${motorcycle.frameNumber}" readonly>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Phần thông tin hợp đồng -->
                <div class="mb-8">
                    <h3 class="text-2xl text-blue-600 mb-4 flex items-center">
                        <i class="fas fa-file-contract mr-2"></i>Contract Information
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- Các trường thông tin hợp đồng -->
                        <div class="mb-4">
                            <label for="contractYears" class="block text-gray-700 font-bold mb-2">Contract
                                Years:</label>
                            <input type="number" id="contractYears" name="contractYears" x-model="contractYears"
                                   x-on:input="updateContractDetails"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
                                   min="1" required>
                            <small class="text-red-500">Please select the number of years for the contract.</small>
                        </div>
                        <div class="mb-4">
                            <label for="startDate" class="block text-gray-700 font-bold mb-2">Start Date:</label>
                            <input type="date" id="startDate" name="startDate"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
                                   required readonly>
                        </div>
                        <div class="mb-4">
                            <label for="endDate" class="block text-gray-700 font-bold mb-2">End Date:</label>
                            <input type="date" id="endDate" name="endDate"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
                                   required readonly>
                        </div>
                        <div class="mb-4">
                            <label for="insuranceType" class="block text-gray-700 font-bold mb-2">Insurance
                                Type:</label>
                            <select id="insuranceType" name="insuranceType" x-model="insuranceType"
                                    x-on:change="updateInsuranceDetails"
                                    class="form-select mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
                                    required>
                                <option value="">Select Insurance Type</option>
                                <option value="Basic">Basic</option>
                                <option value="Comprehensive">Comprehensive</option>
                                <option value="Premium">Premium</option>
                            </select>
                            <small class="text-red-500">Please select the type of insurance you want.</small>
                        </div>
                        <div class="mb-4">
                            <label for="contractInfo" class="block text-gray-700 font-bold mb-2">Contract Info:</label>
                            <input type="text" id="contractInfo" name="contractInfo"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   readonly>
                        </div>
                        <div class="mb-4">
                            <label for="value" class="block text-gray-700 font-bold mb-2">Value:</label>
                            <input type="number" id="value" name="value"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   step="50" min="50" readonly>
                            <small class="text-red-500">The total contract value is calculated as the number of
                                insurance years multiplied by the premium per year. (in $)</small>
                        </div>
                        <div class="mb-4">
                            <label for="detail" class="block text-gray-700 font-bold mb-2">Detail:</label>
                            <textarea id="detail" name="detail"
                                      class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                      rows="3" readonly></textarea>
                        </div>
                        <div class="mb-4">
                            <label for="coverage" class="block text-gray-700 font-bold mb-2">Coverage:</label>
                            <input type="text" id="coverage" name="coverage"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   readonly>
                        </div>
                        <div class="mb-4">
                            <label for="premium" class="block text-gray-700 font-bold mb-2">Premium:</label>
                            <input type="number" id="premium" name="premium"
                                   class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                   step="50" min="50" readonly>
                            <small class="text-red-500">The contract value per year (in $).</small>
                        </div>
                    </div>
                </div>

                <!-- Phần thông tin thanh toán -->
                <div class="mb-8">
                    <h3 class="text-2xl text-blue-600 mb-4 flex items-center">
                        <i class="fas fa-money-bill-wave mr-2"></i>Payment Information
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="mb-4">
                            <label for="paymentMethod" class="block text-gray-700 font-bold mb-2">Payment
                                Method:</label>
                            <select id="paymentMethod" name="paymentMethod" x-model="paymentMethod"
                                    x-on:change="togglePaymentDetails"
                                    class="form-select mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
                                    required>
                                <option value="">Select Payment Method</option>
                                <option value="cash">Cash</option>
                                <option value="bankTransfer">Bank Transfer</option>
                            </select>
                        </div>
                    </div>
                    <!-- Các phần chi tiết thanh toán -->
                    <div x-show="paymentMethod === 'cash'" x-transition:enter="transition ease-out duration-300"
                         x-transition:enter-start="opacity-0 transform scale-90"
                         x-transition:enter-end="opacity-100 transform scale-100"
                         class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 rounded-md mt-4"
                         role="alert">
                        <!-- Thông tin thanh toán tiền mặt -->
                        <p class="font-bold"><i class="fas fa-exclamation-circle"></i> Cash Payment Details</p>
                        <p>Please bring your contract to our office to complete the payment in cash.</p>
                        <p>Motorcycle Insurance Company,<br> 123 Hola Street,<br> Thach That District, Hanoi,<br>
                            Vietnam</p>
                        <p>Phone: 0123-456-789<br>
                            <a href="${pageContext.request.contextPath}/homepageforcustomer"
                               class="text-blue-500 hover:underline">
                                www.motorcycleinsurance.vn
                            </a>
                        </p>
                    </div>
                    <div x-show="paymentMethod === 'bankTransfer'" x-transition:enter="transition ease-out duration-300"
                         x-transition:enter-start="opacity-0 transform scale-90"
                         x-transition:enter-end="opacity-100 transform scale-100"
                         class="bg-blue-100 border-l-4 border-blue-500 text-blue-700 p-4 rounded-md mt-4" role="alert">
                        <!-- Thông tin chuyển khoản ngân hàng -->
                        <p class="font-bold"><i class="fas fa-exclamation-circle"></i> Bank Transfer Details</p>
                        <p>You will be redirected to the bank transfer page to complete the payment.</p>
                        <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mt-4" role="alert">
                            <p class="font-bold"><i class="fas fa-exclamation-circle"></i> Bank Transfer Unavailable</p>
                            <p>Currently, the bank transfer payment method is not available. Please choose another
                                payment method.</p>
                        </div>
                    </div>
                </div>

                <!-- Phần gói bảo hiểm -->
                <div class="mb-8">
                    <h3 class="text-2xl text-blue-600 mb-4 flex items-center">
                        <i class="fas fa-box mr-2"></i>Insurance Packages
                    </h3>
                    <div x-data="{ openPackage: null }" class="space-y-4">
                        <!-- Các accordion gói bảo hiểm -->
                        <div class="border border-gray-300 rounded-md hover-scale">
                            <div class="border-b border-gray-300 p-4 cursor-pointer flex justify-between items-center"
                                 @click="openPackage = openPackage === 1 ? null : 1">
                                <h2 class="font-bold text-gray-700"><i
                                        class="fas fa-check-circle text-green-500 mr-2"></i> Basic Motorcycle Insurance
                                </h2>
                                <i class="fas" :class="openPackage === 1 ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
                            </div>
                            <div x-show="openPackage === 1" x-transition:enter="transition ease-out duration-300"
                                 x-transition:enter-start="opacity-0 transform -translate-y-2"
                                 x-transition:enter-end="opacity-100 transform translate-y-0" class="p-4">
                                <!-- Chi tiết gói cơ bản -->
                                <p>This option provides the fundamental coverage for your motorcycle. After completing
                                    your contact information and selecting your insurance package, please submit the
                                    form to the Insurance Advisor at the address below. You will receive an invitation
                                    to attend an information session. We aim to provide you with as much information as
                                    possible about our insurance policies. At the end of the session, you may complete
                                    the application for insurance and pay the $100 insurance fee.</p>
                            </div>
                        </div>
                        <!-- Lặp lại cho gói Comprehensive và Premium -->
                        <div class="border border-gray-300 rounded-md hover-scale">
                            <div class="border-b border-gray-300 p-4 cursor-pointer flex justify-between items-center"
                                 @click="openPackage = openPackage === 2 ? null : 2">
                                <h2 class="font-bold text-gray-700"><i
                                        class="fas fa-check-circle text-green-500 mr-2"></i> Comprehensive Motorcycle
                                    Insurance</h2>
                                <i class="fas" :class="openPackage === 2 ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
                            </div>
                            <div x-show="openPackage === 2" x-transition:enter="transition ease-out duration-300"
                                 x-transition:enter-start="opacity-0 transform -translate-y-2"
                                 x-transition:enter-end="opacity-100 transform translate-y-0" class="p-4">
                                <p>This package offers complete protection for your motorcycle, including accident and
                                    theft insurance. Additionally, you will receive monthly newsletters with updates on
                                    your insurance coverage. The insurance fee is $150 per year. Comprehensive insurance
                                    not only covers basic liabilities but also includes coverage for damage caused by
                                    natural disasters, fire, and vandalism. This ensures that you have peace of mind in
                                    any situation.</p>
                            </div>
                        </div>
                        <div class="border border-gray-300 rounded-md hover-scale">
                            <div class="border-b border-gray-300 p-4 cursor-pointer flex justify-between items-center"
                                 @click="openPackage = openPackage === 3 ? null : 3">
                                <h2 class="font-bold text-gray-700"><i
                                        class="fas fa-check-circle text-green-500 mr-2"></i> Premium Motorcycle
                                    Insurance</h2>
                                <i class="fas" :class="openPackage === 3 ? 'fa-chevron-up' : 'fa-chevron-down'"></i>
                            </div>
                            <div x-show="openPackage === 3" x-transition:enter="transition ease-out duration-300"
                                 x-transition:enter-start="opacity-0 transform -translate-y-2"
                                 x-transition:enter-end="opacity-100 transform translate-y-0" class="p-4">
                                <p>Our premium package provides the highest level of coverage. This includes all the
                                    benefits of comprehensive insurance, plus additional features such as roadside
                                    assistance, rental reimbursement, and coverage for custom parts and equipment. The
                                    premium insurance fee is $250 per year. With this package, you are guaranteed the
                                    best support and quickest response in case of any incident. Our premium plan also
                                    includes a personal advisor who will assist you with all your insurance needs.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Nút submit -->
                <div class="mt-6 text-center">
                    <button type="submit"
                            class="bg-gradient-to-r from-blue-600 to-blue-400 text-white font-bold py-2 px-6 rounded-full shadow-lg hover:shadow-xl transition transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
                            id="submitBtn">
                        <i class="fas fa-file-contract mr-2"></i> Create Contract
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bao gồm footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- Kết thúc phần footer -->

<script>
    // Hàm xử lý dữ liệu form
    function formData() {
        return {
            contractYears: 1, // Số năm hợp đồng
            paymentMethod: '', // Phương thức thanh toán
            insuranceType: '', // Loại bảo hiểm

            // Cập nhật chi tiết hợp đồng dựa trên số năm và loại bảo hiểm đã chọn
            updateContractDetails() {
                var startDate = new Date(document.getElementById('startDate').value); // Lấy ngày bắt đầu từ input
                var years = parseInt(this.contractYears); // Chuyển đổi số năm hợp đồng từ chuỗi sang số nguyên
                if (!isNaN(years) && years > 0) { // Kiểm tra số năm hợp đồng hợp lệ
                    startDate.setFullYear(startDate.getFullYear() + years); // Cộng thêm số năm vào ngày bắt đầu
                    document.getElementById('endDate').value = startDate.toISOString().split('T')[0]; // Cập nhật ngày kết thúc
                } else {
                    document.getElementById('endDate').value = ''; // Xóa giá trị ngày kết thúc nếu không hợp lệ
                }

                var premium = parseFloat(document.getElementById('premium').value); // Lấy giá trị premium từ input
                if (!isNaN(years) && !isNaN(premium) && years > 0 && premium > 0) { // Kiểm tra premium hợp lệ
                    document.getElementById('value').value = years * premium; // Cập nhật tổng giá trị hợp đồng
                } else {
                    document.getElementById('value').value = ''; // Xóa giá trị tổng hợp đồng nếu không hợp lệ
                }

                if (!isNaN(years) && years > 0) { // Kiểm tra số năm hợp đồng hợp lệ
                    document.getElementById('coverage').value = "This contract will be valid for " + years + " years."; // Cập nhật nội dung coverage
                } else {
                    document.getElementById('coverage').value = ''; // Xóa nội dung coverage nếu không hợp lệ
                }
            },

            // Cập nhật chi tiết bảo hiểm dựa trên loại bảo hiểm đã chọn
            updateInsuranceDetails() {
                let premium, detail, contractInfo;
                switch (this.insuranceType) {
                    case 'Basic':
                        premium = 100; // Giá trị premium cho gói Basic
                        detail = 'This is a basic insurance package.'; // Chi tiết cho gói Basic
                        contractInfo = 'Basic Motorcycle Insurance'; // Thông tin hợp đồng cho gói Basic
                        break;
                    case 'Comprehensive':
                        premium = 150; // Giá trị premium cho gói Comprehensive
                        detail = 'This is a comprehensive insurance package.'; // Chi tiết cho gói Comprehensive
                        contractInfo = 'Comprehensive Motorcycle Insurance'; // Thông tin hợp đồng cho gói Comprehensive
                        break;
                    case 'Premium':
                        premium = 250; // Giá trị premium cho gói Premium
                        detail = 'This is a premium insurance package.'; // Chi tiết cho gói Premium
                        contractInfo = 'Premium Motorcycle Insurance'; // Thông tin hợp đồng cho gói Premium
                        break;
                }
                document.getElementById('premium').value = premium; // Cập nhật giá trị premium vào input
                document.getElementById('detail').value = detail; // Cập nhật chi tiết vào input
                document.getElementById('contractInfo').value = contractInfo; // Cập nhật thông tin hợp đồng vào input
                this.updateContractDetails(); // Gọi hàm cập nhật chi tiết hợp đồng
            },

            // Chuyển đổi hiển thị chi tiết thanh toán dựa trên phương thức thanh toán đã chọn
            togglePaymentDetails() {
                var cashPaymentDetails = document.getElementById('cashPaymentDetails'); // Lấy phần tử chi tiết thanh toán tiền mặt
                var bankTransferDetails = document.getElementById('bankTransferDetails'); // Lấy phần tử chi tiết chuyển khoản ngân hàng
                var submitBtn = document.getElementById('submitBtn'); // Lấy nút submit
                if (this.paymentMethod === "cash") {
                    cashPaymentDetails.style.display = "block"; // Hiển thị chi tiết thanh toán tiền mặt
                    bankTransferDetails.style.display = "none"; // Ẩn chi tiết chuyển khoản ngân hàng
                    submitBtn.disabled = false; // Bật nút submit
                } else if (this.paymentMethod === "bankTransfer") {
                    cashPaymentDetails.style.display = "none"; // Ẩn chi tiết thanh toán tiền mặt
                    bankTransferDetails.style.display = "block"; // Hiển thị chi tiết chuyển khoản ngân hàng
                    submitBtn.disabled = true; // Tắt nút submit
                } else {
                    cashPaymentDetails.style.display = "none"; // Ẩn chi tiết thanh toán tiền mặt
                    bankTransferDetails.style.display = "none"; // Ẩn chi tiết chuyển khoản ngân hàng
                    submitBtn.disabled = true; // Tắt nút submit
                }
            },

            // Kiểm tra và gửi form
            validateAndSubmitForm() {
                // Kiểm tra nếu không có thông tin xe máy
                if (document.querySelectorAll('[id^=motorcycleID]').length === 0) {
                    Swal.fire({
                        title: 'Motorcycle Information Required',
                        text: 'You need to add your motorcycle information before creating a new contract. Please visit the homepage and click on "Personal Information" to add your motorcycle and personal details.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                    return;
                }

                // Kiểm tra nếu phương thức thanh toán là chuyển khoản ngân hàng nhưng không khả dụng
                if (this.paymentMethod === 'bankTransfer') {
                    Swal.fire({
                        title: 'Bank Transfer Unavailable',
                        text: 'Currently, the bank transfer payment method is not available. Please choose another payment method.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                    return;
                }

                // Hiển thị hộp thoại xác nhận trước khi gửi form
                Swal.fire({
                    title: 'Confirm Contract Creation',
                    text: 'Are you sure you want to create this contract and ensure all information is correct?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, create it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('createContractForm').submit(); // Gửi form nếu người dùng xác nhận
                    }
                });
            }
        }
    }

    // Thêm sự kiện DOMContentLoaded để cài đặt giá trị ngày
    document.addEventListener('DOMContentLoaded', function () {
        // Cài đặt giá trị ngày bắt đầu là ngày hiện tại
        var today = new Date();
        var day = ("0" + today.getDate()).slice(-2);
        var month = ("0" + (today.getMonth() + 1)).slice(-2);
        var year = today.getFullYear();
        var todayDate = year + "-" + month + "-" + day;
        document.getElementById('startDate').value = todayDate;
    });
</script>
</body>
</html>