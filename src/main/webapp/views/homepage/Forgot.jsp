<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from brandio.io/envato/iofrm/html/forget14.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 20 May 2024 23:46:09 GMT -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iofrm-theme14.css">
</head>
<body>
<div class="form-body">
    <div class="row">
        <form action="${pageContext.request.contextPath}/forgot" method="post">
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
                    <h3>Password Reset</h3>
                    <p>To reset your password, enter the email address you use to sign in to iofrm</p>
                    <form>
                        <input class="form-control" type="text" name="usernameforgot" placeholder="E-mail Address" required>
                        <div class="form-button full-width">
                            <button id="submit" type="submit" class="ibtn btn-forget">Send Reset Link</button>
                        </div>
                    </form>
                </div>
                <div class="form-sent">
                    <div class="website-logo-inside">
                        <a href="index.html">
                            <div class="logo">
                                <img class="logo-size" src="images/logo-light.svg" alt="">
                            </div>
                        </a>
                    </div>
                    <div class="tick-holder">
                        <div class="tick-icon"></div>
                    </div>
                    <h3>Password link sent</h3>

                    <div class="info-holder">
                        <span>Unsure if that email address was correct?</span> <a href="#">We can help</a>.
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
    <p class="error">${requestScope.messforgot}</p>
</div>
<script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/jquery.min.js"></script>
<script src="../../js/popper.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/main.js"></script>
</body>


</html>