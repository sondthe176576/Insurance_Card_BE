<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content {
            flex: 1;
        }
        .alert-container {
            margin: 20px auto;
            padding: 10px 20px;
            border-radius: 10px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
            width: 90%;
            max-width: 1000px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .alert-container .close {
            color: #155724;
            font-size: 1rem;
            background: none;
            border: none;
            cursor: pointer;
            margin-left: 10px;
        }
        .alert-container .close:hover {
            color: #000;
            opacity: 1;
        }
        nav {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #1a202c;
            padding: 10px;
            border-bottom: 4px solid #38b2ac;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        nav ul li {
            margin: 0 15px;
        }
        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            transition: color 0.3s;
        }
        nav ul li a:hover {
            color: #38b2ac;
        }
        footer {
            background-color: #1a202c;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
        .status-yellow {
            background-color: #ffeb3b; /* Màu vàng */
        }
        .status-red {
            background-color: #f44336; /* Màu đỏ */
        }
        .highlight-amount {
            background-color: #ff9800; /* Màu cam đậm */
        }
    </style>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}/homepageforcustomer"><i class="fas fa-home mr-2"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}"><i class="fas fa-file-contract mr-2"></i> Buy Insurance</a></li>
        <li><a href="#"><i class="fas fa-info-circle mr-2"></i> About</a></li>
        <li><a href="${pageContext.request.contextPath}/contractForCustomer"><i class="fas fa-file-alt mr-2"></i> Contract</a></li>
        <li><a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp"><i class="fas fa-tachometer-alt mr-2"></i> Dashboard</a></li>
    </ul>
</nav>
<!-- End of navbar -->
<div class="container mx-auto p-4 content">
    <h2 class="text-center text-4xl font-bold text-blue-900 mb-6">Bill Details</h2>
    <c:if test="${not empty message}">
        <div class="alert-container animate__animated animate__fadeInDown">
            <span>${message}</span>
            <button type="button" class="close" onclick="this.parentElement.style.display='none';">&times;</button>
        </div>
    </c:if>
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
                <th class="w-1/12 py-2">Value ($)</th>
                <th class="w-1/6 py-2">Detail</th>
                <th class="w-1/12 py-2">Coverage</th>
                <th class="w-1/12 py-2">Premium ($)</th>
                <th class="w-1/6 py-2">Payment Method</th>
                <th class="w-1/12 py-2">Payment Amount ($)</th>
                <th class="w-1/12 py-2">Status Payment Detail</th>
                <th class="w-1/12 py-2">View Detail</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-center">
                <td class="border px-4 py-2"><c:out value="${contract.contractID}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.customerID}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.contractInfo}"/></td>
                <td class="border px-4 py-2 status-yellow"><c:out value="${contract.status}"/></td>
                <td class="border px-4 py-2"><fmt:formatDate value="${contract.startDate}" pattern="MM/dd/yyyy"/></td>
                <td class="border px-4 py-2"><fmt:formatDate value="${contract.endDate}" pattern="MM/dd/yyyy"/></td>
                <td class="border px-4 py-2"><fmt:formatNumber value="${contract.value}" type="currency" currencySymbol="$"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.detail}"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.coverage}"/></td>
                <td class="border px-4 py-2"><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                <td class="border px-4 py-2"><c:out value="${contract.methodPaymentType}"/></td>
                <td class="border px-4 py-2 highlight-amount"><fmt:formatNumber value="${contract.paymentHistory.amount}" type="currency" currencySymbol="$"/></td>
                <td class="border px-4 py-2 status-red"><c:out value="${contract.paymentHistory.paymentDetails}"/></td>
                <td class="border px-4 py-2 text-center">
                    <a href="${pageContext.request.contextPath}/viewContractForCus?contractID=${contract.contractID}" class="btn btn-primary" title="View Detail">
                        <i class="fas fa-eye"></i>
                    </a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!-- Include footer -->
<footer>
    <jsp:include page="/views/includes/footer.jsp"/>
</footer>
<!-- End of footer -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.8.2/alpine.min.js" defer></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        setTimeout(function () {
            var notification = document.querySelector('.alert-container');
            if (notification) {
                notification.classList.add('animate__fadeOutUp');
                setTimeout(function () {
                    notification.style.display = 'none';
                }, 1000);
            }
        }, 5000);
    });
</script>
</body>
</html>