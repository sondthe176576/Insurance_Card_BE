<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            padding-top: 140px; /* Adjust this value based on your header and navbar heights */
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--bg-color);
        }

        header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 0;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        nav {
            background-color: var(--bg-color);
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 60px; /* Adjust this value based on your header height */
            left: 0;
            width: 100%;
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
            color: var(--primary-color);
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

        .hero {
            background-image: var(--hero-bg);
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
            margin-bottom: 2rem;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero h1 {
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 2rem;
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

        .news {
            background-color: var(--bg-color);
            padding: 5rem 0;
        }

        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2.5rem;
        }

        .news-card {
            background-color: var(--bg-color);
            border: 1px solid var(--primary-color);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .news-card:hover {
            transform: translateY(-10px);
            background-color: #f0f0f0;
        }

        .news-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .news-content {
            padding: 2rem;
        }

        .news-title {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: var(--primary-color);
        }

        .news-date {
            font-size: 0.9rem;
            color: #666;
        }

        footer {
            background-color: var(--primary-color);
            color: white;
            padding: 3rem 0;
            text-align: center;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            list-style: none;
            margin-bottom: 2rem;
        }

        .footer-links li {
            margin: 0 1.5rem;
        }

        .footer-links a {
            color: white;
            text-decoration: none;
        }

        .social-icons {
            margin-bottom: 2rem;
        }

        .social-icons a {
            color: white;
            font-size: 1.8rem;
            margin: 0 0.5rem;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 3rem;
            }

            .hero p {
                font-size: 1.2rem;
            }

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
<header>
    <div class="container flex justify-between items-center">
        <h1 class="text-2xl font-bold">Peace Insurance</h1>
        <div class="flex items-center">
            <input type="search" placeholder="Search..." class="mr-4 p-2 rounded">
            <a href="${pageContext.request.contextPath}/login" class="bg-blue-600 text-white py-2 px-4 rounded">Login</a>
        </div>
    </div>
</header>

<!-- Navbar -->
<nav>
    <div class="container">
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/" class="text-blue-900 font-bold uppercase hover:text-orange-500"><i class="fas fa-home mr-2"></i>Home</a></li>
            <li><a href="${pageContext.request.contextPath}/login" class="text-blue-900 font-bold uppercase hover:text-orange-500"><i class="fas fa-file-contract mr-2"></i>Buy Insurance</a></li>
            <li><a href="${pageContext.request.contextPath}/login" class="text-blue-900 font-bold uppercase hover:text-orange-500"><i class="fas fa-info-circle mr-2"></i>About</a></li>
            <li><a href="${pageContext.request.contextPath}/login" class="text-blue-900 font-bold uppercase hover:text-orange-500"><i class="fas fa-file-alt mr-2"></i>Contract</a></li>
            <li><a href="${pageContext.request.contextPath}/login" class="text-blue-900 font-bold uppercase hover:text-orange-500"><i class="fas fa-tachometer-alt mr-2"></i>Dashboard</a></li>
        </ul>
    </div>
</nav>

<main>
    <section id="home" class="hero">
        <div class="hero-content" data-aos="fade-up">
            <h1>Protect What Matters Most</h1>
            <p>Get peace of mind with our comprehensive insurance solutions.</p>
            <a href="#" class="btn" data-aos="fade-up" data-aos-delay="400">Get a Quote</a>
        </div>
    </section>

    <section id="services" class="services">
        <div class="container">
            <h2 class="section-title" data-aos="fade-up">Our Services</h2>
            <div class="services-grid">
                <div class="service-card" data-aos="fade-up">
                    <i class="fas fa-motorcycle service-icon"></i>
                    <h3>Motorbike Insurance</h3>
                    <p>Comprehensive coverage for your vehicles.</p>
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
                <a href="${pageContext.request.contextPath}/login" class="btn">Buy Insurance</a>
            </div>
        </div>
    </section>
</main>

<!-- Include footer -->
<%@ include file="/views/includes/footer.jsp" %>
<!-- End of footer -->

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true,
    });
</script>
</body>
</html>