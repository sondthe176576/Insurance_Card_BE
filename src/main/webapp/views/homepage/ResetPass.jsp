<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
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

        .reset-container {
            position: relative;
            width: 400px;
            height: 500px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(5px);
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form {
            text-align: center;
            position: relative;
            width: 100%;
            height: 100%;
            padding: 40px;
        }

        .form h3 {
            position: relative;
            color: #fff;
            font-size: 24px;
            font-weight: 600;
            letter-spacing: 1px;
            margin-bottom: 40px;
        }

        .form h3::before {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 80px;
            height: 4px;
            background: #fff;
        }

        .form p {
            color: #fff;
            margin-bottom: 20px;
        }

        .form .inputBox {
            width: 100%;
            margin-top: 20px;
        }

        .form .inputBox input {
            width: 100%;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            outline: none;
            padding: 10px 20px;
            border-radius: 35px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 16px;
            letter-spacing: 1px;
            color: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .form .inputBox input::placeholder {
            color: #fff;
        }

        .form .inputBox input[type="submit"] {
            background: #fff;
            color: #666;
            max-width: 100px;
            cursor: pointer;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 80px;
            height: 80px;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translatey(0px); }
            50% { transform: translatey(-20px); }
            100% { transform: translatey(0px); }
        }
    </style>
</head>
<body>
<div class="reset-container animate__animated animate__fadeIn">
    <form action="${pageContext.request.contextPath}/reset" method="post" autocomplete="off" class="form">
        <h3>Reset Password</h3>
        <p>Enter your new password below</p>
        <div class="inputBox">
            <input type="password" name="newpass" placeholder="New Password" required>
        </div>
        <div class="inputBox">
            <input type="password" name="verifypass" placeholder="Confirm New Password" required>
        </div>
        <div class="inputBox">
            <input type="submit" value="Save">
        </div>
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js"></script>
<script>
    gsap.from(".reset-container", {duration: 1, opacity: 0, y: 50, ease: "power3.out"});
    gsap.from(".inputBox", {duration: 0.5, opacity: 0, y: 20, stagger: 0.2, ease: "power3.out", delay: 0.5});
</script>
</body>
</html>