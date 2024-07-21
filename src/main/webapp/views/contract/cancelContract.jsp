<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contract Cancellation Successful</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        body {
            font-family: 'Poppins', sans-serif;
        }
        /* Ensure the footer stays at the bottom */
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1;
        }
        footer {
            background-color: #2d3748; /* Tailwind's bg-gray-800 color */
            color: #cbd5e0; /* Tailwind's text-gray-400 color */
            padding: 1rem;
            text-align: center;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900">

<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->

<!-- Navbar -->
<nav class="bg-blue-900 border-b-4 border-orange-600 sticky top-0 z-50 transition-all duration-300 ease-in-out" x-data="{ isScrolled: false }" x-init="window.addEventListener('scroll', () => isScrolled = window.scrollY > 0)">
    <div class="container mx-auto px-4 py-3">
        <ul class="flex justify-center space-x-8">
            <li>
                <a href="${pageContext.request.contextPath}/homepageforcustomer" class="text-white font-semibold uppercase hover:text-orange-500 transition-colors duration-300 flex items-center">
                    <i class="fas fa-home mr-2"></i> Home
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/createContract?customerID=${sessionScope.customerID}" class="text-white font-semibold uppercase hover:text-orange-500 transition-colors duration-300 flex items-center">
                    <i class="fas fa-file-contract mr-2"></i> Buy Insurance
                </a>
            </li>
            <li>
                <a href="#" class="text-white font-semibold uppercase hover:text-orange-500 transition-colors duration-300 flex items-center">
                    <i class="fas fa-info-circle mr-2"></i> About
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/contractForCustomer" class="text-white font-semibold uppercase hover:text-orange-500 transition-colors duration-300 flex items-center">
                    <i class="fas fa-file-alt mr-2"></i> Contract
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/dashboard/customerDashboard.jsp" class="text-white font-semibold uppercase hover:text-orange-500 transition-colors duration-300 flex items-center">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- End of navbar -->

<div class="content container mx-auto mt-10 px-4">
    <a href="${pageContext.request.contextPath}/homepageforcustomer" class="inline-flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-300 mb-6">
        <i class="fas fa-arrow-left mr-2"></i> Back to Home
    </a>
    <div class="bg-white rounded-lg shadow-lg p-8" data-aos="fade-up">
        <div class="flex items-center mb-4">
            <i class="fas fa-check-circle text-5xl text-green-500 mr-4"></i>
            <h2 class="text-3xl font-bold text-gray-800">Contract Cancellation Successful!</h2>
        </div>
        <p class="text-lg text-gray-600 mb-4">Your contract has been successfully canceled and is currently being processed. If there are any notifications, we will send them to your email.</p>
        <hr class="my-6 border-t border-gray-300">
        <p class="text-lg text-gray-600">If you have any questions, please <a href="#" class="text-blue-600 hover:underline" onclick="showContactForm()">contact us</a>.</p>
    </div>
</div>

<!-- Footer -->
<footer>
    <jsp:include page="/views/includes/footer.jsp"/>
</footer>
<!-- End of footer -->

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();

    function showContactForm() {
        Swal.fire({
            title: 'Contact Us',
            html:
                '<input id="name" class="swal2-input" placeholder="Your Name">' +
                '<input id="email" class="swal2-input" placeholder="Your Email">' +
                '<textarea id="message" class="swal2-textarea" placeholder="Your Message"></textarea>',
            focusConfirm: false,
            preConfirm: () => {
                const name = Swal.getPopup().querySelector('#name').value;
                const email = Swal.getPopup().querySelector('#email').value;
                const message = Swal.getPopup().querySelector('#message').value;
                if (!name || !email || !message) {
                    Swal.showValidationMessage('Please fill out all fields');
                }
                return { name, email, message };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    'Thank you!',
                    'Your message has been sent. We will get back to you soon.',
                    'success'
                );
            }
        });
    }
</script>
</body>
</html>