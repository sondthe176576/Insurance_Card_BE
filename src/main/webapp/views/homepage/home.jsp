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
                    <i class="fas fa-car service-icon"></i>
                    <h3>Auto Insurance</h3>
                    <p>Comprehensive coverage for your vehicles.</p>
                </div>
                <div class="service-card" data-aos="fade-up" data-aos-delay="200">
                    <i class="fas fa-home service-icon"></i>
                    <h3>Home Insurance</h3>
                    <p>Protect your home and belongings.</p>
                </div>
                <div class="service-card" data-aos="fade-up" data-aos-delay="400">
                    <i class="fas fa-heartbeat service-icon"></i>
                    <h3>Life Insurance</h3>
                    <p>Secure your family's future.</p>
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