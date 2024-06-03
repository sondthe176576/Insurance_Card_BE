<!DOCTYPE html>
<jsp:include page="/views/includes/header.jsp"/>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .info-container {
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 1200px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .info-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .info-section > div {
            width: 48%;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            border-radius: 5px;
        }
        .info-section h2 {
            font-size: 24px;
            color: #004080;
            margin-bottom: 20px;
        }
        .info-section .form-group {
            margin-bottom: 15px;
        }
        .save-button {
            text-align: center;
        }
        .save-button button {
            width: 200px;
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="nav flex-column">
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('/views/history/paymentHistory.jsp')">Payment History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('/views/history/accidentHistory.jsp')">Accident History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('/views/history/punishmentHistory.jsp')">Punishment History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('/views/history/compensationHistory.jsp')">Compensation History</a>
            <a class="nav-link" href="javascript:void(0);" onclick="loadPage('/views/history/contractInformation.jsp')">Contract Information</a>
        </div>
    </div>

    <!-- Main Content --->
    <div class="main-content">
        <!-- Info Container -->
        <div class="info-container">
            <form id="customerInfoForm" method="post">
                <div class="info-section">
                    <!-- Personal Information -->
                    <div class="AccidentHistory-info">
                        <h2>Personal Information</h2>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="">
                        </div>
                        <div class="form-group">
                            <label for="fullName">Full Name:</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" value="">
                        </div>
                        <div class="form-group">
                            <label for="dob">Date of Birth:</label>
                            <input type="date" class="form-control" id="dob" name="dob" value="">
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
                            <input type="text" class="form-control" id="address" name="address" value="">
                        </div>

                    </div>

                    <!-- Insurance Card Information -->
                    <div class="insurance-card-info">
                        <h2>Insurance Card Information</h2>
                        <div class="form-group">
                            <label for="cardNumber">Card Number:</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" value="">
                        </div>
                        <div class="form-group">
                            <label for="issueDate">Issue Date:</label>
                            <input type="date" class="form-control" id="issueDate" name="issueDate" value="">
                        </div>
                        <div class="form-group">
                            <label for="expiryDate">Expiry Date:</label>
                            <input type="date" class="form-control" id="expiryDate" name="expiryDate" value="">
                        </div>
                    </div>
                </div>

                <div class="save-button">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
            <!-- Display saved information -->
            <div id="savedInfo" style="margin-top: 20px;"></div>
        </div>

        <div id="content">
            <!-- Dynamic content will be loaded here -->
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

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

    // Handle form submission via AJAX
    $('#customerInfoForm').on('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission

        $.ajax({
            url: '${pageContext.request.contextPath}/saveCustomerInfo',
            type: 'POST',
            data: $(this).serialize(), // Serialize form data
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            success: function(response) {
                if (response.status === 'success') {
                    // Display the saved information
                    $('#savedInfo').html(`
                        <h2>Saved Information</h2>
                        <p>Email: ${response.data.email}</p>
                        <p>Full Name: ${response.data.fullName}</p>
                        <p>Date of Birth: ${response.data.dob}</p>
                        <p>Gender: ${response.data.gender}</p>
                        <p>Address: ${response.data.address}</p>
                        <p>Job: ${response.data.job}</p>
                        <p>Company: ${response.data.company}</p>
                        <p>Card Number: ${response.data.cardNumber}</p>
                        <p>Issue Date: ${response.data.issueDate}</p>
                        <p>Expiry Date: ${response.data.expiryDate}</p>
                    `);
                } else {
                    alert('Failed to save AccidentHistory information.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error saving AccidentHistory information:', status, error);
                alert('Error saving AccidentHistory information: ' + error);
            }
        });
    });
</script>
</body>
</html>