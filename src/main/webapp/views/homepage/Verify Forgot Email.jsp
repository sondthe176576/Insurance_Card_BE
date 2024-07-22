<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification for Password Reset</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(45deg, #405e8c 0%, #fad0c4 99%, #fad0c4 100%);
        }

        .verification-container {
            position: relative;
            width: 400px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(5px);
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo img {
            width: 100px;
            height: auto;
        }

        h3 {
            color: #fff;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        p {
            color: #fff;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 16px;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .btn-verify {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #fff;
            color: #405e8c;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-verify:hover {
            background: #f0f0f0;
        }

        .form-sent {
            display: none;
            text-align: center;
        }

        .tick-holder {
            width: 80px;
            height: 80px;
            background: #4CAF50;
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .tick-icon:before {
            content: '\2714';
            color: #fff;
            font-size: 40px;
        }
    </style>
</head>
<body>
<div class="verification-container animate__animated animate__fadeIn">
    <div class="logo">
        <a href="home.jsp">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
        </a>
    </div>
    <form action="${pageContext.request.contextPath}/verifyforgot" method="post">
        <h3>Email Verification</h3>
        <p>To reset your password, enter the verification code we sent to your email</p>
        <input class="form-control" type="text" name="code" placeholder="Verification Code" required>
        <button type="submit" class="btn-verify">Verify Code</button>
    </form>
    <div class="form-sent">
        <div class="tick-holder">
            <div class="tick-icon"></div>
        </div>
        <h3>Verification successful</h3>
        <p>You can now reset your password</p>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js"></script>
<script>
    gsap.from(".verification-container", {duration: 1, opacity: 0, y: 50, ease: "power3.out"});

    document.querySelector('form').addEventListener('submit', function(e) {
        // This prevents the default form submission
        // Remove this line if you want the form to actually submit
        // e.preventDefault();

        // This code will show the success message
        // You may want to trigger this based on the server response instead
        // document.querySelector('form').style.display = 'none';
        // document.querySelector('.form-sent').style.display = 'block';
        // gsap.from(".form-sent", {duration: 0.5, opacity: 0, y: 20, ease: "power3.out"});
    });
</script>
</body>
</html>