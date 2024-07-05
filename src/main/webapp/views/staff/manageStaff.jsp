<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <p style="color: black" class="lead col-md-6 header-pic">Our Car Insurance template helps you manage your coverage details, discounts, and get quotes online easily.
                        It includes features like side navigation with a smooth scroll effect for effortless navigation.
                        With this template, accessing agent assistance and other essential insurance information is simple and efficient. Drive with confidence knowing you’re well-covered.
                    </p>
                </div>
                <!-- page header pic -->
                <div class="col-md-6 header-pic"><!-- page header pic -->
                    <img src="${pageContext.request.contextPath}/img/page-head-home.jpg" alt="" class="img-responsive">
                </div>
            </div>
        </div>
    </div>

    <!-- Form Đăng Ký và FAQs -->
    <div class="row">
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
    <div class="row">
        <div class="col-md-12">
            <h2>Tính năng bảo hiểm xe</h2>
            <p>Thêm một phần mô tả về tính năng hoặc ưu điểm của các gói bảo hiểm xe mà bạn cung cấp. Điều này có thể bao gồm các tính năng như bảo vệ pháp lý, bảo hiểm va chạm, bảo vệ mất cắp, v.v.</p>
        </div>
    </div>

    <!-- Phần nhận xét từ khách hàng -->
    <div class="row">
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
<jsp:include page="/views/includes/footer.jsp" />