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
        <form action="${pageContext.request.contextPath}/verifyforgot" method="post">
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
                        <h3>Email Verification</h3>
                        <p>To sign in, fill numbers in this blank that we sent to your email</p>
                        <form>
                            <input class="form-control" type="text" name="code" placeholder="Verify Code" required>
                            <div class="form-button full-width">
                                <button id="submit" type="submit" class="ibtn btn-forget">Send Verification Code</button>
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
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/jquery.min.js"></script>
<script src="../../js/popper.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/main.js"></script>
</body>


</html>