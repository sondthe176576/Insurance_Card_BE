<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2024
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Contract</title>
    <style>
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 50px;
        }

        .form-container h2 {
            text-align: center;
            color: #007bff;
            font-size: 24px;
            margin-bottom: 20px;
            position: relative;
        }

        .form-container h3 {
            margin-bottom: 10px;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group textarea {
            height: 100px;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .membership-info {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 4px;
            margin-top: 20px;
        }

        .membership-info p {
            margin: 10px 0;
            color: #333;
        }

        .membership-info strong {
            color: #007bff;
        }
    </style>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->
<!-- Link image slider -->
<img src="${pageContext.request.contextPath}/img/slider.jpg" alt="Slider Image">
<!-- End of image slider -->
<!-- Form -->
<div class="form-container">
    <form action="${pageContext.request.contextPath}/createContract" method="post">
        <h2>Create New Contract</h2>
        <!-- Thông tin Khách Hàng -->
        <h3>Customer Information</h3>
        <div class="form-group">
            <label for="customerID">Customer ID:</label>
            <input type="number" id="customerID" name="customerID" value="${param.customerID}" min="1" required
                   readonly>
        </div>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="${customer.user.fullName}" required readonly>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${customer.user.email}" required readonly>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" value="${customer.user.mobile}" required readonly>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${customer.user.address}" required readonly>
        </div>
        <!-- Thông tin Bảo Hiểm -->
        <h3>Insurance Information</h3>
        <div class="form-group">
            <label for="contractInfo">Contract Info:</label>
            <input type="text" id="contractInfo" name="contractInfo" required>
        </div>
        <div class="form-group">
            <label for="status">Status:</label>
            <input type="text" id="status" name="status" required>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" required>
        </div>
        <div class="form-group">
            <label for="value">Value:</label>
            <input type="number" id="value" name="value" step="0.01" required>
        </div>
        <div class="membership-info">
            <p><strong>Basic Motorcycle Insurance</strong> – This option provides the fundamental coverage for your
                motorcycle. After completing your contact information and selecting your insurance package, please
                submit the form to the Insurance Advisor at the address below. You will receive an invitation to
                attend an information session. We aim to provide you with as much information as possible about our
                insurance policies. At the end of the session, you may complete the application for insurance and
                pay the $100 insurance fee.</p>

            <p><strong>Comprehensive Motorcycle Insurance</strong> – This package offers complete protection for
                your motorcycle, including accident and theft insurance. Additionally, you will receive monthly
                newsletters with updates on your insurance coverage. The insurance fee is $150 per year.
                Comprehensive insurance not only covers basic liabilities but also includes coverage for damage
                caused by natural disasters, fire, and vandalism. This ensures that you have peace of mind in any
                situation.</p>

            <p><strong>Premium Motorcycle Insurance</strong> – Our premium package provides the highest level of
                coverage. This includes all the benefits of comprehensive insurance, plus additional features such
                as roadside assistance, rental reimbursement, and coverage for custom parts and equipment. The
                premium insurance fee is $250 per year. With this package, you are guaranteed the best support and
                quickest response in case of any incident. Our premium plan also includes a personal advisor who
                will assist you with all your insurance needs.</p>

            <div class="membership-info">
                <p>Choosing the right insurance package ensures that your motorcycle is well-protected and that you
                    receive the support you need in case of any accidents or incidents. Our team is dedicated to
                    helping you understand the different options and choose the one that best suits your needs.</p>
            </div>

            <h3>Application can be dropped off or mailed to:</h3>
            <p>
                Motorcycle Insurance Company,<br>
                123 Nguyen Hue Street,<br>
                District 1, Ho Chi Minh City,<br>
                Vietnam
            </p>
            <p>
                Phone: 0123-456-789<br>
                www.motorcycleinsurance.vn
            </p>
        </div>
        <button type="submit" class="btn-submit">Create Contract</button>
    </form>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>
