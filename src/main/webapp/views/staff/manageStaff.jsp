<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insurance Card</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        :root {
            --primary-color: #3a0ca3;
            --secondary-color: #4361ee;
            --accent-color: #f72585;
            --text-color: #2b2d42;
            --light-bg: #f8f9fa;
            --dark-bg: #1a1a2e;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-bg);
            color: var(--text-color);
        }

        .main-container {
            padding: 40px 0;
        }

        /* Enhanced Header Styles */
        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            padding: 20px 0;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.5rem;
        }

        .nav-link {
            color: var(--text-color);
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -5px;
            left: 0;
            background-color: var(--accent-color);
            transition: width 0.3s ease;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        /* Enhanced Hero Section */
        .hero-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 120px 0;
            border-radius: 0 0 100px 100px;
            margin-bottom: 80px;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 10%, transparent 10%),
            radial-gradient(circle, rgba(255,255,255,0.1) 10%, transparent 10%);
            background-size: 50px 50px;
            background-position: 0 0, 25px 25px;
            transform: rotate(45deg);
            animation: moveBackground 30s linear infinite;
        }

        @keyframes moveBackground {
            0% {
                background-position: 0 0, 25px 25px;
            }
            100% {
                background-position: 1000px 0, 1025px 25px;
            }
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-content h1 {
            font-size: 4rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            max-width: 600px;
        }

        .btn-custom {
            background-color: var(--accent-color);
            color: white;
            font-weight: 600;
            padding: 15px 40px;
            border-radius: 50px;
            transition: all 0.3s ease;
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .btn-custom:hover {
            background-color: #e5097f;
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        /* Enhanced Feature Cards */
        .feature-card {
            background-color: white;
            border-radius: 20px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            transition: all 0.5s ease;
        }

        .feature-card:hover::before {
            left: 100%;
        }

        .feature-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 30px 60px rgba(0,0,0,0.15);
        }

        .feature-icon {
            font-size: 3rem;
            color: var(--accent-color);
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .feature-card:hover .feature-icon {
            transform: scale(1.2);
        }

        /* Enhanced FAQ Section */
        .faq-section {
            background-color: var(--dark-bg);
            padding: 100px 0;
            border-radius: 100px;
            color: white;
            margin: 80px 0;
        }

        .faq-item {
            background-color: rgba(255,255,255,0.05);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .faq-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
            background-color: rgba(255,255,255,0.1);
        }

        /* Enhanced Customer Reviews */
        .customer-review {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            margin-bottom: 30px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .customer-review::before {
            content: '\201C';
            position: absolute;
            top: -20px;
            left: 20px;
            font-size: 150px;
            color: rgba(0,0,0,0.1);
            font-family: serif;
        }

        .customer-review:hover {
            transform: translateY(-10px);
            box-shadow: 0 30px 60px rgba(0,0,0,0.15);
        }

        .customer-review img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-right: 20px;
            object-fit: cover;
            border: 4px solid var(--accent-color);
        }

        /* Enhanced Footer Styles */
        footer {
            background-color: var(--dark-bg);
            color: white;
            padding: 80px 0 30px;
            border-radius: 100px 100px 0 0;
            position: relative;
            overflow: hidden;
        }

        footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            opacity: 0.1;
        }

        footer h5 {
            color: var(--accent-color);
            margin-bottom: 25px;
            font-weight: 600;
        }

        footer ul {
            list-style-type: none;
            padding-left: 0;
        }

        footer ul li {
            margin-bottom: 15px;
        }

        footer ul li a {
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        footer ul li a:hover {
            color: var(--accent-color);
            transform: translateX(5px);
        }

        .social-icons a {
            color: white;
            font-size: 1.5rem;
            margin-right: 20px;
            transition: all 0.3s ease;
        }

        .social-icons a:hover {
            color: var(--accent-color);
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
<jsp:include page="/views/includes/header_logout.jsp" />
<jsp:include page="/views/includes/navbar.jsp" />

<div class="main-container" id="main-container">
    <div class="container">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 hero-content">
                        <h1>Drive with Confidence</h1>
                        <p>Experience unparalleled protection and peace of mind with our cutting-edge car insurance solutions.</p>
                        <a href="#" class="btn btn-custom">Get Your Free Quote</a>
                    </div>
                    <div class="col-lg-6">

                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section py-5">
            <div class="container">
                <h2 class="text-center mb-5 display-4 fw-bold">Why Choose Our Insurance</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="feature-card text-center">
                            <i class="fas fa-shield-alt feature-icon"></i>
                            <h3 class="h4 mb-3">Comprehensive Coverage</h3>
                            <p>Enjoy complete protection against accidents, theft, and more with our all-inclusive policies.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card text-center">
                            <i class="fas fa-money-bill-wave feature-icon"></i>
                            <h3 class="h4 mb-3">Affordable Rates</h3>
                            <p>Benefit from competitive pricing and personalized discounts tailored to your unique driving profile.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card text-center">
                            <i class="fas fa-headset feature-icon"></i>
                            <h3 class="h4 mb-3">24/7 Expert Support</h3>
                            <p>Our dedicated team is always at your service, providing round-the-clock assistance whenever you need it.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section class="faq-section">
            <div class="container">
                <h2 class="text-center mb-5 display-4 fw-bold">Frequently Asked Questions</h2>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="faq-item">
                            <h4 class="h5 mb-3">What types of coverage do you offer?</h4>
                            <p>We provide a comprehensive range of coverage options, including liability, collision, comprehensive, and personal injury protection, tailored to meet your specific needs.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="faq-item">
                            <h4 class="h5 mb-3">How can I file a claim?</h4>
                            <p>Filing a claim is quick and easy. You can submit claims through our user-friendly mobile app, our secure online portal, or by calling our 24/7 claims hotline for immediate assistance.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Customer Reviews Section -->
        <section class="reviews-section py-5">
            <div class="container">
                <h2 class="text-center mb-5 display-4 fw-bold">What Our Customers Say</h2>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="customer-review d-flex align-items-start">
                            <img src="/api/placeholder/80/80" alt="John Doe" class="mr-4">
                            <div>
                                <p class="mb-3">"I've been with this insurance company for years, and their service never fails to impress. The peace of mind they provide is invaluable, knowing I'm fully protected on the road."</p>
                                <strong class="d-block">John Doe</strong>
                                <small class="text-muted">Loyal Customer since 2015</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="customer-review d-flex align-items-start">
                            <img src="/api/placeholder/80/80" alt="Jane Smith" class="mr-4">
                            <div>
                                <p class="mb-3">"After my recent accident, I was blown away by how quickly and efficiently they handled my claim. Their support team was not just professional but genuinely caring throughout the process."</p>
                                <strong class="d-block">Jane Smith</strong>
                                <small class="text-muted">Satisfied Client</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>