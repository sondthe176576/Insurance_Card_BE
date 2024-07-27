<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Customer Management</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
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

        .sidebar:hover {
            width: 300px;
        }

        .sidebar a {
            padding: 15px;
            text-decoration: none;
            font-size: 1.2rem;
            color: #ffffff;
            display: block;
            transition: background-color 0.3s, padding-left 0.3s;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #0056b3;
            padding-left: 30px;
        }

        .sidebar a.active {
            background-color: #007bff;
            font-weight: bold;
        }

        .sidebar i {
            margin-right: 10px;
        }

        .sidebar .sidebar-header {
            padding: 15px;
            text-align: center;
            font-size: 1.5rem;
            color: #ffffff;
            border-bottom: 1px solid #0056b3;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s;
            min-height: calc(100vh - 70px);
        }

        .sidebar:hover ~ .main-content {
            margin-left: 300px;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .table th {
            background-color: #004080;
            color: white;
            padding: 15px;
            text-align: left;
        }

        .table td {
            background-color: #ffffff;
            padding: 15px;
        }

        .table-hover tbody tr:hover {
            transform: scale(1.02);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background-color: #004080;
            border: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .btn-group .btn {
            padding: 5px 10px;
            margin-right: 5px;
        }

        .form-control, .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #004080;
            box-shadow: 0 0 0 2px rgba(0,64,128,0.2);
        }

        .pagination {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }

        .pagination a {
            color: #004080;
            text-decoration: none;
            padding: 10px 15px;
            border: 1px solid #ddd;
            margin: 0 5px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .pagination a:hover, .pagination a.active {
            background-color: #004080;
            color: white;
        }

        .modal-success .modal-content {
            background-color: #28a745;
            color: white;
        }

        .modal-success .modal-header {
            border-bottom: none;
        }

        .modal-success .close {
            color: white;
        }

        .modal-success .modal-body {
            padding: 2rem;
            text-align: center;
        }

        .modal-success i {
            font-size: 5rem;
            margin-bottom: 1rem;
        }

        .modal-success h4 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .modal-success p {
            font-size: 1.1rem;
        }

        .table {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .table th {
            background-color: #004080;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }

        .table td {
            vertical-align: middle;
        }

        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
            transform: scale(1.02);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .btn-group .btn {
            margin-right: 5px;
            transition: all 0.3s ease;
        }

        .btn-group .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .pagination .page-item.active .page-link {
            background-color: #004080;
            border-color: #004080;
        }

        .pagination .page-link {
            color: #004080;
        }

        .pagination .page-link:hover {
            background-color: #e9ecef;
        }
    </style>
    <jsp:include page="/views/includes/header_list.jsp"/>
</head>
<body class="bg-light">
<div class="sidebar">
    <div class="sidebar-header">
        <i class="fas fa-bars"></i> Menu
    </div>
    <a href="${pageContext.request.contextPath}/homepageforstaff" class="${page == 'homepageforstaff' ? 'active' : ''}">
        <i class="fas fa-home"></i> Home
    </a>
    <jsp:include page="/views/includes/sidebar.jsp"/>
</div>

<div class="main-content">
    <div class="container">
        <h2 class="text-center my-4">Customer Management</h2>

        <!-- Success Modal -->
        <div class="modal fade animate__animated animate__fadeInDown" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-success" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <i class="fas fa-check-circle"></i>
                        <h4>Success!</h4>
                        <p><c:out value="${sessionScope.message}" /></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Search and Filter Form -->
        <div class="bg-white p-4 rounded shadow-sm mb-4">
            <form method="get" action="${pageContext.request.contextPath}/customer-manage" class="form-inline">
                <div class="form-group mr-2 mb-2">
                    <label for="searchType" class="mr-2">Search by:</label>
                    <select id="searchType" name="searchType" class="form-control">
                        <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>Name</option>
                        <option value="email" ${param.searchType == 'email' ? 'selected' : ''}>Email</option>
                        <option value="phone" ${param.searchType == 'phone' ? 'selected' : ''}>Phone</option>
                    </select>
                </div>
                <div class="form-group mr-2 mb-2">
                    <label for="searchKeyword" class="mr-2">Keyword:</label>
                    <input type="text" id="searchKeyword" name="keyword" value="${param.keyword}" placeholder="Enter search keyword" class="form-control"/>
                </div>
                <div class="form-group mr-2 mb-2">
                    <label for="genderFilter" class="mr-2">Gender:</label>
                    <select id="genderFilter" name="genderFilter" class="form-control">
                        <option value="" ${param.genderFilter == '' ? 'selected' : ''}>All</option>
                        <option value="Male" ${param.genderFilter == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${param.genderFilter == 'Female' ? 'selected' : ''}>Female</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary mb-2"><i class="fas fa-search mr-2"></i>Filter</button>
            </form>
        </div>

        <!-- Actions and Customer List -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <button class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath}/customer-create'">
                <i class="fas fa-plus-circle mr-2"></i>Create Customer
            </button>
            <div>
                <p class="text-muted mb-0">Total customers found: ${sessionScope.totalCustomersFound}</p>
                <p class="text-muted">Total customers in database: ${sessionScope.totalCustomers}</p>
            </div>
        </div>

        <!-- Customer Table -->
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="thead-dark">
                <tr>
                    <th>No</th>
                    <th>Full Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Gender</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.listCustomer}" var="c" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${c.fullName}</td>
                        <td>${c.mobile}</td>
                        <td>${c.email}</td>
                        <td>${c.province}, ${c.district}, ${c.country}</td>
                        <td>${c.gender}</td>
                        <td>
                            <div class="btn-group" role="group">
                                <a href="${pageContext.request.contextPath}/customer-view?userID=${c.userID}" class="btn btn-info"><i class="fas fa-eye"></i></a>

                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <c:forEach var="i" begin="1" end="${sessionScope.totalPages}">
                    <c:choose>
                        <c:when test="${i == sessionScope.currentPage}">
                            <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/customer-manage?page=${i}&searchType=${param.searchType}&keyword=${param.keyword}&genderFilter=${param.genderFilter}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        // Check if there's a success message to display
        <c:if test="${not empty sessionScope.message}">
        $('#successModal').modal('show');
        // Remove the message from the session after displaying it
        <c:remove var="message" scope="session"/>
        </c:if>

        // Auto-hide the modal after 3 seconds
        $('#successModal').on('shown.bs.modal', function() {
            setTimeout(function() {
                $('#successModal').modal('hide');
            }, 3000);
        });

        // Add animation when hiding the modal
        $('#successModal').on('hide.bs.modal', function() {
            $(this).removeClass('animate__fadeInDown').addClass('animate__fadeOutUp');
        });

        // Reset animation classes when the modal is hidden
        $('#successModal').on('hidden.bs.modal', function() {
            $(this).removeClass('animate__fadeOutUp').addClass('animate__fadeInDown');
        });
    });

    function confirmDelete() {
        return confirm("Are you sure you want to delete this customer?");
    }
</script>
</body>
</html>
