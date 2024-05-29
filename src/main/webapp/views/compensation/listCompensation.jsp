<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/28/2024
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Compensation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .back-button {
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #6c757d;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .toolbar input, .toolbar select {
            padding: 10px;
            font-size: 16px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            flex: 1;
            margin-right: 10px;
        }

        .toolbar input {
            flex: 2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .details-button {
            padding: 8px 12px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .details-button:hover {
            background-color: #0056b3;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            padding: 10px 15px;
            margin: 0 5px;
            border: 1px solid #ddd;
            background-color: #fff;
            text-decoration: none;
            color: #007bff;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #f1f1f1;
        }

        .pagination .active {
            font-weight: bold;
            background-color: #007bff;
            color: #fff;
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
<div class="container">
    <button class="back-button" onclick="window.history.back();">Quay lại</button>
    <h1>Danh Sách Yêu Cầu Bồi Thường</h1>
    <div class="toolbar">
        <input type="text" placeholder="Tìm kiếm..." id="search">
        <select id="filter">
            <option value="">Lọc</option>
            <option value="pending">Đang chờ xử lý</option>
            <option value="approved">Đã duyệt</option>
            <option value="rejected">Đã từ chối</option>
        </select>
        <select id="sort">
            <option value="">Sắp xếp</option>
            <option value="date">Ngày yêu cầu</option>
            <option value="customer">Tên khách hàng</option>
            <option value="amount">Số tiền yêu cầu</option>
            <option value="status">Trạng thái</option>
        </select>
    </div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên Khách Hàng</th>
            <th>ID Hợp Đồng</th>
            <th>Ngày Yêu Cầu</th>
            <th>Số Tiền Yêu Cầu</th>
            <th>Trạng Thái</th>
            <th>Chi Tiết</th>
        </tr>
        </thead>
        <tbody>
        <!-- Các dòng dữ liệu sẽ được sinh bởi mã phía server -->
        <tr>
            <td>1</td>
            <td>John Doe</td>
            <td>1001</td>
            <td>2023-05-01</td>
            <td>5,000,000 VND</td>
            <td>Đang chờ xử lý</td>
            <td>
                <button class="details-button">Xem</button>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>Jane Smith</td>
            <td>1002</td>
            <td>2023-04-15</td>
            <td>2,000,000 VND</td>
            <td>Đã duyệt</td>
            <td>
                <button class="details-button">Xem</button>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="pagination">
        <!-- Các nút phân trang sẽ được sinh bởi mã phía server -->
        <a href="?page=1" class="active">1</a>
        <a href="?page=2">2</a>
        <a href="?page=3">3</a>
        <!-- ... -->
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->
</body>
</html>
