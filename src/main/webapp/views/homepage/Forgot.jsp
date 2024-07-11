<!DOCTYPE html>
<html lang="en">

<head>
    <title>Forgot Password</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .form-holder {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f3f4f6;
        }

        .form-content {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .logo img {
            width: 120px;
        }

        .form-control {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
        }

        .form-button {
            display: flex;
            justify-content: center;
        }

        .btn-forget {
            padding: 10px 20px;
            background-color: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-forget:hover {
            background-color: #1d4ed8;
        }

        .form-sent {
            text-align: center;
        }

        .tick-icon {
            font-size: 50px;
            color: #10b981;
        }

        .info-holder a {
            color: #2563eb;
        }
    </style>
</head>

<body>
<div class="form-holder">
    <div class="form-content">
        <div class="form-items">
            <div class="logo">
                <a href="home.jsp">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
                </a>
            </div>
            <h3 class="text-2xl font-semibold text-gray-700 mb-4">Password Reset</h3>
            <p class="text-gray-600 mb-6">To reset your password, enter the email address you use to sign in to iofrm</p>
            <form action="${pageContext.request.contextPath}/forgot" method="post">
                <input class="form-control" type="email" name="usernameforgot" placeholder="E-mail Address" required>
                <div class="form-button">
                    <button id="submit" type="submit" class="btn-forget">Send Reset Link</button>
                </div>
            </form>
        </div>
        <div class="form-sent hidden">
            <div class="logo">
                <a href="index.html">
                    <img src="images/logo-light.svg" alt="Logo">
                </a>
            </div>
            <div class="tick-holder">
                <i class="fas fa-check-circle tick-icon"></i>
            </div>
            <h3 class="text-2xl font-semibold text-gray-700 mb-4">Password link sent</h3>
            <div class="info-holder">
                <span class="text-gray-600">Unsure if that email address was correct?</span> <a href="#">We can help</a>.
            </div>
        </div>
    </div>
</div>
<p class="error text-center text-red-600 mt-4">${requestScope.messforgot}</p>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Additional JavaScript to enhance user interaction can be added here
</script>
</body>

</html>