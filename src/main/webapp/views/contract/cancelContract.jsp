<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contract Cancellation Successful</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-size: 1.25rem; /* Increase base font size */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar {
            transition: all 0.3s ease-in-out;
            display: flex;
            justify-content: center;
        }
        .navbar .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .navbar ul {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        .navbar ul li {
            margin: 0 10px;
        }
        .navbar:hover {
            background-color: #004d99; /* Darken navbar on hover */
        }
        .container {
            flex: 1;
        }
        .footer {
            background-color: #004d99;
            color: white;
            padding: 1rem;
            text-align: center;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">

<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->

<!-- Include navbar -->
<nav class="navbar bg-blue-900 border-b-4 border-orange-600">
    <div class="container mx-auto px-4 py-2">
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

<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/homepageforcustomer" class="btn btn-primary mb-3"><i class="fas fa-arrow-left mr-2"></i> Back to Home</a>
    <div class="alert alert-success" role="alert">
        <h4 class="alert-heading"><i class="fas fa-check-circle"></i> Contract Cancellation Successful!</h4>
        <p>Your contract has been successfully canceled and is currently being processed. If there are any notifications, we will send them to your email.</p>
        <hr>
        <p class="mb-0">If you have any questions, please contact us.</p>
    </div>
</div>

<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>