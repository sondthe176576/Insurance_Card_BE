<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>Customer Dashboard</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        /* Custom Navbar */
        .navbar-custom {
            background-color: #004080;
            border-bottom: 3px solid #ff8000;
        }
        .navbar-custom .navbar-nav .nav-link {
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            padding: 20px;
        }
        .navbar-custom .navbar-nav .nav-link:hover {
            color: #ff8000;
        }
        .navbar-custom .dropdown-menu {
            background-color: #004080;
            border: none;
        }
        .navbar-custom .dropdown-menu .dropdown-item {
            color: white;
        }
        .navbar-custom .dropdown-menu .dropdown-item:hover {
            background-color: #ff8000;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon" style="color:white;"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">HOME</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        INSURANCE
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                        <a class="dropdown-item" href="#">Auto Insurance</a>
                        <a class="dropdown-item" href="#">Home Insurance</a>
                        <a class="dropdown-item" href="#">Life Insurance</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        FIND AN AGENT
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                        <a class="dropdown-item" href="#">Search Agent</a>
                        <a class="dropdown-item" href="#">Agent Listing</a>
                        <a class="dropdown-item" href="#">Agent Details</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        CLAIM CENTER
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown3">
                        <a class="dropdown-item" href="#">Claim Center</a>
                        <a class="dropdown-item" href="#">Auto Claim</a>
                        <a class="dropdown-item" href="#">Home Claim</a>
                        <a class="dropdown-item" href="#">Life Claim</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        PAGES
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown4">
                        <a class="dropdown-item" href="#">Blog</a>
                        <a class="dropdown-item" href="#">Blog details</a>
                        <a class="dropdown-item" href="#">Faq's</a>
                        <a class="dropdown-item" href="#">404 Error</a>
                        <a class="dropdown-item" href="#">Investor</a>
                        <a class="dropdown-item" href="#">Financial Report</a>
                        <a class="dropdown-item" href="#">Annual Report</a>
                        <a class="dropdown-item" href="#">Career Listing</a>
                        <a class="dropdown-item" href="#">Career Details</a>
                        <a class="dropdown-item" href="#">Career Form</a>
                        <a class="dropdown-item" href="#">Story Testimonial</a>
                        <a class="dropdown-item" href="#">Wizard Form</a>
                        <a class="dropdown-item" href="#">How it works</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        SHORTCODES
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown5">
                        <a class="dropdown-item" href="#">Alerts</a>
                        <a class="dropdown-item" href="#">Tabs</a>
                        <a class="dropdown-item" href="#">Accordion</a>
                        <a class="dropdown-item" href="#">Pagination</a>
                        <a class="dropdown-item" href="#">Call to action</a>
                        <a class="dropdown-item" href="#">Dropcap</a>
                        <a class="dropdown-item" href="#">Blockquotes</a>
                        <a class="dropdown-item" href="#">Columns</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">CONTACT US</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown6" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        SHARE +
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown6">
                        <a class="dropdown-item" href="#">Facebook</a>
                        <a class="dropdown-item" href="#">Twitter</a>
                        <a class="dropdown-item" href="#">LinkedIn</a>
                        <a class="dropdown-item" href="#">Google+</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Content -->
<div class="container mt-4">
    <div class="header mb-4">
        <h1>Customer Dashboard</h1>
    </div>
    <div class="content">
        <div class="card mb-3">
            <div class="card-body">
                <h2>Welcome, [Customer Name]!</h2>
                <p>Here you can view your profile information, manage orders, and update settings.</p>
            </div>
        </div>
        <div class="card mb-3">
            <div class="card-body">
                <h2>Recent Orders</h2>
                <p>No recent orders found.</p>
            </div>
        </div>
        <div class="card mb-3">
            <div class="card-body">
                <h2>Account Settings</h2>
                <p>Update your account settings and preferences.</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
    function handleSearch(event) {
        event.preventDefault();
        const query = document.getElementById('searchInput').value;
        alert('You searched for: ' + query);
    }
</script>
</body>
</html>