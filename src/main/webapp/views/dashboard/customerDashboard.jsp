<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Customer Dashboard</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        .dashboard-container {
            display: flex;
            height: 100vh;
        }
        .sidebar {
            background-color: #f7f7f7;
            width: 250px;
            padding: 20px;
        }
        .sidebar .nav-item {
            margin: 10px 0;
        }
        .sidebar .nav-link {
            display: block;
            padding: 10px 15px;
            color: #004080;
            font-weight: bold;
            text-transform: capitalize;
            background-color: #e0e0e0;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 10px;
        }
        .sidebar .nav-link:hover {
            background-color: #ff8000;
            color: #fff;
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        .customer-info {
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            border-radius: 5px;
        }
        .customer-info h2 {
            font-size: 24px;
            color: #004080;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="nav flex-column">
            <a class="nav-link" href="#">Payment History</a>
            <a class="nav-link" href="#">Accident History</a>
            <a class="nav-link" href="#">Punishment History</a>
            <a class="nav-link" href="#">Compensation History</a>
            <a class="nav-link" href="#">Contract Information</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="customer-info">
            <h2>Customer Information</h2>
            <form>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" value="nguyenthihong@gmail.com" disabled>
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" class="form-control" id="fullName" value="Nguyễn Thị Hồng" disabled>
                </div>
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" class="form-control" id="dob" value="1977-12-13" disabled>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <div>
                        <input type="radio" id="genderMale" name="gender" value="Male" disabled>
                        <label for="genderMale">Male</label>
                        <input type="radio" id="genderFemale" name="gender" value="Female" checked disabled>
                        <label for="genderFemale">Female</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" value="123 Main St, Hanoi" disabled>
                </div>
                <div class="form-group">
                    <label for="job">Job:</label>
                    <input type="text" class="form-control" id="job" value="Software Developer" disabled>
                </div>
                <div class="form-group">
                    <label for="company">Company:</label>
                    <input type="text" class="form-control" id="company" value="Tech Solutions" disabled>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
