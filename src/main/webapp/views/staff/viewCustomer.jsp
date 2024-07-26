<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --background-color: #f8f9fa;
            --text-color: #333;
            --light-text-color: #6c757d;
            --border-radius: 12px;
            --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .main-container {
            width: 100%;
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
            box-sizing: border-box;
        }

        .detail-container {
            background-color: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 2rem;
            position: relative;
        }

        h2 {
            color: var(--secondary-color);
            font-size: clamp(1.5rem, 3vw, 1.75rem);
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 600;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            margin-bottom: 1rem;
        }

        .detail-item label {
            font-weight: 500;
            color: var(--light-text-color);
            margin-bottom: 0.25rem;
            font-size: clamp(0.875rem, 1.5vw, 1rem);
            display: flex;
            align-items: center;
        }

        .detail-item label i {
            margin-right: 0.5rem;
            color: var(--primary-color);
            font-size: clamp(1rem, 1.5vw, 1.25rem);
        }

        .detail-item span {
            color: var(--text-color);
            font-size: clamp(0.9rem, 1.5vw, 1.1rem);
            font-weight: 500;
            margin-left: 1.75rem;
            word-break: break-word;
        }

        .btn-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 2rem;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .btn {
            background-color: var(--primary-color);
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: clamp(0.875rem, 1.5vw, 1rem);
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 120px;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .btn-secondary {
            background-color: var(--light-text-color);
        }

        @media (max-width: 768px) {
            .main-container {
                padding: 0 0.5rem;
            }

            .detail-container {
                padding: 1.5rem;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

            .btn-container {
                justify-content: center;
            }

            .btn {
                width: 100%;
            }
        }

        @media (min-width: 1200px) {
            .details-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }
    </style>
</head>
<body>
<jsp:include page="/views/includes/header_logout.jsp" />

<div class="main-container">
    <div class="detail-container">
        <h2><i class="fas fa-user-circle"></i> Customer Information</h2>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <div class="details-grid">
            <div class="detail-item">
                <label><i class="fas fa-user"></i> Username</label>
                <span>${customer.username}</span>
            </div>
            <div class="detail-item">
                <label><i class="fas fa-envelope"></i> Email</label>
                <span>${customer.email}</span>
            </div>
            <div class="detail-item">
                <label><i class="fas fa-phone"></i> Mobile</label>
                <span>${customer.mobile}</span>
            </div>
            <div class="detail-item">
                <label><i class="fas fa-map-marker-alt"></i> Address</label>
                <span>${customer.district}, ${customer.province}, ${customer.country}</span>
            </div>
            <div class="detail-item">
                <label><i class="fas fa-id-card"></i> Full Name</label>
                <span>${customer.fullName}</span>
            </div>
            <div class="detail-item">
                <label><i class="fas fa-birthday-cake"></i> Birth Date</label>
                <span><fmt:formatDate value="${customer.birthDate}" pattern="dd MMMM yyyy" /></span>
            </div>
            <div class="detail-item">
                <label><i class="fas fa-venus-mars"></i> Gender</label>
                <span>${customer.gender}</span>
            </div>
        </div>
        <div class="btn-container">
            <a href="${pageContext.request.contextPath}/customer-manage" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back
            </a>
            <a href="${pageContext.request.contextPath}/customer-edit?userID=${customer.userID}" class="btn">
                <i class="fas fa-edit"></i> Update
            </a>
        </div>
    </div>
</div>

<jsp:include page="/views/includes/footer.jsp" />
</body>
</html>