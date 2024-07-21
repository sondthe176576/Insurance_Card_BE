<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/includes/header_logout.jsp"/>
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

<html lang="en">
<head>
    <title>Home</title> <!-- Title of the page -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp"> <!-- Icon of the page -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-900">

<!-- Navbar -->
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

<!-- Content -->
<div class="container mx-auto py-16">
    <div class="text-center mb-16">
        <h2 class="text-4xl font-bold text-blue-900">Peace Insurance has over 25 years of experience in the insurance industry.</h2>
    </div>

    <div class="text-center mb-16">
        <h2 class="text-4xl font-bold text-blue-900">Insurance Coverage That Fits Your Life</h2>
        <p class="text-gray-700 mt-4">Insurance coverage tailored to your needs is easier than you think. Sometimes on purpose injected humor and the like, simple dummy.</p>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-16">
        <div class="bg-white p-8 rounded-lg shadow-lg text-center hover:shadow-xl transition duration-300">
            <div class="text-blue-900 text-6xl mb-4">
                <i class="fa fa-home"></i>
            </div>
            <h3 class="text-2xl font-bold text-blue-900 mb-4">Home Insurance</h3>
            <p class="text-gray-700">Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <div class="bg-white p-8 rounded-lg shadow-lg text-center hover:shadow-xl transition duration-300">
            <div class="text-blue-900 text-6xl mb-4">
                <i class="fa fa-briefcase"></i>
            </div>
            <h3 class="text-2xl font-bold text-blue-900 mb-4">Business Insurance</h3>
            <p class="text-gray-700">Aliquam at lacus ac sapien molestie consequat nec in nibh. Mauris sagittis magna ut nunc.</p>
        </div>
        <div class="bg-white p-8 rounded-lg shadow-lg text-center hover:shadow-xl transition duration-300">
            <div class="text-blue-900 text-6xl mb-4">
                <i class="fa fa-plane"></i>
            </div>
            <h3 class="text-2xl font-bold text-blue-900 mb-4">Travel Insurance</h3>
            <p class="text-gray-700">Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque pharetra elit ut nisl.</p>
        </div>
        <div class="bg-white p-8 rounded-lg shadow-lg text-center hover:shadow-xl transition duration-300">
            <div class="text-blue-900 text-6xl mb-4">
                <i class="fa fa-heart"></i>
            </div>
            <h3 class="text-2xl font-bold text-blue-900 mb-4">Heart – Life Insurance</h3>
            <p class="text-gray-700">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>
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

<jsp:include page="/views/includes/footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
    function handleSearch(event) {
        event.preventDefault();
        const query = document.getElementById('searchInput').value;
        alert('You searched for: ' + query);
    }
</script>
</body>
</html>