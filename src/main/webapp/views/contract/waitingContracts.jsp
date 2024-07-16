<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Waiting Contracts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        .main-content {
            margin-left: 16rem;
            padding: 1.5rem;
            transition: margin-left 0.3s;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1.5rem;
        }

        .card {
            background-color: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            font-weight: 600;
            color: #2d3748;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }

        .table th, .table td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #ddd;
            white-space: nowrap;
        }

        .table th {
            background-color: #2d3748;
            color: white;
            font-weight: 600;
        }

        .table-hover tbody tr:hover {
            background-color: #edf2f7;
        }

        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            color: white;
            background-color: #2d3748;
            border: none;
            border-radius: 0.25rem;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            background-color: #4a5568;
            transform: scale(1.05);
        }

        .pagination {
            display: flex;
            justify-content: flex-end;
            list-style: none;
            padding: 0;
        }

        .pagination li {
            margin: 0 0.25rem;
        }

        .pagination a {
            color: #2d3748;
            text-decoration: none;
            padding: 0.5rem 0.75rem;
            border: 1px solid #ddd;
            border-radius: 0.25rem;
            transition: background-color 0.3s, transform 0.3s;
        }

        .pagination a:hover {
            background-color: #edf2f7;
            transform: scale(1.05);
        }

        .pagination .active a {
            background-color: #2d3748;
            color: white;
            border-color: #2d3748;
        }

        .header {
            background-color: #2d3748;
            color: white;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header .logo {
            font-size: 1.5rem;
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
            margin-right: 1rem;
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
            width: 15rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 0.25rem;
            display: none;
        }

        .header .notifications:hover .notifications-menu {
            display: block;
        }

        .header .notifications-menu a {
            display: block;
            padding: 0.5rem;
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

        .alert {
            position: relative;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid transparent;
            border-radius: 0.25rem;
        }

        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .alert-dismissible .btn-close {
            position: absolute;
            top: 0.75rem;
            right: 1rem;
            padding: 0.75rem 1rem;
            color: inherit;
        }

        .form-input, .form-select {
            background-color: #edf2f7;
            color: #4a5568;
        }

        .form-input:focus, .form-select:focus {
            background-color: #fff;
            border-color: #3182ce;
            box-shadow: 0 0 0 1px #3182ce;
        }
    </style>
</head>
<body class="bg-gray-100">
<!-- Include header -->
<jsp:include page="/views/includes/header_list.jsp"/>
<!-- End of header -->

<!-- Include sidebar -->
<jsp:include page="/views/includes/sidebar.jsp"/>
<!-- End of sidebar -->

<!-- Main Content -->
<div class="main-content flex-grow p-6 bg-gray-100 ml-64">
    <div class="container mx-auto animate__animated animate__fadeIn">
        <div class="card p-6 shadow-md rounded-lg bg-white">
            <h2 class="text-center text-3xl font-semibold text-gray-700 mb-6">List of Waiting Contracts</h2>

            <form class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6" method="get" action="${pageContext.request.contextPath}/listWaitingContract">
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
                    <button type="submit" class="btn bg-indigo-600 text-white py-2 px-4 rounded-md shadow-md hover:bg-indigo-700 animate__animated animate__pulse"><i class="fas fa-search"></i> Search</button>
                </div>
            </form>

            <c:if test="${not empty successMessage}">
                <div class="alert alert-success mb-6 animate__animated animate__fadeInDown">
                    <c:out value="${successMessage}" />
                </div>
            </c:if>

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
                <c:forEach var="contract" items="${waitingContracts}" varStatus="status">
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
                            <a href="${pageContext.request.contextPath}/resolveWaitingContract?contractID=${contract.contractID}"
                               class="text-indigo-600 hover:text-indigo-900"><i class="fas fa-eye"></i> View</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Pagination -->
            <nav aria-label="Page navigation example" class="mt-4">
                <ul class="inline-flex items-center -space-x-px">
                    <c:if test="${currentPage > 1}">
                        <li>
                            <a class="page-link p-2 border border-gray-300 rounded-l-lg shadow-sm hover:bg-gray-200"
                               href="${pageContext.request.contextPath}/listWaitingContract?page=${currentPage - 1}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                            <li class="${i == currentPage ? 'active' : ''} mx-1">
                                <a class="page-link p-2 border border-gray-300 shadow-sm ${i == currentPage ? 'bg-gray-800 text-white' : ''} hover:bg-gray-200"
                                   href="${pageContext.request.contextPath}/listWaitingContract?page=${i}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li>
                            <a class="page-link p-2 border border-gray-300 rounded-r-lg shadow-sm hover:bg-gray-200"
                               href="${pageContext.request.contextPath}/listWaitingContract?page=${currentPage + 1}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}">
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
</body>
</html>