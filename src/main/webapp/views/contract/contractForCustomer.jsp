<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List Contracts For Customer</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-900">
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

<div class="container mx-auto py-16">
    <h1 class="text-4xl font-bold text-blue-900 mb-8 text-center">List Contracts For Customer</h1>
    <div class="overflow-x-auto">
        <table class="min-w-full bg-white rounded-lg shadow-md overflow-hidden">
            <thead class="bg-blue-900 text-white">
            <tr>
                <th class="py-2 px-4">Contract ID</th>
                <th class="py-2 px-4">Contract Info</th>
                <th class="py-2 px-4">Status</th>
                <th class="py-2 px-4">Start Date</th>
                <th class="py-2 px-4">End Date</th>
                <th class="py-2 px-4">Insurance Type</th>
                <th class="py-2 px-4">Coverage</th>
                <th class="py-2 px-4">Premium</th>
                <th class="py-2 px-4">Cancellation Date</th>
                <th class="py-2 px-4">Detail</th>
                <th class="py-2 px-4">Value</th>
                <th class="py-2 px-4">Motorcycle Info</th>
                <th class="py-2 px-4">View</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="contract" items="${contracts}">
                <tr class="bg-gray-100 border-b">
                    <td class="py-2 px-4">${contract.contractID}</td>
                    <td class="py-2 px-4">${contract.contractInfo}</td>
                    <td class="py-2 px-4">${contract.status}</td>
                    <td class="py-2 px-4">${contract.startDate}</td>
                    <td class="py-2 px-4">${contract.endDate}</td>
                    <td class="py-2 px-4">${contract.insuranceType}</td>
                    <td class="py-2 px-4">${contract.coverage}</td>
                    <td class="py-2 px-4">${contract.premium}</td>
                    <td class="py-2 px-4">${contract.cancellationDate}</td>
                    <td class="py-2 px-4">${contract.detail}</td>
                    <td class="py-2 px-4">${contract.value}</td>
                    <td class="py-2 px-4">
                        <c:out value="${contract.motorcycle.licensePlate}"/> -
                        <c:out value="${contract.motorcycle.brand}"/> -
                        <c:out value="${contract.motorcycle.model}"/>
                    </td>
                    <td class="py-2 px-4">
                        <a href="${pageContext.request.contextPath}/contractDetail/${contract.contractID}" class="bg-blue-500 text-white py-1 px-3 rounded-full hover:bg-blue-700 transition duration-300"><i class="fas fa-eye"></i> View</a>
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