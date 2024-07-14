<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Contracts For Customer</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.3.0/material.indigo-pink.min.css" rel="stylesheet">
    <style>
        body {
            font-size: 1.25rem;
        }
        .navbar {
            transition: all 0.3s ease-in-out;
        }
        .navbar:hover {
            background-color: #004d99;
        }
        .btn-view {
            background-color: #4CAF50;
            color: white;
            padding: 0.75rem 1.5rem;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 1rem;
            margin: 0.25rem 0;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 0.5rem;
        }
        .btn-view:hover {
            background-color: white;
            color: black;
            border: 2px solid #4CAF50;
        }
        .table-header {
            background-color: #004d99;
            color: white;
        }
        .table-row {
            transition: all 0.2s ease-in-out;
        }
        .table-row:hover {
            background-color: #f1f1f1;
        }
        .animate-fade-in {
            animation: fadeIn 1s;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .status-accepted {
            color: green;
            font-weight: bold;
        }
        .status-rejected {
            color: red;
            font-weight: bold;
        }
        .status-pending {
            color: orange;
            font-weight: bold;
        }
        .status-canceled {
            color: gray;
            font-weight: bold;
        }
        .type-basic {
            background-color: #e0f7fa;
        }
        .type-comprehensive {
            background-color: #e6ffe6;
        }
        .type-premium {
            background-color: #fff0f5;
        }
        .highlight {
            font-weight: bold;
            background-color: #b3e5fc;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->

<!-- Include navbar -->
<nav class="navbar bg-blue-900 border-b-4 border-orange-600">
    <div class="container mx-auto px-4 py-2 flex justify-center">
        <ul class="flex space-x-6">
            <li>
                <a href="${pageContext.request.contextPath}/homepageforcustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center animate-fade-in">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}" class="text-white font-bold uppercase hover:text-orange-500 flex items-center animate-fade-in">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
            </li>
            <li>
                <a href="#" class="text-white font-bold uppercase hover:text-orange-500 flex items-center animate-fade-in">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/contractForCustomer" class="text-white font-bold uppercase hover:text-orange-500 flex items-center animate-fade-in">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp" class="text-white font-bold uppercase hover:text-orange-500 flex items-center animate-fade-in">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- End of navbar -->

<div class="container mx-auto py-16">
    <h1 class="text-5xl font-bold text-blue-900 mb-12 text-center animate-fade-in">List Contracts For Customer</h1>
    <div class="overflow-x-auto">
        <table class="min-w-full bg-white rounded-lg shadow-md overflow-hidden">
            <thead class="table-header">
            <tr>
                <th class="py-3 px-5">Contract ID</th>
                <th class="py-3 px-5">Contract Info</th>
                <th class="py-3 px-5">Status</th>
                <th class="py-3 px-5">Start Date</th>
                <th class="py-3 px-5">End Date</th>
                <th class="py-3 px-5">Insurance Type</th>
                <th class="py-3 px-5">Coverage</th>
                <th class="py-3 px-5">Premium</th>
                <th class="py-3 px-5">Cancellation Date</th>
                <th class="py-3 px-5">Detail</th>
                <th class="py-3 px-5">Value</th>
                <th class="py-3 px-5">View</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="contract" items="${contracts}" varStatus="status">
                <tr class="table-row bg-gray-100 border-b animate-fade-in">
                    <td class="py-3 px-5">${contract.contractID}</td>
                    <td class="py-3 px-5">${contract.contractInfo}</td>
                    <td class="py-3 px-5 ${contract.status == 'Accepted' ? 'status-accepted' : contract.status == 'Rejected' ? 'status-rejected' : contract.status == 'Pending' ? 'status-pending' : 'status-canceled'}">${contract.status}</td>
                    <td class="py-3 px-5 whitespace-nowrap"><fmt:formatDate value="${contract.startDate}" pattern="dd-MM-yyyy"/></td>
                    <td class="py-3 px-5 whitespace-nowrap"><fmt:formatDate value="${contract.endDate}" pattern="dd-MM-yyyy"/></td>
                    <td class="py-3 px-5 ${contract.insuranceType == 'Basic' ? 'type-basic' : contract.insuranceType == 'Comprehensive' ? 'type-comprehensive' : 'type-premium'}">${contract.insuranceType}</td>
                    <td class="py-3 px-5">${contract.coverage}</td>
                    <td class="py-3 px-5 whitespace-nowrap"><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                    <td class="py-3 px-5 highlight"><fmt:formatDate value="${contract.cancellationDate}" pattern="dd-MM-yyyy"/></td>
                    <td class="py-3 px-5">${contract.detail}</td>
                    <td class="py-3 px-5 highlight"><fmt:formatNumber value="${contract.value}" type="currency" currencySymbol="$"/></td>
                    <td class="py-3 px-5">
                        <a href="${pageContext.request.contextPath}/contractDetail/${contract.contractID}" class="btn-view"><i class="fas fa-eye"></i> View</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->

<script>
    function handleSearch(event) {
        event.preventDefault();
        const query = document.getElementById('searchInput').value;
        alert('You searched for: ' + query);
    }
</script>
</body>
</html>