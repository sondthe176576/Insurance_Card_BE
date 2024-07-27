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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of All Contracts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
        }
        .main-content {
            margin-left: 16rem;
            padding: 2rem;
            transition: margin-left 0.3s;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        .card {
            background-color: #ffffff;
            border-radius: 0.75rem;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }
        h2 {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.5rem;
            font-weight: 700;
            color: #2d3748;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 2rem;
        }
        .table th, .table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
            word-wrap: break-word;
        }
        .table th {
            background-color: #4a5568;
            color: white;
            font-weight: 700;
        }
        .table-hover tbody tr:hover {
            background-color: #edf2f7;
        }
        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            font-size: 1.25rem;
            color: white;
            background-color: #4a5568;
            border: none;
            border-radius: 0.5rem;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn:hover {
            background-color: #2d3748;
            transform: scale(1.05);
        }
        .pagination {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
        }
        .pagination li {
            margin: 0 0.5rem;
        }
        .pagination a {
            color: #4a5568;
            text-decoration: none;
            padding: 0.75rem 1rem;
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            transition: background-color 0.3s, transform 0.3s;
        }
        .pagination a:hover {
            background-color: #edf2f7;
            transform: scale(1.05);
        }
        .pagination .active a {
            background-color: #4a5568;
            color: white;
            border-color: #4a5568;
        }
        .header {
            background-color: #4a5568;
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .header .logo {
            font-size: 2rem;
            display: flex;
            align-items: center;
        }
        .header .logo i {
            margin-right: 0.5rem;
        }
        .header .user-profile {
            display: flex;
            align-items: center;
            position: relative;
        }
        .header .user-profile i {
            margin-right: 0.5rem;
            font-size: 1.5rem;
        }
        .header .user-profile a {
            color: white;
            text-decoration: none;
            margin-right: 1.5rem;
            transition: color 0.3s;
        }
        .header .user-profile a:hover {
            color: #ffcc00;
        }
        .header .notifications {
            position: relative;
        }
        .header .notifications .badge {
            position: absolute;
            top: -0.25rem;
            right: -0.5rem;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 0.25rem 0.5rem;
        }
        .header .notifications-menu {
            position: absolute;
            top: 2rem;
            right: 0;
            background-color: white;
            color: black;
            width: 20rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 0.5rem;
            display: none;
        }
        .header .notifications:hover .notifications-menu {
            display: block;
        }
        .header .notifications-menu a {
            display: block;
            padding: 0.75rem;
            color: black;
            text-decoration: none;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s;
        }
        .header .notifications-menu a:hover {
            background-color: #f0f0f0;
        }
        .header .notifications-menu a:last-child {
            border-bottom: none;
        }
        /* Custom CSS for overdue days */
        .overdue {
            color: red;
        }
        .form-input, .form-textarea {
            display: block;
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 0.375rem;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-input:focus, .form-textarea:focus {
            border-color: #5a67d8;
            box-shadow: 0 0 0 3px rgba(90, 103, 216, 0.3);
        }
        .card-header {
            background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
            color: #fff;
            padding: 1rem 2rem;
            border-top-left-radius: 0.75rem;
            border-top-right-radius: 0.75rem;
            text-align: center;
        }
        .card-footer {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: #fff;
            padding: 1rem 2rem;
            border-bottom-left-radius: 0.75rem;
            border-bottom-right-radius: 0.75rem;
            text-align: center;
        }
        .table th, .table td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .table-container {
            overflow-x: auto;
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
</head>
<body class="bg-gray-100">

<!-- Thiết lập biến để nhận diện trang hiện tại -->
<c:set var="page" value="listAllContracts"/>

<!-- Include header -->
<jsp:include page="/views/includes/header_list.jsp"/>
<!-- End of header -->

<!-- Include sidebar -->
<jsp:include page="/views/includes/sidebar.jsp"/>
<!-- End of sidebar -->

<!-- Main Content -->
<div class="main-content ml-64 p-6">
    <div class="container mx-auto mt-5">
        <div class="card p-8 shadow-lg rounded-lg bg-white animate__animated animate__fadeIn">
            <h2 class="text-center text-4xl font-semibold text-gray-700 mb-6">List of All Contracts</h2>

            <form class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6" method="get" action="${pageContext.request.contextPath}/listAllContractForCustomer">
                <div>
                    <label for="status" class="block text-gray-600 mb-2">Filter by Status:</label>
                    <select id="status" name="status" class="form-select mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        <option value="">All</option>
                        <option value="Accepted" ${param.status == 'Accepted' ? 'selected' : ''}>Accepted</option>
                        <option value="Pending" ${param.status == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Canceled" ${param.status == 'Canceled' ? 'selected' : ''}>Canceled</option>
                        <option value="Rejected" ${param.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                        <option value="Expired" ${param.status == 'Expired' ? 'selected' : ''}>Expired</option>
                    </select>
                </div>
                <div>
                    <label for="customerName" class="block text-gray-600 mb-2">Search by Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" value="${param.customerName}"
                           class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" placeholder="Enter customer name"/>
                </div>
                <div>
                    <label for="startDate" class="block text-gray-600 mb-2">Search by Start Date:</label>
                    <input type="date" id="startDate" name="startDate" value="${param.startDate}" class="form-input mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
                </div>
                <div>
                    <label for="insuranceType" class="block text-gray-600 mb-2">Filter by Insurance Type:</label>
                    <select id="insuranceType" name="insuranceType" class="form-select mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500">
                        <option value="">All</option>
                        <option value="Basic" ${param.insuranceType == 'Basic' ? 'selected' : ''}>Basic</option>
                        <option value="Comprehensive" ${param.insuranceType == 'Comprehensive' ? 'selected' : ''}>Comprehensive</option>
                        <option value="Premium" ${param.insuranceType == 'Premium' ? 'selected' : ''}>Premium</option>
                    </select>
                </div>
                <div class="col-span-3 flex justify-end mt-3">
                    <button type="submit" class="btn bg-indigo-600 text-white py-2 px-4 rounded-md shadow-md hover:bg-indigo-700"><i class="fas fa-search"></i> Search</button>
                </div>
            </form>

            <c:if test="${not empty successMessage}">
                <div id="notification" class="notification notification-success">
                    <c:out value="${successMessage}" />
                    <button type="button" class="btn-close" onclick="document.getElementById('notification').remove()">&times;</button>
                </div>
            </c:if>

            <div class="overflow-x-auto">
                <table class="min-w-full bg-white divide-y divide-gray-200 shadow overflow-hidden sm:rounded-lg">
                    <thead class="bg-gray-800 text-white">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">No</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Customer Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Customer ID</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Contract Info</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Status</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Start Date</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">End Date</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Insurance Type</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Coverage</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Premium</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-100 uppercase tracking-wider">Action</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach var="contract" items="${allContracts}" varStatus="status">
                        <tr class="hover:bg-gray-100 transition duration-150 ease-in-out">
                            <td class="px-6 py-4 text-center"><c:out value="${(currentPage - 1) * 10 + status.count}"/></td>
                            <td class="px-6 py-4"><c:out value="${contract.customerName}"/></td>
                            <td class="px-6 py-4"><c:out value="${contract.customerID}"/></td>
                            <td class="px-6 py-4"><c:out value="${contract.contractInfo}"/></td>
                            <td class="px-6 py-4"><c:out value="${contract.status}"/></td>
                            <td class="px-6 py-4 text-center"><fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></td>
                            <td class="px-6 py-4 text-center"><fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></td>
                            <td class="px-6 py-4"><c:out value="${contract.insuranceType}"/></td>
                            <td class="px-6 py-4"><c:out value="${contract.coverage}"/></td>
                            <td class="px-6 py-4 text-right"><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                            <td class="px-6 py-4 text-center">
                                <a href="${pageContext.request.contextPath}/viewContract?contractID=${contract.contractID}"
                                   class="text-indigo-600 hover:text-indigo-900"><i class="fas fa-eye"></i> View</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- Pagination -->
            <nav aria-label="Page navigation example" class="mt-4">
                <ul class="inline-flex items-center -space-x-px">
                    <c:if test="${currentPage > 1}">
                        <li>
                            <a class="page-link p-2 border border-gray-300 rounded-l-lg shadow-sm hover:bg-gray-200"
                               href="${pageContext.request.contextPath}/listAllContractForCustomer?page=${currentPage - 1}&status=${param.status}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                            <li class="${i == currentPage ? 'active' : ''} mx-1">
                                <a class="page-link p-2 border border-gray-300 shadow-sm ${i == currentPage ? 'bg-gray-800 text-white' : ''} hover:bg-gray-200"
                                   href="${pageContext.request.contextPath}/listAllContractForCustomer?page=${i}&status=${param.status}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li>
                            <a class="page-link p-2 border border-gray-300 rounded-r-lg shadow-sm hover:bg-gray-200"
                               href="${pageContext.request.contextPath}/listAllContractForCustomer?page=${currentPage + 1}&status=${param.status}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- End of Main Content -->

<script>
    document.addEventListener('DOMContentLoaded', () => {
        // Hiệu ứng hiển thị thông báo
        const notification = document.getElementById('notification');
        if (notification) {
            notification.classList.add('animate__animated', 'animate__fadeInDown');
            setTimeout(() => {
                notification.classList.add('animate__animated', 'animate__fadeOutUp');
                setTimeout(() => {
                    notification.remove();
                }, 1000);
            }, 3000);
        }

        // Hiệu ứng chuyển trang
        const pageLinks = document.querySelectorAll('.pagination a');
        pageLinks.forEach(link => {
            link.addEventListener('click', (event) => {
                event.preventDefault();
                document.body.classList.add('animate__animated', 'animate__fadeOut');
                setTimeout(() => {
                    window.location.href = link.href;
                }, 500);
            });
        });
    });
</script>

</body>
</html>