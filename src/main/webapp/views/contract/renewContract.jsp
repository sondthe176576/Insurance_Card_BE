<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Renew Contract</title>
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <!-- Thư viện CSS -->
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tippy.js@6.3.1/dist/tippy.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .glassmorphism {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        .hover-scale {
            transition: transform 0.3s ease-in-out;
        }
        .hover-scale:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body class="bg-gradient-to-r from-blue-400 to-purple-500 font-sans">
<!-- Header và Navbar-->
<jsp:include page="/views/includes/header_logout.jsp"/>
<jsp:include page="/views/includes/navbar.jsp"/>

<!-- Form gia hạn hợp đồng -->
<div class="container mx-auto mt-10 p-6 glassmorphism animate__animated animate__fadeIn">
    <div class="card">
        <div class="card-header text-center bg-blue-600 text-white p-4 rounded-t-lg">
            <h2 class="text-4xl font-bold"><i class="mdi mdi-file-document-edit"></i> Renew Contract</h2>
        </div>
        <div class="card-body mt-6">
            <form id="renewContractForm" action="${pageContext.request.contextPath}/renewContract" method="post" class="space-y-6">
                <input type="hidden" name="action" value="renew">

                <!-- Thông tin khách hàng -->
                <div class="glassmorphism p-6 hover-scale">
                    <h4 class="text-2xl text-blue-600 mb-4"><i class="mdi mdi-account"></i> Customer Information</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="mb-4">
                            <label for="customerID" class="form-label font-bold text-gray-700">Customer ID:</label>
                            <input type="number" id="customerID" name="customerID" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.customerID}" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="username" class="form-label font-bold text-gray-700">Username:</label>
                            <input type="text" id="username" name="username" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.user.username}" readonly>
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
                            <input type="text" id="birthDate" name="birthDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.customer.user.birthDate}' pattern='yyyy-MM-dd'/>" readonly>
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
                        <div class="mb-4">
                            <label for="personalInfo" class="form-label font-bold text-gray-700">Personal Info:</label>
                            <input type="text" id="personalInfo" name="personalInfo" class="form-input bg-gray-100 p-2 rounded w-full" value="${contract.customer.personalInfo}" readonly>
                        </div>
                    </div>
                </div>

                <!-- Thông tin phương tiện -->
                <div class="glassmorphism p-6 hover-scale">
                    <h4 class="text-2xl text-blue-600 mb-4"><i class="mdi mdi-motorbike"></i> Vehicle Information</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
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

                <!-- Thông tin hợp đồng -->
                <div class="glassmorphism p-6 hover-scale">
                    <h4 class="text-2xl text-blue-600 mb-4"><i class="mdi mdi-file-document"></i> Contract Information</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
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
                            <input type="text" id="startDate" name="startDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.startDate}' pattern='yyyy-MM-dd'/>" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="endDate" class="form-label font-bold text-gray-700">End Date:</label>
                            <input type="text" id="endDate" name="endDate" class="form-input bg-gray-100 p-2 rounded w-full" value="<fmt:formatDate value='${contract.endDate}' pattern='yyyy-MM-dd'/>" readonly>
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
                </div>

                <!-- Gia hạn hợp đồng -->
                <div class="glassmorphism p-6 hover-scale">
                    <h4 class="text-2xl text-blue-600 mb-4"><i class="mdi mdi-pencil"></i> Renew Contract</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
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
                            <input type="text" id="value" name="value" class="form-input bg-gray-100 p-2 rounded w-full" readonly>
                        </div>
                        <div class="mb-4">
                            <label for="newCoverage" class="form-label font-bold text-gray-700">New Coverage:</label>
                            <input type="text" id="newCoverage" name="newCoverage" class="form-input bg-gray-100 p-2 rounded w-full" readonly>
                        </div>
                    </div>
                </div>

                <!-- Nút thực hiện -->
                <div class="flex justify-center mt-6 space-x-4">
                    <button type="button" id="renewButton" class="btn-custom bg-blue-600 text-white py-3 px-6 rounded-full shadow-lg transition transform hover:scale-105 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50" onclick="showConfirmationModal()">
                        <i class="mdi mdi-file-document-edit-outline mr-2"></i> Renew Contract
                    </button>
                    <button type="button" id="notifyButton" class="btn-custom bg-yellow-500 text-white py-3 px-6 rounded-full shadow-lg transition transform hover:scale-105 hover:bg-yellow-600 focus:outline-none focus:ring-2 focus:ring-yellow-500 focus:ring-opacity-50" onclick="showExpirationNotificationModal()">
                        <i class="mdi mdi-bell-ring-outline mr-2"></i> Expiration Notification
                    </button>
                    <button type="button" id="confirmExpireButton" class="btn-custom bg-red-600 text-white py-3 px-6 rounded-full shadow-lg transition transform hover:scale-105 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-opacity-50" onclick="showExpirationConfirmationModal()">
                        <i class="mdi mdi-close-circle-outline mr-2"></i> Confirm Expiration
                    </button>
                    <a href="${pageContext.request.contextPath}/listRenewContract" class="btn-custom bg-gray-600 text-white py-3 px-6 rounded-full shadow-lg transition transform hover:scale-105 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-opacity-50">
                        <i class="mdi mdi-arrow-left mr-2"></i> Back to List
                    </a>
                </div>
                <c:if test="${contract.status == 'Expired' || contract.status == 'Pending' || contract.status == 'Canceled' || contract.status == 'Rejected'}">
                    <div class="text-center mt-4 text-red-600 font-bold">
                        This contract is in ${contract.status} status and cannot be renewed.
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="/views/includes/footer.jsp"/>

<!-- Modals -->
<!-- Modal xác nhận gia hạn hợp đồng -->
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
<div class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden" id="expirationNotificationModal">
    <div class="bg-white p-6 rounded-lg shadow-lg animate__animated animate__fadeIn">
        <div class="text-center mb-4">
            <h5 class="text-2xl font-bold text-gray-800">Expiration Notification</h5>
        </div>
        <div class="text-center mb-4">
            Do you want to send a notification to the customer that this contract has expired?
        </div>
        <div class="text-center">
            <form id="expirationNotificationForm" action="${pageContext.request.contextPath}/renewContract" method="post">
                <input type="hidden" name="action" value="expire">
                <input type="hidden" name="contractID" value="${contract.contractID}">
                <button type="button" class="btn modal-btn bg-green-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105" onclick="confirmExpirationNotification()">Yes</button>
                <button type="button" class="btn modal-btn bg-red-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-4" onclick="document.getElementById('expirationNotificationModal').classList.add('hidden')">No</button>
            </form>
        </div>
    </div>
</div>
<div class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden" id="expirationConfirmationModal">
    <div class="bg-white p-6 rounded-lg shadow-lg animate__animated animate__fadeIn">
        <div class="text-center mb-4">
            <h5 class="text-2xl font-bold text-gray-800" id="expirationConfirmationModalLabel">Expiration Confirmation</h5>
        </div>
        <div class="text-center mb-4">
            This contract will be marked as expired. Do you want to proceed?
        </div>
        <div class="text-center">
            <form id="confirmExpirationForm" action="${pageContext.request.contextPath}/renewContract" method="post">
                <input type="hidden" name="action" value="confirmExpiration">
                <input type="hidden" name="contractID" value="${contract.contractID}">
                <button type="button" class="btn modal-btn bg-green-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105" onclick="confirmExpiration()">Yes</button>
                <button type="button" class="btn modal-btn bg-red-500 text-white py-2 px-4 rounded-md shadow-md transition transform hover:scale-105 ml-4" onclick="document.getElementById('expirationConfirmationModal').classList.add('hidden')">No</button>
            </form>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/tippy.js@6.3.1/dist/tippy-bundle.umd.min.js"></script>
<script>
    // Khởi tạo tooltips
    tippy('[data-tippy-content]');

    // Hiển thị thông báo sử dụng SweetAlert2
    document.addEventListener('DOMContentLoaded', (event) => {
        // Đặt giá trị ngày bắt đầu mới là ngày hiện tại
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('newStartDate').value = today;
        calculateEndDate();

        // Vô hiệu hóa các nút nếu hợp đồng đã hết hạn hoặc ở trạng thái Pending, Canceled, Rejected
        const status = document.getElementById('status').value;
        if (status === 'Expired' || status === 'Pending' || status === 'Canceled' || status === 'Rejected') {
            document.getElementById('renewButton').disabled = true;
            document.getElementById('notifyButton').disabled = true;
            document.getElementById('confirmExpireButton').disabled = true;
        }
    });

    // Hàm tính toán ngày kết thúc và giá trị hợp đồng mới
    function calculateEndDate() {
        const startDate = new Date(document.getElementById('newStartDate').value);
        const renewalYears = parseInt(document.getElementById('renewalYears').value);
        const premium = parseFloat(document.getElementById('premium').value);

        // Kiểm tra tính hợp lệ của dữ liệu đầu vào
        if (!isNaN(renewalYears) && renewalYears > 0 && !isNaN(premium) && !isNaN(startDate.getTime())) {
            const endDate = new Date(startDate);
            endDate.setFullYear(startDate.getFullYear() + renewalYears);
            document.getElementById('newEndDate').value = endDate.toISOString().split('T')[0];

            const newValue = premium * renewalYears;
            document.getElementById('value').value = newValue.toFixed(2);

            const newCoverage = "This contract will be valid for " + renewalYears + " years.";
            document.getElementById('newCoverage').value = newCoverage;
        }
    }

    // Hàm kiểm tra các trường bắt buộc và hiển thị modal xác nhận gia hạn hợp đồng
    function showConfirmationModal() {
        if (validateForm()) {
            Swal.fire({
                title: 'Confirm Renewal',
                text: 'Are you sure you want to renew this contract?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Yes, renew it!',
                cancelButtonText: 'No, cancel',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    confirmRenewal();
                }
            });
        } else {
            Swal.fire({
                title: 'Incomplete Information',
                text: 'Please fill in all required fields before proceeding.',
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        }
    }

    // Hàm kiểm tra các trường bắt buộc đã được điền đủ hay chưa
    function validateForm() {
        const renewalYears = document.getElementById('renewalYears').value;
        const newStartDate = document.getElementById('newStartDate').value;
        return renewalYears && newStartDate;
    }

    // Hàm xác nhận gia hạn hợp đồng
    function confirmRenewal() {
        document.getElementById('renewContractForm').submit();
    }

    // Hàm hiển thị modal thông báo hợp đồng hết hạn sử dụng SweetAlert2
    function showExpirationNotificationModal() {
        Swal.fire({
            title: 'Expiration Notification',
            text: 'Do you want to send a notification to the customer that this contract has expired?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, send it!',
            cancelButtonText: 'No, cancel',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                confirmExpirationNotification();
            }
        });
    }

    // Hàm xác nhận thông báo hết hạn hợp đồng
    function confirmExpirationNotification() {
        document.getElementById('expirationNotificationForm').submit();
    }

    // Hàm hiển thị modal xác nhận hết hạn hợp đồng sử dụng SweetAlert2
    function showExpirationConfirmationModal() {
        Swal.fire({
            title: 'Confirm Expiration',
            text: 'This contract will be marked as expired. Do you want to proceed?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, proceed!',
            cancelButtonText: 'No, cancel',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                confirmExpiration();
            }
        });
    }

    // Hàm xác nhận hết hạn hợp đồng
    function confirmExpiration() {
        document.getElementById('confirmExpirationForm').submit();
    }
</script>
</body>
</html>