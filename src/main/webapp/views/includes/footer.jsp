<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        .tp-footer-two {
            background-color: #282c34;
            color: #ffffff;
            padding: 40px 0;
        }

        .tp-footer-two h2 {
            font-size: 18px;
            margin-bottom: 20px;
            color: #f39c12;
        }

        .tp-footer-two a {
            color: #ffffff;
            text-decoration: none;
        }

        .tp-footer-two a:hover {
            color: #f39c12;
        }

        .tp-footer-two .ft-logo img {
            max-width: 150px;
            margin-bottom: 20px;
        }

        .tp-footer-two .ft-links ul, .tp-footer-two .ft-aboutus ul {
            list-style: none;
            padding: 0;
        }

        .tp-footer-two .ft-links ul li, .tp-footer-two .ft-aboutus ul li {
            margin-bottom: 10px;
        }

        .tp-footer-two .ft-links ul li i, .tp-footer-two .ft-aboutus ul li i {
            margin-right: 10px;
        }

        .tp-footer-two .cta {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            line-height: 1.6;
        }

        .tp-footer-two .ft-aboutus p {
            margin-bottom: 10px;
        }

        .tp-footer-two .ft-aboutus .addrs {
            font-weight: bold;
        }

        .tp-footer-two .ft-links-social ul {
            list-style: none;
            padding: 0;
        }

        .tp-footer-two .ft-links-social ul li {
            margin-bottom: 10px;
        }

        .tp-footer-two .ft-links-social ul li a {
            display: flex;
            align-items: center;
            color: #ffffff;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .tp-footer-two .ft-links-social ul li a i {
            font-size: 20px;
            margin-right: 10px;
        }

        .tp-footer-two .ft-links-social ul li a.facebook {
            background-color: #3b5998;
        }

        .tp-footer-two .ft-links-social ul li a.facebook:hover {
            background-color: #2d4373;
        }

        .tp-footer-two .ft-links-social ul li a.twitter {
            background-color: #1da1f2;
        }

        .tp-footer-two .ft-links-social ul li a.twitter:hover {
            background-color: #0d95e8;
        }

        .tp-footer-two .ft-links-social ul li a.google {
            background-color: #db4437;
        }

        .tp-footer-two .ft-links-social ul li a.google:hover {
            background-color: #c23321;
        }

        .tp-footer-two .ft-links-social ul li a.linkedin {
            background-color: #0077b5;
        }

        .tp-footer-two .ft-links-social ul li a.linkedin:hover {
            background-color: #005983;
        }

        .tp-footer-two .btn.tp-btn-orange {
            background-color: #f39c12;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .tp-footer-two .btn.tp-btn-orange:hover {
            background-color: #e67e22;
        }

        .tp-footer-two .copyright-text, .tp-footer-two .tiny-ft-links ul {
            margin-top: 20px;
        }

        .tp-footer-two .tiny-ft-links ul {
            list-style: none;
            padding: 0;
            text-align: right;
        }

        .tp-footer-two .tiny-ft-links ul li {
            display: inline;
            margin-left: 15px;
        }

        .tp-footer-two .tiny-ft-links ul li a {
            color: #ffffff;
            text-decoration: none;
        }

        .tp-footer-two .tiny-ft-links ul li a:hover {
            color: #f39c12;
        }
    </style>
</head>
<body>
<div id="tp-footer-two" class="tp-footer-two"><!-- footer -->
    <div class="container">
        <div class="row ft-section">
            <div class="col-md-4 ft-logo">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
            </div>
            <div class="col-md-8 cta">+1 800-PEACE | (1-800-123-4567)</div>
        </div>
        <div class="row ft-section">
            <!-- ft aboutus -->
            <div class="col-md-2 ft-links"><!-- footer links -->
                <h2>Insurance</h2>
                <ul>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Auto Insurance</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Home Insurance</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Business Insurance</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Life Insurance</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Travel Insurance</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Other Insurance</a></li>
                </ul>
            </div>
            <!-- /.footer links -->

            <div class="col-md-2 ft-links"><!-- footer links -->
                <h2>Quick Links</h2>
                <ul>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">About us</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Support</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Careers</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Download App</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Investors</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Find An Agent</a></li>
                    <li><i class="bi bi-chevron-double-right"></i><a href="#">Claims</a></li>
                </ul>
            </div>
            <!-- /.footer links -->
            <div class="col-md-5 ft-aboutus"> <!-- ft aboutus -->
                <h2>About Peace Insurance</h2>
                <p>Established in 1990, we are your insurance expert committed to providing peace of mind to all kinds of borrowers by helping them obtain and manage insurance.</p>
                <p><span class="addrs">Address :</span> 56702, Meeraz Centroz, Near Roxa, Garden, Bangalore</p>
                <p><span class="addrs">Phone :</span> +1 800-PEACE | (1-800-123-4567)</p>
                <a href="#" class="btn tp-btn tp-btn-orange">Get A Quote</a>
            </div>
            <div class="col-md-3 ft-links-social"><!-- footer social links -->
                <h2>Social</h2>
                <ul class="social-menu">
                    <li><a href="#" class="social-box facebook"><i class="bi bi-facebook"></i>Facebook</a></li>
                    <li><a href="#" class="social-box twitter"><i class="bi bi-twitter"></i>Twitter</a></li>
                    <li><a href="#" class="social-box google"><i class="bi bi-google"></i>Google</a></li>
                    <li><a href="#" class="social-box linkedin"><i class="bi bi-linkedin"></i>LinkedIn</a></li>
                </ul>
            </div>
            <!-- /.footer social links -->
        </div>
        <div class="row">
            <div class="col-md-6 copyright-text"><!-- copyright text -->
                Copyright 2024. Peace Insurance Company. All Rights Reserved.
            </div>
            <!-- /.copyright text -->
            <div class="col-md-6 tiny-ft-links"><!-- tiny ft links -->
                <ul>
                    <li><a href="#">Site Map</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Use</a></li>
                    <li><a href="#">Security</a></li>
                </ul>
            </div>
            <!-- /.tiny ft links -->
        </div>
    </div>
</div>
</body>
</html>