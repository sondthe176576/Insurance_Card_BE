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
    <!-- Thiết lập các thông tin cơ bản cho trang -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bill</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">

    <!-- Bao gồm các thư viện CSS và JS từ các nguồn CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>

    <!-- Định dạng và hiệu ứng CSS cho trang -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4f8;
        }

        .glassmorphism {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        .table-container {
            overflow-x: auto;
            scrollbar-width: thin;
            scrollbar-color: #4a5568 #cbd5e0;
        }

        .table-container::-webkit-scrollbar {
            height: 8px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #cbd5e0;
        }

        .table-container::-webkit-scrollbar-thumb {
            background-color: #4a5568;
            border-radius: 20px;
            border: 3px solid #cbd5e0;
        }

        .hover-scale {
            transition: transform 0.3s ease-in-out;
        }

        .hover-scale:hover {
            transform: scale(1.05);
        }

        .timeline {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            margin-top: 2rem;
        }

        .timeline .event {
            text-align: center;
            flex-basis: 30%;
        }

        .timeline .event .icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 2rem;
            height: 2rem;
            border-radius: 50%;
            background-color: #1f2937;
            color: #fff;
            margin: 0 auto;
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body class="flex flex-col min-h-screen">

<!-- Bao gồm phần header -->
<jsp:include page="/views/includes/header_logout.jsp"/>

<!-- Thanh điều hướng navbar -->
<nav class="bg-gradient-to-r from-blue-800 to-indigo-900 shadow-lg">
    <div class="container mx-auto px-4">
        <div class="flex items-center justify-center h-16">
            <div class="flex items-center space-x-4">
                <!-- Các liên kết điều hướng -->
                <a href="${pageContext.request.contextPath}/homepageforcustomer"
                   class="text-white hover:bg-blue-700 px-3 py-2 rounded-md text-sm font-medium transition duration-300 ease-in-out hover-scale">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}"
                   class="text-white hover:bg-blue-700 px-3 py-2 rounded-md text-sm font-medium transition duration-300 ease-in-out hover-scale">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
                <a href="#"
                   class="text-white hover:bg-blue-700 px-3 py-2 rounded-md text-sm font-medium transition duration-300 ease-in-out hover-scale">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
                <a href="${pageContext.request.contextPath}/contractForCustomer"
                   class="text-white hover:bg-blue-700 px-3 py-2 rounded-md text-sm font-medium transition duration-300 ease-in-out hover-scale">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
                <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp"
                   class="text-white hover:bg-blue-700 px-3 py-2 rounded-md text-sm font-medium transition duration-300 ease-in-out hover-scale">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Nội dung chính của trang -->
<div class="container mx-auto p-4 flex-grow">
    <h2 class="text-center text-4xl font-bold text-blue-900 mb-6 animate__animated animate__fadeInDown">Bill
        Details</h2>

    <!-- Thông báo khi có message -->
    <c:if test="${not empty message}">
        <div id="notification"
             class="notification bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4 rounded shadow-md animate__animated animate__fadeInDown glassmorphism">
            <p class="font-bold">Success</p>
            <p>${message}</p>
        </div>
    </c:if>

    <!-- Bảng hiển thị chi tiết hợp đồng -->
    <div class="bg-white rounded-lg shadow-xl overflow-hidden animate__animated animate__fadeInUp glassmorphism">
        <div class="table-container">
            <table class="min-w-full">
                <thead class="bg-gradient-to-r from-blue-600 to-indigo-600 text-white">
                <tr>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Contract ID</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Customer ID</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Contract Info</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Status</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Start Date</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">End Date</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Value ($)</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Detail</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Coverage</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Premium ($)</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Payment Method</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Payment Amount ($)</th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Status Payment Detail
                    </th>
                    <th class="px-2 py-3 text-left text-xs font-medium uppercase tracking-wider">Actions</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <tr class="hover:bg-gray-50 transition duration-300 ease-in-out">
                    <!-- Hiển thị thông tin hợp đồng từ server -->
                    <td class="px-2 py-4 whitespace-normal text-sm font-medium text-gray-900">${contract.contractID}</td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500">${contract.customerID}</td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500">${contract.contractInfo}</td>
                    <td class="px-2 py-4 whitespace-normal">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                            ${contract.status}
                        </span>
                    </td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500"><fmt:formatDate
                            value="${contract.startDate}" pattern="MM/dd/yyyy"/></td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500"><fmt:formatDate
                            value="${contract.endDate}" pattern="MM/dd/yyyy"/></td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500"><fmt:formatNumber
                            value="${contract.value}" type="currency" currencySymbol="$"/></td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500">${contract.detail}</td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500">${contract.coverage}</td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500"><fmt:formatNumber
                            value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                    <td class="px-2 py-4 whitespace-normal text-sm text-gray-500">${contract.methodPaymentType}</td>
                    <td class="px-2 py-4 whitespace-normal text-sm font-medium text-green-600"><fmt:formatNumber
                            value="${contract.paymentHistory.amount}" type="currency" currencySymbol="$"/></td>
                    <td class="px-2 py-4 whitespace-normal">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
                            ${contract.paymentHistory.paymentDetails}
                        </span>
                    </td>
                    <td class="px-2 py-4 whitespace-normal text-sm font-medium">
                        <a href="${pageContext.request.contextPath}/viewContractForCus?contractID=${contract.contractID}"
                           class="text-indigo-600 hover:text-indigo-900 transition duration-300 ease-in-out hover-scale"
                           id="viewDetailBtn">
                            <i class="fas fa-eye"></i> View Detail
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Hiển thị timeline hợp đồng -->
    <div class="mt-8 bg-white p-6 rounded-lg shadow-lg glassmorphism">
        <h3 class="text-xl font-semibold mb-4">Contract Timeline</h3>
        <div class="timeline">
            <!-- Sự kiện bắt đầu hợp đồng -->
            <div class="event">
                <div class="icon bg-blue-500">
                    <i class="fas fa-flag-checkered"></i>
                </div>
                <div>
                    <h4 class="font-bold text-lg text-gray-800 mb-1">Contract Start</h4>
                    <p class="text-sm text-gray-600"><fmt:formatDate value="${contract.startDate}"
                                                                     pattern="MM/dd/yyyy"/></p>
                </div>
            </div>
            <!-- Sự kiện ngày hiện tại -->
            <div class="event">
                <div class="icon bg-green-500">
                    <i class="fas fa-check"></i>
                </div>
                <div>
                    <h4 class="font-bold text-lg text-gray-800 mb-1">Current Date</h4>
                    <p class="text-sm text-gray-600"><fmt:formatDate value="<%= new java.util.Date() %>"
                                                                     pattern="MM/dd/yyyy"/></p>
                </div>
            </div>
            <!-- Sự kiện kết thúc hợp đồng -->
            <div class="event">
                <div class="icon bg-red-500">
                    <i class="fas fa-flag"></i>
                </div>
                <div>
                    <h4 class="font-bold text-lg text-gray-800 mb-1">Contract End</h4>
                    <p class="text-sm text-gray-600"><fmt:formatDate value="${contract.endDate}"
                                                                     pattern="MM/dd/yyyy"/></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bao gồm footer -->
<jsp:include page="/views/includes/footer.jsp"/>

<!-- JavaScript cho các tương tác trên trang -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Tự động ẩn thông báo sau 5 giây
        const notification = document.getElementById('notification');
        if (notification) {
            setTimeout(() => {
                notification.classList.add('animate__fadeOutUp');
                setTimeout(() => {
                    notification.style.display = 'none';
                }, 1000);
            }, 5000);
        }

        // Tạo tooltip cho nút "View Detail"
        tippy('#viewDetailBtn', {
            content: 'Click to view more details',
            placement: 'top',
        });

        // Hiển thị chi tiết hợp đồng khi nhấn nút "View Detail"
        function showContractDetails(contractId) {
            Swal.fire({
                title: 'Contract Details',
                html: `
                        <div class="text-left">
                            <p><strong>Contract ID:</strong> ${contract.contractID}</p>
                            <p><strong>Customer ID:</strong> ${contract.customerID}</p>
                            <p><strong>Contract Info:</strong> ${contract.contractInfo}</p>
                            <p><strong>Status:</strong> ${contract.status}</p>
                            <p><strong>Value:</strong> $${contract.value}</p>
                            <p><strong>Coverage:</strong> ${contract.coverage}</p>
                        </div>
                    `,
                icon: 'info',
                confirmButtonText: 'Close',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            });
        }

        // Thêm sự kiện cho nút "View Detail"
        document.getElementById('viewDetailBtn').addEventListener('click', function (e) {
            e.preventDefault();
            showContractDetails('${contract.contractID}');
        });

        // Thêm hiệu ứng cuộn mượt mà cho các liên kết
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Thêm nút hành động nổi để cuộn lên đầu trang
        const fab = document.createElement('button');
        fab.innerHTML = '<i class="fas fa-arrow-up"></i>';
        fab.className = 'fixed bottom-4 right-4 bg-blue-600 text-white rounded-full p-3 shadow-lg hover:bg-blue-700 transition-all duration-300 ease-in-out';
        fab.addEventListener('click', () => {
            window.scrollTo({top: 0, behavior: 'smooth'});
        });
        document.body.appendChild(fab);

        // Hiển thị/ẩn nút hành động nổi dựa trên vị trí cuộn
        window.addEventListener('scroll', () => {
            if (window.pageYOffset > 100) {
                fab.style.display = 'block';
            } else {
                fab.style.display = 'none';
            }
        });

        // Thêm hiệu ứng spinner khi tải trang
        const spinner = document.createElement('div');
        spinner.className = 'fixed top-0 left-0 w-full h-full flex items-center justify-center bg-white bg-opacity-80 z-50';
        spinner.innerHTML = '<div class="animate-spin rounded-full h-32 w-32 border-b-2 border-blue-600"></div>';
        document.body.appendChild(spinner);

        // Loại bỏ spinner sau khi trang tải xong
        window.addEventListener('load', () => {
            spinner.remove();
        });

        // Thêm hiệu ứng hover cho các dòng trong bảng
        const tableRows = document.querySelectorAll('tbody tr');
        tableRows.forEach(row => {
            row.addEventListener('mouseenter', () => {
                row.classList.add('bg-blue-50', 'transition', 'duration-300');
            });
            row.addEventListener('mouseleave', () => {
                row.classList.remove('bg-blue-50', 'transition', 'duration-300');
            });
        });
    });
</script>

<!-- Bao gồm thư viện confetti -->
<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
</body>
</html>