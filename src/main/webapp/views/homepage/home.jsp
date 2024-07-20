<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/views/includes/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peace Insurance - Protect What Matters Most</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <style>
        :root {
            --primary-color: #004080;
            --secondary-color: #ff8000;
            --text-color: #333;
            --bg-color: #f4f4f4;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            padding-top: 60px; /* Adjust this value based on your header's height */
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--bg-color);
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Header Styles */
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
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin-left: 2rem;
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

        /* Hero Section */
        .hero {
            background-image: url('${pageContext.request.contextPath}/img/hero-bg.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
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
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
        }

        .btn {
            display: inline-block;
            background-color: var(--secondary-color);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #e67300;
        }

        /* Services Section */
        .services {
            padding: 5rem 0;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 3rem;
            color: var(--primary-color);
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .service-card {
            background-color: white;
            border-radius: 10px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-10px);
        }

        .service-icon {
            font-size: 3rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        /* News Section */
        .news {
            background-color: white;
            padding: 5rem 0;
        }

        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .news-card {
            background-color: var(--bg-color);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .news-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .news-content {
            padding: 1.5rem;
        }

        .news-title {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            color: var(--primary-color);
        }

        .news-date {
            font-size: 0.8rem;
            color: #666;
        }

        /* Footer */
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
            margin: 0 1rem;
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
            font-size: 1.5rem;
            margin: 0 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<header>
    <nav class="container">
        <div class="logo">Peace Insurance</div>
        <ul class="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>
</header>

<main>
    <section id="home" class="hero">
        <div class="hero-content">
            <h1 data-aos="fade-up">Protect What Matters Most</h1>
            <p data-aos="fade-up" data-aos-delay="200">Get peace of mind with our comprehensive insurance solutions.</p>
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

    <section id="news" class="news">
        <div class="container">
            <h2 class="section-title" data-aos="fade-up">Latest News</h2>
            <div class="news-grid">
                <div class="news-card" data-aos="fade-up">
                    <img src="${pageContext.request.contextPath}/img/z5492679158839_534a533f48030b12a6e7f92ab158c5c7.jpg" alt="News 1" class="news-image">
                    <div class="news-content">
                        <h3 class="news-title">New Policy Updates for 2024</h3>
                        <p>Learn about our latest policy changes and how they benefit you.</p>
                        <p class="news-date">Posted on Jan 21, 2024</p>
                    </div>
                </div>
                <div class="news-card" data-aos="fade-up" data-aos-delay="200">
                    <img src="${pageContext.request.contextPath}/img/z5492679158847_6af0583704368bef81f3b34a4603722c.jpg" alt="News 2" class="news-image">
                    <div class="news-content">
                        <h3 class="news-title">Tips for Choosing the Right Insurance</h3>
                        <p>Expert advice on selecting the best insurance for your needs.</p>
                        <p class="news-date">Posted on Jan 18, 2024</p>
                    </div>
                </div>
                <div class="news-card" data-aos="fade-up" data-aos-delay="400">
                    <img src="${pageContext.request.contextPath}/img/z5492679165470_52b14d798485dcfe812daa4ef80f4b1f.jpg" alt="News 3" class="news-image">
                    <div class="news-content">
                        <h3 class="news-title">Community Outreach Program Launched</h3>
                        <p>Peace Insurance gives back to the community with new initiatives.</p>
                        <p class="news-date">Posted on Jan 15, 2024</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="insurance-packages" class="insurance-packages">
        <div class="container">
            <div class="grid grid-cols-1 mt-6">
                <div class="col-span-1">
                    <h3 class="text-2xl text-blue-600 mb-4"><i class="fas fa-box"></i> Insurance Packages</h3>
                    <div x-data="{ openPackage: null }" class="accordion">
                        <div class="border border-gray-300 rounded-md mb-4">
                            <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 1 ? null : 1">
                                <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Basic Motorcycle Insurance</h2>
                            </div>
                            <div x-show="openPackage === 1" class="p-4">
                                <p>This option provides the fundamental coverage for your motorcycle. After completing your contact information and selecting your insurance package, please submit the form to the Insurance Advisor at the address below. You will receive an invitation to attend an information session. We aim to provide you with as much information as possible about our insurance policies. At the end of the session, you may complete the application for insurance and pay the $100 insurance fee.</p>
                            </div>
                        </div>
                        <div class="border border-gray-300 rounded-md mb-4">
                            <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 2 ? null : 2">
                                <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Comprehensive Motorcycle Insurance</h2>
                            </div>
                            <div x-show="openPackage === 2" class="p-4">
                                <p>This package offers complete protection for your motorcycle, including accident and theft insurance. Additionally, you will receive monthly newsletters with updates on your insurance coverage. The insurance fee is $150 per year. Comprehensive insurance not only covers basic liabilities but also includes coverage for damage caused by natural disasters, fire, and vandalism. This ensures that you have peace of mind in any situation.</p>
                            </div>
                        </div>
                        <div class="border border-gray-300 rounded-md mb-4">
                            <div class="border-b border-gray-300 p-4 cursor-pointer" @click="openPackage = openPackage === 3 ? null : 3">
                                <h2 class="font-bold text-gray-700"><i class="fas fa-check-circle text-green-500 mr-2"></i> Premium Motorcycle Insurance</h2>
                            </div>
                            <div x-show="openPackage === 3" class="p-4">
                                <p>Our premium package provides the highest level of coverage. This includes all the benefits of comprehensive insurance, plus additional features such as roadside assistance, rental reimbursement, and coverage for custom parts and equipment. The premium insurance fee is $250 per year. With this package, you are guaranteed the best support and quickest response in case of any incident. Our premium plan also includes a personal advisor who will assist you with all your insurance needs.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-6">
                <a href="${pageContext.request.contextPath}/login" class="btn">Buy Insurance</a>
            </div>
        </div>
    </section>
</main>

<footer>
    <div class="container">
        <ul class="footer-links">
            <li><a href="#">About Us</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
        <p>&copy; 2024 Peace Insurance. All rights reserved.</p>
    </div>
</footer>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true,
    });
</script>
</body>
</html>