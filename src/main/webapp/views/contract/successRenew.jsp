<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contract Renewal Successful</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-900 flex flex-col min-h-screen">

<jsp:include page="/views/includes/header.jsp"/>

<jsp:include page="/views/includes/navbar.jsp"/>

<div class="container mx-auto px-4 py-8 flex-grow">
    <div class="max-w-4xl mx-auto">
        <div class="mb-6">
            <a href="${pageContext.request.contextPath}/homepageforcustomer"
               class="inline-flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-300 shadow-md hover:shadow-lg transform hover:-translate-y-0.5">
                <i class="fas fa-home mr-2"></i> Back to Home
            </a>
        </div>
        <div class="bg-white rounded-lg shadow-2xl p-8 animate__animated animate__fadeInUp">
            <div class="flex items-center mb-6">
                <div class="bg-green-100 rounded-full p-3 mr-4">
                    <i class="fas fa-check-circle text-4xl text-green-500"></i>
                </div>
                <h2 class="text-3xl font-bold text-gray-800">Contract Renewal Successful!</h2>
            </div>
            <p class="text-xl text-gray-600 mb-6">
                Your contract renewal request has been successfully submitted and is currently being processed.
                If there are any notifications, we will send them to your email.
            </p>
            <hr class="my-6 border-t-2 border-gray-200">
            <p class="text-lg text-gray-600">
                If you have any questions, please
                <a href="#" onclick="showContactForm()" class="text-blue-600 hover:underline">contact us</a>.
            </p>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<script>
    function showContactForm() {
        Swal.fire({
            title: 'Contact Us',
            html:
                '<input id="name" class="swal2-input" placeholder="Your Name">' +
                '<input id="email" class="swal2-input" placeholder="Your Email">' +
                '<textarea id="message" class="swal2-textarea" placeholder="Your Message"></textarea>',
            focusConfirm: false,
            showCancelButton: true,
            confirmButtonText: 'Send',
            cancelButtonText: 'Cancel',
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
                    'Message Sent!',
                    'We will get back to you soon.',
                    'success'
                );
            }
        });
    }
</script>

</body>
</html>