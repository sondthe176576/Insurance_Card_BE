<!DOCTYPE html>
<html lang="en">
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
   <form action="${pageContext.request.contextPath}/login" method="post" autocomplete="off"> <!-- Add autocomplete="off" here -->
      <div class="row">
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
                  <p>Access to the most powerful tool in the entire design and web industry.</p>
                  <div class="page-links">
                     <a href="${pageContext.request.contextPath}/login" class="active">Login</a>
                     <a href="${pageContext.request.contextPath}/register">Register</a>
                  </div>
                  <input class="form-control" type="text" name="username" placeholder="E-mail Address" autocomplete="off" required>
                  <input class="form-control" type="password" name="password" placeholder="Password" autocomplete="off" required>
                  <div class="form-button">
                     <button id="submit" type="submit" class="ibtn">Login</button>
                     <a href="${pageContext.request.contextPath}/forgot">Forget password?</a>
                  </div>
                  <div class="other-links">
                         <span>Or login with</span><a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid

&redirect_uri=http://localhost:8080/Insurance_Card_BE/login&response_type=code

&client_id=118161104901-9k1alked83pno18nuc0clpmvf6b5ml0l.apps.googleusercontent.com

&approval_prompt=force" class="ibtn">Google</a>
                  <p class="error">${requestScope.mess}</p>
               </div>
            </div>
         </div>
      </div>
   </form>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
