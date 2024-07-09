<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insurance Card</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
        }

        .main-container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .page-header {
            margin-bottom: 40px;
            text-align: center;
        }

        .page-header h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .page-header p.lead {
            font-size: 1.2rem;
            color: #555;
        }

        .header-pic img {
            max-width: 100%;
            border-radius: 10px;
        }

        .form-group input {
            border-radius: 10px;
            padding: 10px;
            font-size: 1.1rem;
        }

        .btn-primary {
            background-color: #0056b3;
            border: none;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 1.1rem;
        }

        .btn-primary:hover {
            background-color: #004494;
        }

        .faq h4 {
            font-size: 1.3rem;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .faq p {
            font-size: 1.1rem;
            color: #555;
        }

        .customer-review {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .customer-review p {
            font-size: 1.1rem;
            color: #555;
        }

        .customer-review strong {
            font-size: 1.2rem;
            color: #333;
        }
    </style>
</head>
<body>
<jsp:include page="/views/includes/header.jsp" />
<jsp:include page="/views/includes/navbar.jsp" />
<div class="main-container" id="main-container">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="tp-navbar">
                    <!-- Navbar đã được bao gồm từ navbar.jsp -->
                </div>

                <!-- page header  -->
                <div class="page-header">
                    <h1>Insurance Card </h1>
                    <p style="color: black" class="lead">Our Car Insurance template helps you manage your coverage details, discounts, and get quotes online easily.
                        It includes features like side navigation with a smooth scroll effect for effortless navigation.
                        With this template, accessing agent assistance and other essential insurance information is simple and efficient. Drive with confidence knowing you’re well-covered.
                    </p>
                </div>
                <!-- page header pic -->
                <div class="header-pic text-center"><!-- page header pic -->
                    <img src="${pageContext.request.contextPath}/img/page-head-home.jpg" alt="" class="img-responsive">
                </div>
            </div>
        </div>

        <!-- Form Đăng Ký và FAQs -->
        <div class="row mt-4">
            <!-- Form Đăng Ký -->
            <div class="col-md-6">
                <h2>Đăng ký bảo hiểm</h2>
                <form action="process_registration.jsp" method="post">
                    <!-- Các trường nhập thông tin khách hàng -->
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" placeholder="Họ và tên" required>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" placeholder="Email" required>
                    </div>
                    <div class="form-group">
                        <input type="tel" class="form-control" name="phone" placeholder="Số điện thoại" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Gửi</button>
                </form>
            </div>

            <!-- FAQs -->
            <div class="col-md-6">
                <h2>Câu hỏi thường gặp</h2>
                <div class="faq">
                    <h4>Câu hỏi 1?</h4>
                    <p>Trả lời cho câu hỏi 1.</p>
                </div>
                <div class="faq">
                    <h4>Câu hỏi 2?</h4>
                    <p>Trả lời cho câu hỏi 2.</p>
                </div>
                <!-- Thêm các câu hỏi khác nếu cần -->
            </div>
        </div>

        <!-- Phần tính năng bảo hiểm xe -->
        <div class="row mt-4">
            <div class="col-md-12">
                <h2>Tính năng bảo hiểm xe</h2>
                <p>Thêm một phần mô tả về tính năng hoặc ưu điểm của các gói bảo hiểm xe mà bạn cung cấp. Điều này có thể bao gồm các tính năng như bảo vệ pháp lý, bảo hiểm va chạm, bảo vệ mất cắp, v.v.</p>
            </div>
        </div>

        <!-- Phần nhận xét từ khách hàng -->
        <div class="row mt-4">
            <div class="col-md-12">
                <h2>Nhận xét từ khách hàng</h2>
                <div class="customer-review">
                    <p><strong>John Doe:</strong> "I've been using this insurance for years and it has provided me with peace of mind knowing that I'm well-protected on the road."</p>
                </div>
                <div class="customer-review">
                    <p><strong>Jane Smith:</strong> "The customer service is excellent and they always handle my claims quickly and efficiently. Highly recommended!"</p>
                </div>
                <!-- Thêm nhận xét khác nếu cần -->
            </div>
        </div>
    </div><!-- /.container -->
</div>
<jsp:include page="/views/includes/footer.jsp" />
</body>
</html>