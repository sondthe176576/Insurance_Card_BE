<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="/views/includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom Styles */
        .navbar-custom {
            background-color: #004080;
            border-bottom: 3px solid #ff8000;
        }
        .navbar-custom .navbar-nav .nav-link {
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            padding: 20px;
        }
        .navbar-custom .navbar-nav .nav-link:hover {
            color: #ff8000;
        }
        .navbar-custom .dropdown-menu {
            background-color: #004080;
            border: none;
        }
        .navbar-custom .dropdown-menu .dropdown-item {
            color: white;
        }
        .navbar-custom .dropdown-menu .dropdown-item:hover {
            background-color: #ff8000;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">

<!-- Navbar -->
<nav class="bg-blue-900 border-b-4 border-orange-600">
    <div class="container mx-auto px-4 py-2 flex justify-center">
        <ul class="flex space-x-6">
            <li>
                <a href="${pageContext.request.contextPath}/" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/login" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/login" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/login" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/login" class="text-white font-bold uppercase hover:text-orange-500 flex items-center">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
        </ul>
    </div>
</nav>

<!-- Content -->
<div class="container mx-auto py-16">
    <div class="text-center mb-16">
        <h2 class="text-4xl font-bold text-blue-900">Peace Insurance has over 25 years of experience in the insurance industry.</h2>
    </div>

    <div class="flex justify-center mb-16">
        <div class="max-w-lg p-8 bg-white rounded-lg shadow-lg">
            <h3 class="text-2xl font-bold text-blue-900 mb-4">Insurance Products</h3>
            <p class="text-gray-700 mb-6">We offer various solutions tailored to your needs, covering a wide range of insurance products.</p>
            <a href="${pageContext.request.contextPath}/product">
                <button class="w-full py-2 bg-orange-600 text-white font-bold rounded-full hover:bg-orange-700 transition duration-300">View Our Products</button>
            </a>
        </div>
    </div>

    <div class="text-center mb-16">
        <h2 class="text-4xl font-bold text-blue-900">Insurance Coverage That Fits Your Life</h2>
        <p class="text-gray-700 mt-4">Insurance coverage tailored to your needs is easier than you think. Sometimes on purpose injected humor and the like, simple dummy.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
        <div class="bg-white p-8 rounded-lg shadow-lg text-center hover:shadow-xl transition duration-300">
            <div class="text-blue-900 text-6xl mb-4">
                <i class="fa fa-motorcycle"></i>
            </div>
            <h3 class="text-2xl font-bold text-blue-900 mb-4">Motorbike Insurance</h3>
            <p class="text-gray-700">Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
    </div>

    <div class="text-center mb-16">
        <h2 class="text-4xl font-bold text-blue-900">Latest News From Media</h2>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
        <div class="bg-white p-8 rounded-lg shadow-lg hover:shadow-xl transition duration-300">
            <img src="${pageContext.request.contextPath}/img/z5492679158839_534a533f48030b12a6e7f92ab158c5c7.jpg" alt="News Image 1" class="w-full rounded mb-4">
            <h3 class="text-2xl font-bold text-blue-900 mb-2">Lorem Ipsum Dolor Sit Amet Michel Jackson</h3>
            <p class="text-gray-700 mb-2">Morbi lectus arcu, suscipit quis congue quis, vulp ut nulla. Curabitur sit amet interdum lectus.</p>
            <small class="text-gray-600">Posted on Jan 21, 2024</small>
        </div>
        <div class="bg-white p-8 rounded-lg shadow-lg hover:shadow-xl transition duration-300">
            <img src="${pageContext.request.contextPath}/img/z5492679158847_6af0583704368bef81f3b34a4603722c.jpg" alt="News Image 2" class="w-full rounded mb-4">
            <h3 class="text-2xl font-bold text-blue-900 mb-2">Pellentesque faucibus mauris id lobortis hendrerit</h3>
            <p class="text-gray-700 mb-2">Morbi lectus arcu, suscipit quis congue quis, vulp ut nulla. Curabitur sit amet interdum lectus.</p>
            <small class="text-gray-600">Posted on Jan 21, 2024</small>
        </div>
        <div class="bg-white p-8 rounded-lg shadow-lg hover:shadow-xl transition duration-300">
            <img src="${pageContext.request.contextPath}/img/z5492679165470_52b14d798485dcfe812daa4ef80f4b1f.jpg" alt="News Image 3" class="w-full rounded mb-4">
            <h3 class="text-2xl font-bold text-blue-900 mb-2">Pellentesque faucibus mauris id lobortis hendrerit</h3>
            <p class="text-gray-700 mb-2">Morbi lectus arcu, suscipit quis congue quis, vulp ut nulla. Curabitur sit amet interdum lectus.</p>
            <small class="text-gray-600">Posted on Jan 21, 2024</small>
        </div>
    </div>

    <div class="flex justify-center">
        <a href="#" class="px-4 py-2 mx-2 bg-blue-900 text-white rounded-full hover:bg-blue-700 transition duration-300">1</a>
        <a href="#" class="px-4 py-2 mx-2 bg-blue-900 text-white rounded-full hover:bg-blue-700 transition duration-300">2</a>
    </div>
</div>

<%@ include file="/views/includes/footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>