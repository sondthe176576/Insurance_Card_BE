<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/includes/header.jsp"/>

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
        .navbar-custom .navbar-container {
            display: flex;
            justify-content: center; /* Căn giữa các phần tử trong thanh navbar */
            align-items: center;
            padding: 10px 20px;
        }
        .navbar-custom .nav-links {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .navbar-custom .nav-links li {
            margin: 0 10px; /* Khoảng cách giữa các phần tử */
        }
        .navbar-custom .nav-links li a {
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            padding: 10px 15px;
            text-decoration: none;
        }
        .navbar-custom .nav-links li a:hover {
            color: #ff8000;
        }
        .navbar-custom .nav-actions {
            display: flex;
            align-items: center;
        }
        .navbar-custom .search-btn {
            background: transparent;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-right: 20px;
        }
        .navbar-custom .search-btn:hover {
            color: #ff8000;
        }
        .container.content-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-custom">
    <div class="navbar-container">
        <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">Service</a></li>
            <li><a href="#">About</a></li>
            <li><a href="${pageContext.request.contextPath}/contractDetail/1">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/customerDashboard">Dashboard</a></li>
        </ul>

    </div>
</nav>

<!-- Content -->
<style>
    .content-section {
        text-align: center;
        padding: 50px 0;
    }
    .content-section h2 {
        font-size: 24px;
        color: #004080;
        margin-bottom: 20px;
    }
    .content-section p {
        color: #666;
    }
    .info-box {
        display: flex;
        justify-content: center;
        margin-bottom: 50px;
    }
    .info-box .box {
        flex: 1;
        max-width: 500px;
        padding: 20px;
        margin: 10px;
        border: 1px solid #ddd;
        text-align: center;
    }
    .info-box .box h3 {
        font-size: 20px;
        color: #004080;
    }
    .info-box .box p {
        color: #666;
        margin-bottom: 20px;
    }
    .info-box .box .btn {
        background-color: #ff8000;
        color: white;
        border: none;
        padding: 10px 20px;
        text-transform: uppercase;
    }
    .coverage-section .coverage-box {
        margin: 20px 0;
        text-align: center;
    }
    .coverage-section .coverage-box .icon {
        font-size: 30px;
        color: #004080;
        margin-bottom: 10px;
    }
    .coverage-section .coverage-box h3 {
        font-size: 18px;
        color: #004080;
    }
    .coverage-section .coverage-box p {
        color: #666;
    }
    .news-section .news-box {
        margin: 20px 0;
    }
    .news-section .news-box img {
        width: 100%;
        height: auto;
    }
    .news-section .news-box h3 {
        font-size: 18px;
        color: #004080;
        margin-top: 10px;
    }
    .news-section .news-box p {
        color: #666;
        margin-bottom: 10px;
    }
    .news-section .news-box small {
        color: #999;
    }
    .pagination {
        text-align: center;
        margin-top: 30px;
    }
    .pagination .page-link {
        color: #004080;
        padding: 10px 15px;
        border: 1px solid #ddd;
        margin: 0 5px;
        text-decoration: none;
    }
    .pagination .page-link:hover {
        background-color: #004080;
        color: white;
    }
</style>
<div class="container content-section">
    <h2>Peace Insurance has over 25 years of experience in the insurance industry.</h2>

    <h2>Insurance Coverage That Fits Your Life</h2>
    <p>Insurance coverage tailored to your needs is easier than you think. Sometimes on purpose injected humor and the like, simple dummy.</p>

    <div class="row coverage-section">
        <div class="col-md-3 coverage-box">
            <div class="icon"><i class="fa fa-home"></i></div>
            <h3>Home Insurance</h3>
            <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <div class="col-md-3 coverage-box">
            <div class="icon"><i class="fa fa-briefcase"></i></div>
            <h3>Business Insurance</h3>
            <p>Aliquam at lacus ac sapien molestie consequat nec in nibh. Mauris sagittis magna ut nunc.</p>
        </div>
        <div class="col-md-3 coverage-box">
            <div class="icon"><i class="fa fa-plane"></i></div>
            <h3>Travel Insurance</h3>
            <p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque pharetra elit ut nisl.</p>
        </div>
        <div class="col-md-3 coverage-box">
            <div class="icon"><i class="fa fa-heart"></i></div>
            <h3>Heart – Life Insurance</h3>
            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>
        </div>
    </div>

    <h2>Latest News From Media</h2>

    <div class="row news-section">
        <div class="col-md-4 news-box">
            <img src="${pageContext.request.contextPath}/img/z5492679158839_534a533f48030b12a6e7f92ab158c5c7.jpg" alt="News Image 1">
            <h3>Lorem Ipsum Dolor Sit Amet Michel Jackson</h3>
            <p>Morbi lectus arcu, suscipit quis congue quis, vulp ut nulla. Curabitur sit amet interdum lectus.</p>
            <small>Posted on Jan 21, 2024</small>
        </div>
        <div class="col-md-4 news-box">
            <img src="${pageContext.request.contextPath}/img/z5492679158847_6af0583704368bef81f3b34a4603722c.jpg" alt="News Image 2">
            <h3>Pellentesque faucibus mauris id lobortis hendrerit</h3>
            <p>Morbi lectus arcu, suscipit quis congue quis, vulp ut nulla. Curabitur sit amet interdum lectus.</p>
            <small>Posted on Jan 21, 2024</small>
        </div>
        <div class="col-md-4 news-box">
            <img src="${pageContext.request.contextPath}/img/z5492679165470_52b14d798485dcfe812daa4ef80f4b1f.jpg" alt="News Image 3">
            <h3>Pellentesque faucibus mauris id lobortis hendrerit</h3>
            <p>Morbi lectus arcu, suscipit quis congue quis, vulp ut nulla. Curabitur sit amet interdum lectus.</p>
            <small>Posted on Jan 21, 2024</small>
        </div>
    </div>

    <div class="pagination">
        <a href="#" class="page-link">1</a>
        <a href="#" class="page-link">2</a>
    </div>
</div>
<jsp:include page="/views/includes/footer.jsp"/>

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