<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peace Insurance</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-dRy7IvjjGvD+XlI3F1RU5MRy9FvD0AXPjFN1RdFup7mytEaxNTWJbxHWB6OjzkpAh9D5Nn9muP1dIgM6bR/wwg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
        }

        .icon {
            display: inline-block;
            margin-right: 8px;
        }

        .footer-link:hover {
            color: #f39c12;
            transition: color 0.3s ease;
        }

        .cta-button {
            background-color: #f39c12;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .cta-button:hover {
            background-color: #e67e22;
        }

        .social-icon {
            color: #ffffff;
            margin-right: 10px;
        }

        .social-icon:hover {
            color: #f39c12;
        }

        .social-box {
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: background-color 0.3s ease;
        }

        .social-box.facebook {
            background-color: #3b5998;
        }

        .social-box.facebook:hover {
            background-color: #2d4373;
        }

        .social-box.twitter {
            background-color: #1da1f2;
        }

        .social-box.twitter:hover {
            background-color: #0d95e8;
        }

        .social-box.google {
            background-color: #db4437;
        }

        .social-box.google:hover {
            background-color: #c23321;
        }

        .social-box.linkedin {
            background-color: #0077b5;
        }

        .social-box.linkedin:hover {
            background-color: #005983;
        }

        .social-box.youtube {
            background-color: #FF0000;
        }

        .social-box.youtube:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body class="bg-gray-100">
<div id="footer" class="bg-gray-900 text-white py-10">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center animate__animated animate__fadeIn">
            <div class="flex items-center">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo" class="h-12 mr-4">
                <span class="text-2xl font-bold">Peace Insurance</span>
            </div>
            <div class="text-right">
                <span class="text-xl font-bold">+1 800-PEACE | (1-800-123-4567)</span>
            </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mt-8">
            <div>
                <h2 class="text-lg font-bold text-yellow-500 mb-4">Insurance</h2>
                <ul>
                    <li class="mb-2 flex items-center"><i class="fas fa-car icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Auto Insurance</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-home icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Home Insurance</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-briefcase icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Business Insurance</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-heartbeat icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Life Insurance</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-plane icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Travel Insurance</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-umbrella icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Other Insurance</a></li>
                </ul>
            </div>
            <div>
                <h2 class="text-lg font-bold text-yellow-500 mb-4">Quick Links</h2>
                <ul>
                    <li class="mb-2 flex items-center"><i class="fas fa-info-circle icon"></i><a href="#" class="hover:text-yellow-500 footer-link">About us</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-headset icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Support</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-briefcase icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Careers</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-download icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Download App</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-chart-line icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Investors</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-user-friends icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Find An Agent</a></li>
                    <li class="mb-2 flex items-center"><i class="fas fa-file-alt icon"></i><a href="#" class="hover:text-yellow-500 footer-link">Claims</a></li>
                </ul>
            </div>
            <div>
                <h2 class="text-lg font-bold text-yellow-500 mb-4">About Peace Insurance</h2>
                <p class="mb-4">Established in 1990, we are your insurance expert committed to providing peace of mind to all kinds of borrowers by helping them obtain and manage insurance.</p>
                <p class="font-bold">Address: 56702, Meeraz Centroz, Near Roxa, Garden, Bangalore</p>
                <p class="font-bold">Phone: +1 800-PEACE | (1-800-123-4567)</p>
                <a href="#" class="inline-block bg-yellow-500 text-white py-2 px-4 rounded mt-4 hover:bg-yellow-600 animate__animated animate__pulse cta-button">Get A Quote</a>
            </div>
            <div>
                <h2 class="text-lg font-bold text-yellow-500 mb-4">Social</h2>
                <ul>
                    <li class="social-box facebook"><i class="fab fa-facebook-f social-icon"></i><a href="#" class="flex items-center text-white footer-link">Facebook</a></li>
                    <li class="social-box twitter"><i class="fab fa-twitter social-icon"></i><a href="#" class="flex items-center text-white footer-link">Twitter</a></li>
                    <li class="social-box google"><i class="fab fa-google social-icon"></i><a href="#" class="flex items-center text-white footer-link">Google</a></li>
                    <li class="social-box linkedin"><i class="fab fa-linkedin-in social-icon"></i><a href="#" class="flex items-center text-white footer-link">LinkedIn</a></li>
                    <li class="social-box youtube"><i class="fab fa-youtube social-icon"></i><a href="#" class="flex items-center text-white footer-link">YouTube</a></li>
                </ul>
            </div>
        </div>
        <div class="flex justify-between items-center mt-8 animate__animated animate__fadeIn">
            <div>
                <span>Copyright 2024. Peace Insurance Company. All Rights Reserved.</span>
            </div>
            <div>
                <ul class="flex space-x-4">
                    <li><a href="#" class="hover:text-yellow-500 footer-link">Site Map</a></li>
                    <li><a href="#" class="hover:text-yellow-500 footer-link">Privacy Policy</a></li>
                    <li><a href="#" class="hover:text-yellow-500 footer-link">Terms of Use</a></li>
                    <li><a href="#" class="hover:text-yellow-500 footer-link">Security</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>