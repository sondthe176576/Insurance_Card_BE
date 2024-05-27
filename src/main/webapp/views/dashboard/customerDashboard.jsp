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
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('${pageContext.request.contextPath}/views/history/paymentHistory.jsp')">Payment History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('${pageContext.request.contextPath}/views/history/accidentHistory.jsp')">Accident History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('${pageContext.request.contextPath}/views/history/punishmentHistory.jsp')">Punishment History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('${pageContext.request.contextPath}/views/history/compensationHistory.jsp')">Compensation History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('${pageContext.request.contextPath}/views/history/contractInformation.jsp')">Contract Information</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div id="content">
            <div class="customer-info">
                <h2>Customer Information</h2>
                <form id="customerInfoForm">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" value="">
                    </div>
                    <div class="form-group">
                        <label for="fullName">Full Name:</label>
                        <input type="text" class="form-control" id="fullName" value="">
                    </div>
                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" class="form-control" id="dob" value="">
                    </div>
                    <div class="form-group">
                        <div>
                            <input type="radio" id="genderMale" name="gender" value="Male">
                            <label for="genderMale">Male</label>
                            <input type="radio" id="genderFemale" name="gender" value="Female" checked>
                            <label for="genderFemale">Female</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" value="">
                    </div>
                    <div class="form-group">
                        <label for="job">Job:</label>
                        <input type="text" class="form-control" id="job" value="">
                    </div>
                    <div class="form-group">
                        <label for="company">Company:</label>
                        <input type="text" class="form-control" id="company" value="">
                    </div>
                    <button type="button" class="btn btn-primary" onclick="saveCustomerInfo()">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
    function loadPage(page) {
        console.log('Loading page:', page);
        $.ajax({
            url: page,
            type: 'GET',
            success: function(data) {
                $('#content').html(data);
            },
            error: function(xhr, status, error) {
                console.error('Failed to load page:', page, 'Status:', status, 'Error:', error);
                alert('Failed to load page: ' + page + '\nStatus: ' + status + '\nError: ' + error);
            }
        });
    }

    function saveCustomerInfo() {
        const customerInfo = {
            email: document.getElementById('email').value,
            fullName: document.getElementById('fullName').value,
            dob: document.getElementById('dob').value,
            gender: document.querySelector('input[name="gender"]:checked').value,
            address: document.getElementById('address').value,
            job: document.getElementById('job').value,
            company: document.getElementById('company').value
        };

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/saveCustomerInfo', // Replace with your server endpoint
            data: customerInfo,
            success: function(response) {
                alert('Customer information saved successfully!');
            },
            error: function(error) {
                alert('An error occurred while saving customer information.');
            }
        });
    }
</script>
</body>
</html>
