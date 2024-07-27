<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        request.getRequestDispatcher("/views/homepage/home.jsp").forward(request, response);
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compensation History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #004080;
            padding-top: 20px;
            transition: width 0.3s;
            z-index: 1000;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s;
            height: calc(100vh - 70px);
            overflow-y: auto;
        }
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 1200px;
            margin-top: 30px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #0056b3;
            color: white;
            border-radius: 15px 15px 0 0 !important;
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead {
            background-color: #f1f3f5;
        }
        .btn-primary {
            background-color: #0056b3;
            border: none;
        }
        .btn-info {
            background-color: #17a2b8;
            border: none;
            color: white;
        }
        .pagination {
            justify-content: center;
        }
    </style>

</head>
<body>
<div class="sidebar">
    <!-- Paste the sidebar content from the first file here -->
    <div class="sidebar-header">
        <i class="fas fa-bars"></i> Menu
    </div>
    <a href="${pageContext.request.contextPath}/homepageforstaff" class="${page == 'homepageforstaff' ? 'active' : ''}">
        <i class="fas fa-home"></i> Home
    </a>
    <!-- ... (include all other sidebar links) ... -->
    <jsp:include page="/views/includes/sidebar.jsp"/>
</div>
<div class="main-content">
    <div class="card">
        <div class="card-header">
            <h2 class="mb-0">Compensation History</h2>
        </div>
        <div class="card-body">
            <form method="get" action="${pageContext.request.contextPath}/listCompensationHistory" class="mb-4">
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                        <input type="text" name="customerName" value="${param.customerName}" class="form-control" placeholder="Customer Name">
                    </div>
                    <div class="col-auto">
                        <select name="sortOrder" class="form-select">
                            <option value="ASC" <c:if test="${param.sortOrder == 'ASC'}">selected</c:if>>Date Ascending</option>
                            <option value="DESC" <c:if test="${param.sortOrder == 'DESC'}">selected</c:if>>Date Descending</option>
                        </select>
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-search"></i> Filter & Sort
                        </button>
                    </div>
                </div>
            </form>

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Compensation ID</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Full Name</th>
                        <th>Contract ID</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="history" items="${histories}">
                        <tr>
                            <td>${history.customerID}</td>
                            <td>${history.compensationID}</td>
                            <td>$${history.amount}</td>
                            <td>${history.date}</td>
                            <td>
                                <span class="badge bg-${history.status == 'Approved' ? 'success' : (history.status == 'Pending' ? 'warning' : 'danger')}">
                                        ${history.status}
                                </span>
                            </td>
                            <td>${history.fullName}</td>
                            <td>${history.contractID}</td>
                            <td>
                                <form method="get" action="${pageContext.request.contextPath}/viewCompensationRequest">
                                    <input type="hidden" name="compensationID" value="${history.compensationID}">
                                    <button type="submit" class="btn btn-info btn-sm">
                                        <i class="bi bi-eye"></i> View
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:forEach var="i" begin="1" end="${noOfPages}">
                        <li class="page-item <c:if test='${i == currentPage}'>active</c:if>">
                            <a class="page-link" href="${pageContext.request.contextPath}/listCompensationHistory?page=${i}&customerName=${param.customerName}&sortOrder=${param.sortOrder}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
