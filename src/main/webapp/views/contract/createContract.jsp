<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create New Contract</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createContract.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.10.5/cdn.min.js" defer></script>
</head>
<body class="bg-gray-100 font-sans">
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
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
<!-- Notification Message -->
<c:if test="${not empty message}">
    <div id="notification" class="alert ${status ? 'alert-success' : 'alert-danger'} alert-dismissible fade show" role="alert">
        <c:out value="${message}"/>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<!-- End of notification message -->
<!-- Form -->
<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-lg">
    <div class="card">
        <div class="card-header text-center bg-blue-600 text-white py-4">
            <h2 class="text-3xl font-bold"><i class="fas fa-file-contract"></i> Create New Contract</h2>
        </div>
        <div class="card-body mt-6">
            <form id="createContractForm" action="${pageContext.request.contextPath}/createContract" method="post">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="col-span-1">
                        <h3 class="text-2xl text-blue-600 mb-4"><i class="fas fa-user"></i> Customer Information</h3>
                        <!-- Customer Information Fields -->
                        <div class="mb-4">
                            <label for="customerID" class="block text-gray-700 font-bold mb-2">Customer ID:</label>
                            <input type="number" id="customerID" name="customerID" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.customerID}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerUsername" class="block text-gray-700 font-bold mb-2">Customer Username:</label>
                            <input type="text" id="customerUsername" name="customerUsername" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.username}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerName" class="block text-gray-700 font-bold mb-2">Customer Name:</label>
                            <input type="text" id="customerName" name="customerName" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.fullName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="firstName" class="block text-gray-700 font-bold mb-2">First Name:</label>
                            <input type="text" id="firstName" name="firstName" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.firstName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="lastName" class="block text-gray-700 font-bold mb-2">Last Name:</label>
                            <input type="text" id="lastName" name="lastName" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.lastName}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerPhone" class="block text-gray-700 font-bold mb-2">Customer Phone:</label>
                            <input type="text" id="customerPhone" name="customerPhone" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.mobile}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerEmail" class="block text-gray-700 font-bold mb-2">Customer Email:</label>
                            <input type="email" id="customerEmail" name="customerEmail" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.email}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="customerGender" class="block text-gray-700 font-bold mb-2">Gender:</label>
                            <input type="text" id="customerGender" name="customerGender" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.gender}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="province" class="block text-gray-700 font-bold mb-2">Province:</label>
                            <input type="text" id="province" name="province" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.province}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="district" class="block text-gray-700 font-bold mb-2">District:</label>
                            <input type="text" id="district" name="district" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.district}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="country" class="block text-gray-700 font-bold mb-2">Country:</label>
                            <input type="text" id="country" name="country" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.user.country}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="birthDate" class="block text-gray-700 font-bold mb-2">Birth Date:</label>
                            <input type="date" id="birthDate" name="birthDate" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="<fmt:formatDate value='${customer.user.birthDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="personalInfo" class="block text-gray-700 font-bold mb-2">Personal Info:</label>
                            <input type="text" id="personalInfo" name="personalInfo" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${customer.personalInfo}" readonly>
                        </div>
                    </div>

                    <div class="col-span-1">
                        <h3 class="text-2xl text-blue-600 mb-4"><i class="fas fa-motorcycle"></i> Motorcycle Information</h3>
                        <!-- Motorcycle Information Fields -->
                        <c:forEach var="motorcycle" items="${motorcycles}">
                            <div class="mb-4">
                                <label for="motorcycleID" class="block text-gray-700 font-bold mb-2">Motorcycle ID:</label>
                                <input type="number" id="motorcycleID" name="motorcycleID" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.motorcycleID}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="licensePlate" class="block text-gray-700 font-bold mb-2">License Plate:</label>
                                <input type="text" id="licensePlate" name="licensePlate" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.licensePlate}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="brand" class="block text-gray-700 font-bold mb-2">Brand:</label>
                                <input type="text" id="brand" name="brand" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.brand}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="model" class="block text-gray-700 font-bold mb-2">Model:</label>
                                <input type="text" id="model" name="model" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.model}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="yearOfManufacture" class="block text-gray-700 font-bold mb-2">Year Of Manufacture:</label>
                                <input type="number" id="yearOfManufacture" name="yearOfManufacture" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.yearOfManufacture}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="color" class="block text-gray-700 font-bold mb-2">Color:</label>
                                <input type="text" id="color" name="color" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.color}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="engineNumber" class="block text-gray-700 font-bold mb-2">Engine Number:</label>
                                <input type="text" id="engineNumber" name="engineNumber" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.engineNumber}" readonly>
                            </div>
                            <div class="mb-4">
                                <label for="frameNumber" class="block text-gray-700 font-bold mb-2">Frame Number:</label>
                                <input type="text" id="frameNumber" name="frameNumber" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" value="${motorcycle.frameNumber}" readonly>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-6">
                    <div class="col-span-1">
                        <h3 class="text-2xl text-blue-600 mb-4"><i class="fas fa-file-contract"></i> Contract Information</h3>
                        <div class="mb-4">
                            <label for="contractYears" class="block text-gray-700 font-bold mb-2">Contract Years:</label>
                            <input type="number" id="contractYears" name="contractYears" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" min="1" required>
                            <small class="text-red-500">Please select the number of years for the contract.</small>
                        </div>
                        <div class="mb-4">
                            <label for="startDate" class="block text-gray-700 font-bold mb-2">Start Date:</label>
                            <input type="date" id="startDate" name="startDate" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" required readonly>
                        </div>
                        <div class="mb-4">
                            <label for="endDate" class="block text-gray-700 font-bold mb-2">End Date:</label>
                            <input type="date" id="endDate" name="endDate" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" required readonly>
                        </div>
                        <div class="mb-4">
                            <label for="insuranceType" class="block text-gray-700 font-bold mb-2">Insurance Type:</label>
                            <select id="insuranceType" name="insuranceType" class="form-select mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                                <option value="">Select Insurance Type</option>
                                <option value="Basic">Basic</option>
                                <option value="Comprehensive">Comprehensive</option>
                                <option value="Premium">Premium</option>
                            </select>
                            <small class="text-red-500">Please select the type of insurance you want.</small>
                        </div>
                        <div class="mb-4">
                            <label for="contractInfo" class="block text-gray-700 font-bold mb-2">Contract Info:</label>
                            <input type="text" id="contractInfo" name="contractInfo" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="value" class="block text-gray-700 font-bold mb-2">Value:</label>
                            <input type="number" id="value" name="value" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" step="50" min="50" readonly>
                            <small class="text-red-500">The total contract value is calculated as the number of insurance years multiplied by the premium per year. (in $)</small>
                        </div>
                        <div class="mb-4">
                            <label for="detail" class="block text-gray-700 font-bold mb-2">Detail:</label>
                            <textarea id="detail" name="detail" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" rows="3" readonly></textarea>
                        </div>
                        <div class="mb-4">
                            <label for="coverage" class="block text-gray-700 font-bold mb-2">Coverage:</label>
                            <input type="text" id="coverage" name="coverage" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="premium" class="block text-gray-700 font-bold mb-2">Premium:</label>
                            <input type="number" id="premium" name="premium" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" step="50" min="50" readonly>
                            <small class="text-red-500">The contract value per year (in $).</small>
                        </div>
                    </div>

                    <div class="col-span-1">
                        <h3 class="text-2xl text-blue-600 mb-4"><i class="fas fa-money-bill-wave"></i> Payment Information</h3>
                        <div class="mb-4">
                            <label for="paymentMethod" class="block text-gray-700 font-bold mb-2">Payment Method:</label>
                            <select id="paymentMethod" name="paymentMethod" class="form-select mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" required>
                                <option value="">Select Payment Method</option>
                                <option value="cash">Cash</option>
                                <option value="bankTransfer">Bank Transfer</option>
                            </select>
                        </div>
                        <div class="hidden" id="cashPaymentDetails">
                            <div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4" role="alert">
                                <p class="font-bold"><i class="fas fa-exclamation-circle"></i> Cash Payment Details</p>
                                <p>Please bring your contract to our office to complete the payment in cash.</p>
                                <p>Motorcycle Insurance Company,<br> 123 Hola Street,<br> Thach That District, Hanoi,<br> Vietnam</p>
                                <p>Phone: 0123-456-789<br> <a href="http://www.motorcycleinsurance.vn" class="text-blue-500 hover:underline">www.motorcycleinsurance.vn</a></p>
                            </div>
                        </div>
                        <div class="hidden" id="bankTransferDetails">
                            <div class="bg-blue-100 border-l-4 border-blue-500 text-blue-700 p-4" role="alert">
                                <p class="font-bold"><i class="fas fa-exclamation-circle"></i> Bank Transfer Details</p>
                                <p>You will be redirected to the bank transfer page to complete the payment.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 mt-6">
                    <div class="col-span-1">
                        <h3 class="text-2xl text-blue-600 mb-4"><i class="fas fa-box"></i> Insurance Packages</h3>
                        <div x-data="{ openPackage: null }" class="accordion">
                            <div class="border border-gray-300 rounded-md mb-4">
                                <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 1 ? null : 1">
                                    <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Basic Motorcycle Insurance</h2>
                                </div>
                                <div x-show="openPackage === 1" class="p-4">
                                    <p>This option provides the fundamental coverage for your motorcycle. After completing your contact information and selecting your insurance package, please submit the form to the Insurance Advisor at the address below. You will receive an invitation to attend an information session. We aim to provide you with as much information as possible about our insurance policies. At the end of the session, you may complete the application for insurance and pay the $100 insurance fee.</p>
                                </div>
                            </div>
                            <div class="border border-gray-300 rounded-md mb-4">
                                <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 2 ? null : 2">
                                    <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Comprehensive Motorcycle Insurance</h2>
                                </div>
                                <div x-show="openPackage === 2" class="p-4">
                                    <p>This package offers complete protection for your motorcycle, including accident and theft insurance. Additionally, you will receive monthly newsletters with updates on your insurance coverage. The insurance fee is $150 per year. Comprehensive insurance not only covers basic liabilities but also includes coverage for damage caused by natural disasters, fire, and vandalism. This ensures that you have peace of mind in any situation.</p>
                                </div>
                            </div>
                            <div class="border border-gray-300 rounded-md mb-4">
                                <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 3 ? null : 3">
                                    <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Premium Motorcycle Insurance</h2>
                                </div>
                                <div x-show="openPackage === 3" class="p-4">
                                    <p>Our premium package provides the highest level of coverage. This includes all the benefits of comprehensive insurance, plus additional features such as roadside assistance, rental reimbursement, and coverage for custom parts and equipment. The premium insurance fee is $250 per year. With this package, you are guaranteed the best support and quickest response in case of any incident. Our premium plan also includes a personal advisor who will assist you with all your insurance needs.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="mt-6 text-center">
                    <button type="submit" class="bg-blue-600 text-white font-bold py-2 px-4 rounded shadow hover:bg-blue-700 transition transform hover:scale-105" id="submitBtn"><i class="fas fa-file-contract"></i> Create Contract</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var today = new Date();
        var day = ("0" + today.getDate()).slice(-2);
        var month = ("0" + (today.getMonth() + 1)).slice(-2);
        var year = today.getFullYear();
        var todayDate = year + "-" + month + "-" + day;
        document.getElementById('startDate').value = todayDate;

        document.getElementById('contractYears').addEventListener('input', function () {
            updateEndDate();
            updateValue();
        });

        function updateEndDate() {
            var startDate = new Date(document.getElementById('startDate').value);
            var years = parseInt(document.getElementById('contractYears').value);
            if (!isNaN(years) && years > 0) {
                startDate.setFullYear(startDate.getFullYear() + years);
                document.getElementById('endDate').value = startDate.toISOString().split('T')[0];
            } else {
                document.getElementById('endDate').value = '';
            }
        }

        function updateValue() {
            var years = parseInt(document.getElementById('contractYears').value);
            var premium = parseFloat(document.getElementById('premium').value);
            if (!isNaN(years) && !isNaN(premium) && years > 0 && premium > 0) {
                document.getElementById('value').value = years * premium;
            } else {
                document.getElementById('value').value = '';
            }
        }

        document.getElementById('endDate').addEventListener('change', function () {
            var startDate = new Date(document.getElementById('startDate').value);
            var endDate = new Date(this.value);
            if (endDate < startDate) {
                alert("End Date cannot be earlier than Start Date");
                this.value = '';
            }
        });

        document.getElementById('createContractForm').addEventListener('submit', function (event) {
            var startDate = document.getElementById('startDate').value;
            var endDate = document.getElementById('endDate').value;
            if (new Date(endDate) < new Date(startDate)) {
                alert("End Date cannot be earlier than Start Date");
                event.preventDefault();
            } else {
                event.preventDefault(); // Prevent form submission for confirmation
                showConfirmationDialog();
            }
        });

        function showConfirmationDialog() {
            const modal = document.createElement('div');
            modal.classList.add('fixed', 'inset-0', 'flex', 'items-center', 'justify-center', 'bg-black', 'bg-opacity-50');
            modal.innerHTML = `
                <div class="bg-white p-6 rounded-lg shadow-lg max-w-md mx-auto">
                    <div class="text-center mb-4">
                        <h5 class="text-2xl font-bold text-gray-800">Confirm Contract Creation</h5>
                    </div>
                    <div class="text-center mb-4">
                        <p>Are you sure you want to create this contract and ensure all information is correct?</p>
                    </div>
                    <div class="text-center">
                        <button class="bg-green-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 mr-2" id="confirmCreateContract">Yes</button>
                        <button class="bg-red-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-2" id="cancelCreateContract">No</button>
                    </div>
                </div>
            `;
            document.body.appendChild(modal);

            document.getElementById('confirmCreateContract').addEventListener('click', function () {
                document.body.removeChild(modal);
                document.getElementById('createContractForm').submit();
            });

            document.getElementById('cancelCreateContract').addEventListener('click', function () {
                document.body.removeChild(modal);
            });
        }

        setTimeout(function () {
            var notification = document.getElementById('notification');
            if (notification) {
                notification.style.opacity = '0';
                setTimeout(function () {
                    notification.style.display = 'none';
                }, 300);
            }
        }, 5000);

        document.getElementById('paymentMethod').addEventListener('change', function () {
            togglePaymentDetails();
        });

        function togglePaymentDetails() {
            var paymentMethod = document.getElementById('paymentMethod').value;
            var cashPaymentDetails = document.getElementById('cashPaymentDetails');
            var bankTransferDetails = document.getElementById('bankTransferDetails');

            if (paymentMethod === "cash") {
                cashPaymentDetails.style.display = "block";
                bankTransferDetails.style.display = "none";
            } else if (paymentMethod === "bankTransfer") {
                cashPaymentDetails.style.display = "none";
                bankTransferDetails.style.display = "block";
            } else {
                cashPaymentDetails.style.display = "none";
                bankTransferDetails.style.display = "none";
            }
        }

        document.getElementById('insuranceType').addEventListener('change', function () {
            const selectedType = this.value;
            if (selectedType) {
                const modal = document.createElement('div');
                modal.classList.add('fixed', 'inset-0', 'flex', 'items-center', 'justify-center', 'bg-black', 'bg-opacity-50');
                modal.innerHTML = `
                <div class="bg-white p-6 rounded-lg shadow-lg max-w-md mx-auto">
                    <div class="text-center mb-4">
                        <h5 class="text-2xl font-bold text-gray-800">Confirm Insurance Type</h5>
                    </div>
                    <div class="text-center mb-4">
                        <p>Are you sure you want to select ${selectedType} insurance?</p>
                    </div>
                    <div class="text-center">
                        <button class="bg-green-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 mr-2" id="confirmInsuranceType">Yes</button>
                        <button class="bg-red-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-2" id="cancelInsuranceType">No</button>
                    </div>
                </div>
            `;
                document.body.appendChild(modal);

                document.getElementById('confirmInsuranceType').addEventListener('click', function () {
                    updateInsuranceDetails(selectedType);
                    document.body.removeChild(modal);
                });

                document.getElementById('cancelInsuranceType').addEventListener('click', function () {
                    document.body.removeChild(modal);
                });
            }
        });

        function updateInsuranceDetails(type) {
            let premium, coverage, detail, contractInfo;
            switch (type) {
                case 'Basic':
                    premium = 100;
                    coverage = 'Basic coverage details...';
                    detail = 'This is a basic insurance package.';
                    contractInfo = 'Basic Motorcycle Insurance';
                    break;
                case 'Comprehensive':
                    premium = 150;
                    coverage = 'Comprehensive coverage details...';
                    detail = 'This is a comprehensive insurance package.';
                    contractInfo = 'Comprehensive Motorcycle Insurance';
                    break;
                case 'Premium':
                    premium = 250;
                    coverage = 'Premium coverage details...';
                    detail = 'This is a premium insurance package.';
                    contractInfo = 'Premium Motorcycle Insurance';
                    break;
            }
            document.getElementById('premium').value = premium;
            document.getElementById('coverage').value = coverage;
            document.getElementById('detail').value = detail;
            document.getElementById('contractInfo').value = contractInfo;
            updateValue();
        }
    });
</script>
</body>
</html>