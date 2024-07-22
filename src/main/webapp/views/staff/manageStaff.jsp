<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insurance Card</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
        }

        .main-container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .header-pic img {
            max-width: 100%;
            border-radius: 10px;
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
<body class="bg-gray-100">
<jsp:include page="/views/includes/header_logout.jsp" />
<jsp:include page="/views/includes/navbar.jsp" />
<div class="main-container" id="main-container">
    <div class="container mx-auto">
        <div class="row">
            <div class="col-md-12">
                <div class="tp-navbar">
                    <!-- Navbar đã được bao gồm từ navbar.jsp -->
                </div>

                <!-- page header  -->
                <div class="text-center my-10">
                    <h1 class="text-4xl font-bold">Insurance Card</h1>
                    <p class="text-lg text-gray-600 mt-4">Our Car Insurance template helps you manage your coverage details, discounts, and get quotes online easily.
                        It includes features like side navigation with a smooth scroll effect for effortless navigation.
                        With this template, accessing agent assistance and other essential insurance information is simple and efficient. Drive with confidence knowing you’re well-covered.
                    </p>
                </div>
                <!-- page header pic -->
                <div class="header-pic text-center mb-10">
                    <img src="${pageContext.request.contextPath}/img/page-head-home.jpg" alt="" class="img-responsive rounded-lg shadow-md">
                </div>
            </div>
        </div>

        <!-- Form Đăng Ký và FAQs -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-4">
            <!-- Form Đăng Ký -->
            <div>
                <h2 class="text-3xl font-semibold mb-6">Đăng ký bảo hiểm</h2>
                <form action="process_registration.jsp" method="post">
                    <!-- Các trường nhập thông tin khách hàng -->
                    <div class="mb-4">
                        <input type="text" class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" name="name" placeholder="Họ và tên" required>
                    </div>
                    <div class="mb-4">
                        <input type="email" class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" name="email" placeholder="Email" required>
                    </div>
                    <div class="mb-4">
                        <input type="tel" class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" name="phone" placeholder="Số điện thoại" required>
                    </div>
                    <button type="submit" class="btn btn-primary bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600">Gửi</button>
                </form>
            </div>

            <!-- FAQs -->
            <div>
                <h2 class="text-3xl font-semibold mb-6">Câu hỏi thường gặp</h2>
                <div class="faq">
                    <h4 class="text-xl font-medium mb-2">Câu hỏi 1?</h4>
                    <p class="text-gray-600">Trả lời cho câu hỏi 1.</p>
                </div>
                <div class="faq mt-4">
                    <h4 class="text-xl font-medium mb-2">Câu hỏi 2?</h4>
                    <p class="text-gray-600">Trả lời cho câu hỏi 2.</p>
                </div>
                <!-- Thêm các câu hỏi khác nếu cần -->
            </div>
        </div>

        <!-- Phần tính năng bảo hiểm xe -->
        <div class="mt-10">
            <h2 class="text-3xl font-semibold mb-6">Tính năng bảo hiểm xe</h2>
            <p class="text-gray-600">Thêm một phần mô tả về tính năng hoặc ưu điểm của các gói bảo hiểm xe mà bạn cung cấp. Điều này có thể bao gồm các tính năng như bảo vệ pháp lý, bảo hiểm va chạm, bảo vệ mất cắp, v.v.</p>
        </div>

        <!-- Phần nhận xét từ khách hàng -->
        <div class="mt-10">
            <h2 class="text-3xl font-semibold mb-6">Nhận xét từ khách hàng</h2>
            <div class="customer-review mb-4">
                <p><strong class="text-xl font-medium">John Doe:</strong> "I've been using this insurance for years and it has provided me with peace of mind knowing that I'm well-protected on the road."</p>
            </div>
            <div class="customer-review mb-4">
                <p><strong class="text-xl font-medium">Jane Smith:</strong> "The customer service is excellent and they always handle my claims quickly and efficiently. Highly recommended!"</p>
            </div>
            <!-- Thêm nhận xét khác nếu cần -->
        </div>
    </div><!-- /.container -->
</div>
<jsp:include page="/views/includes/footer.jsp" />
</body>
</html>