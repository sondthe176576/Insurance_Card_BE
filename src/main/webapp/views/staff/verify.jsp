<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác minh Email</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            width: 100%;
        }
        h2 {
            color: #4a4a4a;
            margin-bottom: 30px;
            font-weight: 600;
            text-align: center;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px;
            border: 2px solid #ddd;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #764ba2;
            box-shadow: 0 0 0 0.2rem rgba(118, 75, 162, 0.25);
        }
        .btn-primary {
            background-color: #764ba2;
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #5a387d;
            transform: translateY(-2px);
        }
        .error-message {
            color: #dc3545;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="mb-4">Xác minh Email</h2>
    <form action="${pageContext.request.contextPath}/new-verify" method="post">
        <div class="mb-4">
            <label for="verificationCode" class="form-label">Mã xác minh:</label>
            <input type="text" class="form-control" id="verificationCode" name="verificationCode" required placeholder="Nhập mã xác minh">
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-lg">Xác minh</button>
        </div>
    </form>
    <c:if test="${not empty message}">
        <p class="error-message mt-3">${message}</p>
    </c:if>
</div>
//
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>