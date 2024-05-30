<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            margin: 40px auto;
        }

        .form-container h2 {
            text-align: center;
            color: #007bff;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .form-container h3 {
            margin-bottom: 10px;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
            font-size: 22px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .form-group textarea {
            height: 100px;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            margin-top: 20px;
            display: block;
            width: 100%;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease;
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

        .address-info {
            background-color: #e9f7fe;
            border: 1px solid #bce0fd;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            text-align: center;
            color: #333;
            font-size: 16px;
            line-height: 1.6;
        }

        .address-info h3 {
            margin-top: 0;
            color: #007bff;
        }

        .address-info p {
            margin: 5px 0;
        }

        .address-info a {
            color: #007bff;
            text-decoration: none;
        }

        .address-info a:hover {
            text-decoration: underline;
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
            <input type="number" id="customerID" name="customerID" value="${customer.customerID}" readonly>
        </div>
        <div class="form-group">
            <label for="customerUsername">Customer Username:</label>
            <input type="text" id="customerUsername" name="customerUsername" value="${customer.user.username}" readonly>
        </div>
        <div class="form-group">
            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" value="${customer.user.fullName}" readonly>
        </div>
        <div class="form-group">
            <label for="customerAddress">Customer Address:</label>
            <input type="text" id="customerAddress" name="customerAddress" value="${customer.user.address}" readonly>
        </div>
        <div class="form-group">
            <label for="customerPhone">Customer Phone:</label>
            <input type="text" id="customerPhone" name="customerPhone" value="${customer.user.mobile}" readonly>
        </div>
        <div class="form-group">
            <label for="customerEmail">Customer Email:</label>
            <input type="email" id="customerEmail" name="customerEmail" value="${customer.user.email}" readonly>
        </div>
        <div class="form-group">
            <label for="customerGender">Gender:</label>
            <input type="text" id="customerGender" name="customerGender" value="${customer.user.gender}" readonly>
        </div>
        <!-- Thông tin Xe Máy -->
        <h3>Motorcycle Information</h3>
        <c:forEach var="motorcycle" items="${motorcycles}">
            <div class="form-group">
                <label for="motorcycleID">Motorcycle ID:</label>
                <input type="number" id="motorcycleID" name="motorcycleID" value="${motorcycle.motorcycleID}" readonly>
            </div>
            <div class="form-group">
                <label for="licensePlate">License Plate:</label>
                <input type="text" id="licensePlate" name="licensePlate" value="${motorcycle.licensePlate}" readonly>
            </div>
            <div class="form-group">
                <label for="brand">Brand:</label>
                <input type="text" id="brand" name="brand" value="${motorcycle.brand}" readonly>
            </div>
            <div class="form-group">
                <label for="model">Model:</label>
                <input type="text" id="model" name="model" value="${motorcycle.model}" readonly>
            </div>
            <div class="form-group">
                <label for="yearOfManufacture">Year Of Manufacture:</label>
                <input type="number" id="yearOfManufacture" name="yearOfManufacture"
                       value="${motorcycle.yearOfManufacture}"
                       readonly>
            </div>
            <div class="form-group">
                <label for="color">Color:</label>
                <input type="text" id="color" name="color" value="${motorcycle.color}" readonly>
            </div>
            <div class="form-group">
                <label for="engineNumber">Engine Number:</label>
                <input type="text" id="engineNumber" name="engineNumber" value="${motorcycle.engineNumber}" readonly>
            </div>
            <div class="form-group">
                <label for="frameNumber">Frame Number:</label>
                <input type="text" id="frameNumber" name="frameNumber" value="${motorcycle.frameNumber}" readonly>
            </div>
        </c:forEach>
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
            <label for="value">Value: (The corresponding value for the contract detail, which can be the compensation
                amount or the insurance value)</label>
            <input type="number" id="value" name="value" step="50" required>
        </div>
        <div class="form-group">
            <label for="detail">Detail: (Describe the specific details of the contract, such as insurance terms and
                conditions)</label>
            <textarea id="detail" name="detail" required></textarea>
        </div>
        <div class="form-group">
            <label for="insuranceType">Insurance Type:</label>
            <select id="insuranceType" name="insuranceType">
                <option value="Basic">Basic</option>
                <option value="Comprehensive">Comprehensive</option>
                <option value="Premium">Premium</option>
            </select>
        </div>
        <div class="form-group">
            <label for="coverage">Coverage: (Describe the insurance coverage, risks, and damages covered by the
                contract)</label>
            <input type="text" id="coverage" name="coverage" required>
        </div>
        <div class="form-group">
            <label for="premium">Premium: (The insurance fee that the customer must pay to maintain the insurance
                contract)</label>
            <input type="number" id="premium" name="premium" step="50" required>
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
            <div class="address-info">
                <h3>Application can be dropped off or mailed to:</h3>
                <p>Motorcycle Insurance Company,<br>
                    123 Hola Street,<br>
                    District Thach That, Ha Noi,<br>
                    Vietnam</p>
                <p>Phone: 0123-456-789<br>
                    <a href="http://www.motorcycleinsurance.vn">www.motorcycleinsurance.vn</a></p>
            </div>
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
