<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bill</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewBill.css">
</head>
<body class="bg-gray-100">
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
<!-- Include sidebar -->
<!-- End of sidebar -->
<div class="container mx-auto p-4">
    <c:if test="${not empty message}">
        <div class="alert-container animate__animated animate__fadeInDown">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" onclick="this.parentElement.style.display='none';">&times;</button>
                <strong>${message}</strong>
            </div>
        </div>
    </c:if>
    <h2 class="text-center text-2xl font-bold text-blue-900 mb-6">Bill Details</h2>
    <div class="table-responsive">
        <table class="min-w-full bg-white rounded-lg shadow-lg">
            <thead class="bg-blue-600 text-white">
            <tr>
                <th class="w-1/12 py-2">Contract ID</th>
                <th class="w-1/12 py-2">Customer ID</th>
                <th class="w-1/6 py-2">Contract Info</th>
                <th class="w-1/12 py-2">Status</th>
                <th class="w-1/12 py-2">Start Date</th>
                <th class="w-1/12 py-2">End Date</th>
                <th class="w-1/12 py-2">Value</th>
                <th class="w-1/6 py-2">Detail</th>
                <th class="w-1/12 py-2">Coverage</th>
                <th class="w-1/12 py-2">Premium</th>
                <th class="w-1/6 py-2">Payment Method</th>
                <th class="w-1/12 py-2">Payment Amount</th>
                <th class="w-1/12 py-2">Payment Date</th>
                <th class="w-1/12 py-2">Status Payment Detail</th>
                <th class="w-1/12 py-2">View Detail</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-center">
                <td class="border px-4 py-2"><c:out value="${contract.contractID}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.customerID}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.contractInfo}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.status}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.startDate}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.endDate}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.value}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.detail}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.coverage}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.premium}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.methodPaymentType}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.paymentHistory.amount}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.paymentHistory.paymentDate}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.paymentHistory.paymentDetails}"/></td>
                <td class="border px-4 py-2 text-center">
                    <a href="${pageContext.request.contextPath}/viewContractForCus?contractID=${contract.contractID}"
                       class="btn btn-primary" title="View Detail">
                        <i class="fas fa-eye"></i>
                    </a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- Include footer -->
<!-- End of footer -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.8.2/alpine.min.js" defer></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        setTimeout(function () {
            var notification = document.querySelector('.alert');
            if (notification) {
                notification.classList.add('animate__fadeOutUp');
                setTimeout(function () {
                    notification.style.display = 'none';
                }, 1000); // Thời gian đồng bộ với thời gian của hiệu ứng animate__fadeOutUp
            }
        }, 5000);
    });
</script>
</body>
</html>