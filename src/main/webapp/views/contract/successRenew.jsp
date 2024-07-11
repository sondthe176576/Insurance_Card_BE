<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contract Renewal Successful</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .modal-content {
            border-radius: 0.5rem;
        }
        .alert-success {
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">

<jsp:include page="/views/includes/header.jsp"/>

<jsp:include page="/views/includes/navbar.jsp"/>

<div class="container mx-auto mt-16">
    <div class="bg-green-100 border-t-4 border-green-500 rounded-b text-green-900 px-4 py-3 shadow-md" role="alert">
        <div class="flex">
            <div class="py-1">
                <i class="fas fa-check-circle fa-2x"></i>
            </div>
            <div class="ml-4">
                <h4 class="text-xl font-bold">Contract Renewal Successful!</h4>
                <p class="text-lg">Your contract renewal request has been successfully submitted and is currently being processed. If there are any notifications, we will send them to your email.</p>
                <hr class="my-4 border-t-2 border-green-200">
                <p class="mb-0">If you have any questions, please contact us.</p>
            </div>
        </div>
    </div>
    <div class="mt-8">
        <a href="${pageContext.request.contextPath}/homepageforcustomer" class="btn btn-primary bg-blue-500 text-white px-6 py-2 rounded hover:bg-blue-700 transition duration-300">
            <i class="fas fa-home"></i> Back to Home
        </a>
    </div>
</div>
</body>
</html>