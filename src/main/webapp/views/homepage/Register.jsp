<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from brandio.io/envato/iofrm/html/register14.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 20 May 2024 23:46:08 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iofrm-theme14.css">

    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="form-body">
    <div class="row">
        <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <div class="website-logo-inside">
                        <a href="home.jsp">
                            <div class="logo">
                                <img class="logo-size" src="${pageContext.request.contextPath}/img/logo.png" alt="">
                            </div>
                        </a>

                    </div>
                    <h3>Get more things done with Loggin platform.</h3>
                    <p>Access to the most powerfull tool in the entire design and web industry.</p>
                    <div class="page-links">
                        <a href="${pageContext.request.contextPath}/login">Login</a><a href="${pageContext.request.contextPath}/register" class="active">Register</a>
                    </div>
                    <form>
                        <input class="form-control" type="text" name="name" placeholder="Full Name" required>
                        <input class="form-control" type="text" name="address" placeholder="Address" required>
                        <input class="form-control" type="text" name="phone" placeholder="Phone" required>
                        <input class="form-control" type="email" name="email-address" placeholder="Email" required>
                        <input class="form-control" type="email" name="email" placeholder="E-mail Address" required>
                        <input class="form-control" type="password" name="password" placeholder="Password" required>
                        <input class="form-control" type="text" name="gender" placeholder="Gender" required>
                        <div class="form-button">
                            <button id="submit" type="submit" class="ibtn">Register</button>
                        </div>
                    </form>
                    <p class="error">${requestScope.message}</p>
                </div>
            </div>
        </div>
        </form>
    </div>

</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>

<!-- Mirred from brandio.io/envato/iofrm/html/register14.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 20 May 2024 23:46:08 GMT -->
</html>