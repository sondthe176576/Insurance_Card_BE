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
        .alert-success {
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
        }

        .btn-primary {
            display: inline-block;
            font-weight: 500;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            user-select: none;
            background-color: #1d4ed8;
            color: #fff;
            border: 1px solid transparent;
            padding: 0.5rem 1rem;
            font-size: 1.25rem;
            line-height: 1.5;
            border-radius: 0.375rem;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #1e40af;
            border-color: #1e40af;
        }

        .alert-box {
            width: 100%;
            padding: 2rem;
            font-size: 1.25rem;
        }

        .btn-container {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 1rem;
        }

        .footer {
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
            background-color: #1d4ed8;
            color: white;
            text-align: center;
            padding: 1rem;
        }

        .content-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900 flex flex-col min-h-screen">

<jsp:include page="/views/includes/header.jsp"/>

<jsp:include page="/views/includes/navbar.jsp"/>

<div class="content-container flex-grow">
    <div class="btn-container">
        <a href="${pageContext.request.contextPath}/homepageforcustomer" class="btn-primary">
            <i class="fas fa-home mr-2"></i> Back to Home
        </a>
    </div>
    <div class="bg-green-100 border-t-4 border-green-500 rounded-b text-green-900 px-4 py-3 shadow-md alert-box"
         role="alert">
        <div class="flex">
            <div class="py-1">
                <i class="fas fa-check-circle fa-2x"></i>
            </div>
            <div class="ml-4">
                <h4 class="text-2xl font-bold">Contract Renewal Successful!</h4>
                <p class="text-lg">Your contract renewal request has been successfully submitted and is currently being
                    processed. If there are any notifications, we will send them to your email.</p>
                <hr class="my-4 border-t-2 border-green-200">
                <p class="mb-0">If you have any questions, please contact us.</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

</body>
</html>