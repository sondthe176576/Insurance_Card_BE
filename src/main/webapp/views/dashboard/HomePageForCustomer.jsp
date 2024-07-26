<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/includes/header_logout.jsp"/>



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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peace Insurance - Protect What Matters Most</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <style>
        :root {
            --primary-color: #004080;
            --secondary-color: #ff8000;
            --text-color: #004080;
            --bg-color: #ffffff;
            --accent-color: #e67300;
            --hero-bg: url('${pageContext.request.contextPath}/img/hero-bg.jpg');
        }

        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--bg-color);
        }

        header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        nav {
            background-color: var(--primary-color);
            padding: 1rem 0;
            position: relative;
            z-index: 999;
        }

        .nav-links {
            display: flex;
            justify-content: center;
            list-style: none;
        }

        .nav-links li {
            margin: 0 1.5rem;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: var(--secondary-color);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .btn {
            display: inline-block;
            background-color: var(--secondary-color);
            color: white;
            padding: 1rem 3rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
            margin: 0.5rem;
        }

        .btn:hover {
            background-color: var(--accent-color);
        }

        .section-title {
            text-align: center;
            font-size: 2.8rem;
            margin-bottom: 3rem;
            color: var(--primary-color);
        }

        .services {
            padding: 5rem 0;
            background-color: var(--bg-color);
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2.5rem;
        }

        .service-card {
            background-color: var(--bg-color);
            border: 1px solid var(--primary-color);
            border-radius: 10px;
            padding: 3rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-10px);
            background-color: #f0f0f0;
        }

        .service-icon {
            font-size: 3.5rem;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .btn {
                padding: 0.75rem 2rem;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

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


<main>

    <section id="services" class="services">
        <div class="container">
            <h2 class="section-title" data-aos="fade-up">Our Services</h2>
            <div class="services-grid">
                <div class="service-card" data-aos="fade-up">
                    <i class="fas fa-file-alt service-icon"></i>
                    <h3>View Contract</h3>
                    <p>Check your contract details and stay updated with your insurance policies.</p>
                    <a href="${pageContext.request.contextPath}/contractForCustomer" class="btn bg-blue-600 hover:bg-blue-500">View Contract</a>
                </div>
                <div class="service-card" data-aos="fade-up">
                    <i class="fas fa-tachometer-alt service-icon"></i>
                    <h3>Go to Dashboard</h3>
                    <p>Access your personalized dashboard to manage your insurance details.</p>
                    <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp" class="btn bg-green-600 hover:bg-green-500">Go to Dashboard</a>
                </div>
                <div class="service-card" data-aos="fade-up">
                    <i class="fas fa-motorcycle service-icon"></i>
                    <h3>Motorbike Insurance</h3>
                    <p>Comprehensive coverage for your vehicles.</p>
                    <a href="${pageContext.request.contextPath}/login" class="btn">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <section id="insurance-packages" class="insurance-packages">
        <div class="container">
            <h3 class="section-title" data-aos="fade-up">Insurance Packages</h3>
            <div x-data="{ openPackage: null }" class="accordion">
                <div class="border border-gray-300 rounded-md mb-4" data-aos="fade-up">
                    <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 1 ? null : 1">
                        <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Basic Motorcycle Insurance</h2>
                    </div>
                    <div x-show="openPackage === 1" class="p-4">
                        <p>This option provides the fundamental coverage for your motorcycle. After completing your contact information and selecting your insurance package, please submit the form to the Insurance Advisor at the address below. You will receive an invitation to attend an information session. We aim to provide you with as much information as possible about our insurance policies. At the end of the session, you may complete the application for insurance and pay the $100 insurance fee.</p>
                    </div>
                </div>
                <div class="border border-gray-300 rounded-md mb-4" data-aos="fade-up">
                    <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 2 ? null : 2">
                        <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Comprehensive Motorcycle Insurance</h2>
                    </div>
                    <div x-show="openPackage === 2" class="p-4">
                        <p>This package offers complete protection for your motorcycle, including accident and theft insurance. Additionally, you will receive monthly newsletters with updates on your insurance coverage. The insurance fee is $150 per year. Comprehensive insurance not only covers basic liabilities but also includes coverage for damage caused by natural disasters, fire, and vandalism. This ensures that you have peace of mind in any situation.</p>
                    </div>
                </div>
                <div class="border border-gray-300 rounded-md mb-4" data-aos="fade-up">
                    <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 3 ? null : 3">
                        <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Premium Motorcycle Insurance</h2>
                    </div>
                    <div x-show="openPackage === 3" class="p-4">
                        <p>Our premium package provides the highest level of coverage. This includes all the benefits of comprehensive insurance, plus additional features such as roadside assistance, rental reimbursement, and coverage for custom parts and equipment. The premium insurance fee is $250 per year. With this package, you are guaranteed the best support and quickest response in case of any incident. Our premium plan also includes a personal advisor who will assist you with all your insurance needs.</p>
                    </div>
                </div>
            </div>
            <div class="text-center mt-6">
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}" class="btn">Buy Insurance</a>
            </div>
        </div>
    </section>
</main>

<jsp:include page="/views/includes/footer.jsp"/>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true,
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.8.2/alpine.min.js"></script>
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
