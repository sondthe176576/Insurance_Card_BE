<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Thiết lập các thông số meta cơ bản -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Waiting Contracts</title>
    <!-- Đường dẫn đến favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <!-- Bao gồm các thư viện CSS và icon -->
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    <!-- Thiết lập các biến CSS và định dạng cho trang -->
    <style>
        :root {
            --primary-color: #4f46e5;
            --secondary-color: #e5e7eb;
            --background-color: #f3f4f6;
            --text-color: #1f2937;
            --accent-color: #10b981;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        .main-content {
            margin-left: 16rem;
            padding: 2rem;
            transition: all 0.3s;
        }

        .card {
            background-color: #ffffff;
            border-radius: 1rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .search-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .form-input,
        .form-select {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid var(--secondary-color);
            border-radius: 0.375rem;
            font-size: 1rem;
            transition: all 0.3s;
        }

        .form-input:focus,
        .form-select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            font-weight: 500;
            color: #ffffff;
            background-color: var(--primary-color);
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .table-container {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .table th,
        .table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--secondary-color);
        }

        .table th {
            background-color: var(--primary-color);
            color: #ffffff;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .table tr:hover {
            background-color: #f9fafb;
        }

        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.5rem;
            font-size: 0.75rem;
            font-weight: 600;
            border-radius: 9999px;
            text-transform: uppercase;
        }

        .status-badge.waiting {
            background-color: #fef3c7;
            color: #d97706;
        }

        .action-btn {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .action-btn:hover {
            color: #4338ca;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 2rem;
        }

        .pagination-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 2.5rem;
            height: 2.5rem;
            margin: 0 0.25rem;
            border: 1px solid var(--secondary-color);
            border-radius: 0.375rem;
            font-size: 1rem;
            color: var(--text-color);
            transition: all 0.3s;
        }

        .pagination-btn:hover,
        .pagination-btn.active {
            background-color: var(--primary-color);
            color: #ffffff;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fade-in {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body>
<!-- Bao gồm header -->
<jsp:include page="/views/includes/header_list.jsp"/>
<!-- Kết thúc phần header -->

<!-- Bao gồm sidebar -->
<jsp:include page="/views/includes/sidebar.jsp"/>
<!-- Kết thúc phần sidebar -->

<!-- Nội dung chính của trang -->
<div class="main-content">
    <div class="container mx-auto animate-fade-in">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">List of Waiting Contracts</h2>
            </div>

            <!-- Form tìm kiếm hợp đồng chờ -->
            <form class="search-form" method="get" action="${pageContext.request.contextPath}/listWaitingContract">
                <div class="form-group">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" id="customerName" name="customerName" value="${param.customerName}"
                           class="form-input" placeholder="Enter customer name"/>
                </div>
                <div class="form-group">
                    <label for="startDate" class="form-label">Start Date</label>
                    <input type="date" id="startDate" name="startDate" value="${param.startDate}" class="form-input"/>
                </div>
                <div class="form-group">
                    <label for="insuranceType" class="form-label">Insurance Type</label>
                    <select id="insuranceType" name="insuranceType" class="form-select">
                        <option value="">All</option>
                        <option value="Basic" ${param.insuranceType == 'Basic' ? 'selected' : ''}>Basic</option>
                        <option value="Comprehensive" ${param.insuranceType == 'Comprehensive' ? 'selected' : ''}>
                            Comprehensive
                        </option>
                        <option value="Premium" ${param.insuranceType == 'Premium' ? 'selected' : ''}>Premium</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">&nbsp;</label>
                    <button type="submit" class="btn">
                        <i class="mdi mdi-magnify"></i> Search
                    </button>
                </div>
            </form>

            <!-- Bảng hiển thị danh sách hợp đồng chờ -->
            <div class="table-container">
                <table class="table">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Customer Name</th>
                        <th>Customer ID</th>
                        <th>Contract Info</th>
                        <th>Status</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Insurance Type</th>
                        <th>Coverage</th>
                        <th>Premium</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="contract" items="${waitingContracts}" varStatus="status">
                        <tr>
                            <td>${(currentPage - 1) * 10 + status.count}</td>
                            <td>${contract.customerName}</td>
                            <td>${contract.customerID}</td>
                            <td>${contract.contractInfo}</td>
                            <td><span class="status-badge waiting">${contract.status}</span></td>
                            <td><fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/></td>
                            <td>${contract.insuranceType}</td>
                            <td>${contract.coverage}</td>
                            <td><fmt:formatNumber value="${contract.premium}" type="currency" currencySymbol="$"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/resolveWaitingContract?contractID=${contract.contractID}"
                                   class="action-btn">
                                    <i class="mdi mdi-eye"></i> View
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Phân trang -->
            <nav class="pagination" aria-label="Page navigation">
                <c:if test="${currentPage > 1}">
                    <a href="${pageContext.request.contextPath}/listWaitingContract?page=${currentPage - 1}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}"
                       class="pagination-btn">
                        <i class="mdi mdi-chevron-left"></i>
                    </a>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:if test="${i >= currentPage - 1 && i <= currentPage + 1}">
                        <a href="${pageContext.request.contextPath}/listWaitingContract?page=${i}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}"
                           class="pagination-btn ${i == currentPage ? 'active' : ''}">
                                ${i}
                        </a>
                    </c:if>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="${pageContext.request.contextPath}/listWaitingContract?page=${currentPage + 1}&customerName=${param.customerName}&startDate=${param.startDate}&insuranceType=${param.insuranceType}"
                       class="pagination-btn">
                        <i class="mdi mdi-chevron-right"></i>
                    </a>
                </c:if>
            </nav>
        </div>
    </div>
</div>
<!-- Kết thúc nội dung chính của trang -->

<script>
    // Sử dụng SweetAlert2 để hiển thị thông báo thành công
    document.addEventListener('DOMContentLoaded', function () {
        const successMessage = "${successMessage}";
        if (successMessage) {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                timer: 3000,
                timerProgressBar: true
            });
        }

        // Thêm sự kiện cho các nút view
        document.querySelectorAll('.view-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.preventDefault();
                const contractID = btn.getAttribute('data-contract-id');
                showContractDetails(contractID);
            });
        });
    });
</script>

<!-- Bao gồm các thư viện cần thiết -->
<script src="https://cdn.jsdelivr.net/npm/xlsx/dist/xlsx.full.min.js"></script>
</body>
</html>