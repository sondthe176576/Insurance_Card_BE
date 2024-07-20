<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset - Peace Insurance</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css">
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #f39c12;
            --background-color: #f0f2f5;
            --text-color: #333;
            --error-color: #e74c3c;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 400px;
            max-width: 90%;
        }

        .form-header {
            background-color: var(--primary-color);
            color: #fff;
            padding: 30px;
            text-align: center;
        }

        .form-header h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .form-header p {
            font-size: 14px;
            opacity: 0.8;
        }

        .form-content {
            padding: 30px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .input-group input:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .btn {
            background-color: var(--primary-color);
            color: #fff;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .btn:hover {
            background-color: #3a7bd5;
        }

        .error {
            color: var(--error-color);
            font-size: 14px;
            margin-top: 10px;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animated {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body>
<div class="container" data-aos="fade-up">
    <div class="form-header">
        <h3><i class="fas fa-lock"></i> Password Reset</h3>
        <p>Enter your email to reset your password</p>
    </div>
    <div class="form-content">
        <form action="${pageContext.request.contextPath}/forgot" method="post">
            <div class="input-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="usernameforgot" placeholder="Enter your email" required>
            </div>
            <button type="submit" class="btn">
                <i class="fas fa-paper-plane"></i> Send Reset Link
            </button>
        </form>
        <p class="error animated">${requestScope.messforgot}</p>
        <div class="back-link">
            <a href="login.jsp"><i class="fas fa-arrow-left"></i> Back to Login</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true
    });
</script>
</body>
</html>