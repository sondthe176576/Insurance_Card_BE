<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Manage Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 1200px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .form-container h3 {
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
            font-size: 24px;
        }

        .filter-form {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .filter-form .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .filter-form label {
            margin-right: 10px;
            color: #2980b9;
            font-weight: bold;
        }

        .filter-form input, .filter-form select {
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .filter-form button {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .filter-form button:hover {
            background-color: #2980b9;
        }

        .customer-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        .customer-table th, .customer-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .customer-table th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        .customer-table tr:nth-child(even) {
            background-color: #f4f7f6;
        }

        .btn-submit, .btn-view {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }

        .btn-submit:hover, .btn-view:hover {
            background-color: #2980b9;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .pagination a {
            color: #3498db;
            padding: 10px 15px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 5px;
            border-radius: 5px;
        }

        .pagination a.active {
            background-color: #3498db;
            color: white;
            border: 1px solid #3498db;
        }

        .pagination a:hover {
            background-color: #ecf0f1;
        }

        .message {
            background-color: #dff0d8;
            color: #3c763d;
            padding: 15px;
            border: 1px solid #d6e9c6;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: bold;
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            display: none; /* Ẩn thông báo mặc định */
        }
    </style>
    <script src="https://esgoo.net/scripts/jquery.js"></script>
    <style type="text/css">
        .css_select_div{ text-align: center;}
        .css_select{ display: inline-table; width: 25%; padding: 5px; margin: 5px 2%; border: solid 1px #686868; border-radius: 5px;}
    </style>
    <script>
        function validateForm() {
            const searchType = document.getElementById("searchType").value;
            const keyword = document.getElementById("searchKeyword").value;
            if (searchType === "phone" && !/^\d+$/.test(keyword)) {
                alert("Please enter a valid phone number (digits only).");
                return false;
            }
            return true;
        }

        function deleteCustomer(e){
            if (confirm('Are you sure you want to delete this customer?')) {
                e.closest('form').submit();
            }
        }

        window.onload = function() {
            var messageElement = document.getElementById("message");
            if (messageElement) {
                messageElement.style.display = "block";
                setTimeout(function() {
                    messageElement.style.display = "none";
                }, 5000);
            }
        };

        function populateEditForm(button) {
            var tr = button.closest('tr');

            var form = document.getElementById('editCustomerForm');

            form.querySelector('input[name="userId"]').value = tr.getAttribute('data-id');
            form.querySelector('input[name="username"]').value = tr.getAttribute('data-username');
            form.querySelector('input[name="password"]').value = tr.getAttribute('data-password');
            form.querySelector('input[name="firstName"]').value = tr.getAttribute('data-firstname');
            form.querySelector('input[name="lastName"]').value = tr.getAttribute('data-lastname');
            form.querySelector('input[name="fullName"]').value = tr.getAttribute('data-fullname');
            form.querySelector('input[name="birthDate"]').value = tr.getAttribute('data-birthdate');
            form.querySelector('input[name="mobile"]').value = tr.getAttribute('data-mobile');
            form.querySelector('input[name="email"]').value = tr.getAttribute('data-email');
            form.querySelector('select[name="gender"]').value = tr.getAttribute('data-gender');

            // Set hidden fields for address
            form.querySelector('input[name="hidden_tinh"]').value = tr.getAttribute('data-province');
            form.querySelector('input[name="hidden_quan"]').value = tr.getAttribute('data-district');
            form.querySelector('input[name="hidden_phuong"]').value = tr.getAttribute('data-country');

            // Load the provinces, districts, and wards if not already loaded
            loadProvinces().then(() => {
                $("#tinh").val(tr.getAttribute('data-province')).trigger('change');
            });

            // Show the form
            form.style.display = 'block';
        }

        // Function to load provinces
        function loadProvinces() {
            return $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
                if (data_tinh.error == 0) {
                    $.each(data_tinh.data, function (key_tinh, val_tinh) {
                        $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                    });
                }
            });
        }
    </script>
    <script>
        $(document).ready(function () {
            // Fetch provinces
            $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
                if (data_tinh.error == 0) {
                    $.each(data_tinh.data, function (key_tinh, val_tinh) {
                        $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                    });
                    $("#tinh").change(function (e) {
                        var idtinh = $(this).val();
                        $("#hidden_tinh").val($("#tinh option:selected").text());
                        // Fetch districts
                        $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                            if (data_quan.error == 0) {
                                $("#quan").html('<option value="0">Quận Huyện</option>');
                                $("#phuong").html('<option value="0">Phường Xã</option>');
                                $.each(data_quan.data, function (key_quan, val_quan) {
                                    $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                                });
                                // Fetch wards
                                $("#quan").change(function (e) {
                                    var idquan = $(this).val();
                                    $("#hidden_quan").val($("#quan option:selected").text());
                                    $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                        if (data_phuong.error == 0) {
                                            $("#phuong").html('<option value="0">Phường Xã</option>');
                                            $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                                $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                                            });
                                            $("#phuong").change(function (e) {
                                                $("#hidden_phuong").val($("#phuong option:selected").text());
                                            });
                                        }
                                    });
                                });
                            }
                        });
                    });
                }
            });
        });
    </script>
</head>
<body>
<!-- Include header -->
<jsp:include page="/views/includes/header.jsp"/>
<!-- End of header -->
<!-- Include navbar -->
<jsp:include page="/views/includes/navbar.jsp"/>
<!-- End of navbar -->

<!-- Form -->
<div class="form-container">
    <h2>Customer Management</h2>
    <h3>List of Customers</h3>

    <!-- Hiển thị thông báo nếu có -->
    <c:if test="${not empty message}">
        <div class="message" id="message">
                ${message}
        </div>
    </c:if>

    <form method="get" class="filter-form" action="${pageContext.request.contextPath}/customer-manage" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="searchType">Search by:</label>
            <select id="searchType" name="searchType">
                <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>Name</option>
                <option value="email" ${param.searchType == 'email' ? 'selected' : ''}>Email</option>
                <option value="phone" ${param.searchType == 'phone' ? 'selected' : ''}>Phone</option>
            </select>
            <input type="text" id="searchKeyword" name="keyword" value="${param.keyword}" placeholder="Enter search keyword"/>
        </div>
        <div class="form-group">
            <label for="genderFilter">Gender:</label>
            <select id="genderFilter" name="genderFilter">
                <option value="" ${param.genderFilter == '' ? 'selected' : ''}>All</option>
                <option value="Male" ${param.genderFilter == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${param.genderFilter == 'Female' ? 'selected' : ''}>Female</option>
            </select>
        </div>
        <button type="submit" class="btn-submit">Filter</button>
    </form>
    <!-- Form riêng để tìm kiếm theo địa chỉ -->
    <form method="get" class="filter-form" action="${pageContext.request.contextPath}/customer-manage">
        <div class="form-group">
            <label for="hidden_tinh">Search by Address:</label>
            <div class="css_select_div">
                <select class="css_select" id="tinh" name="tinh" title="Chọn Tỉnh Thành">
                    <option value="0">Tỉnh Thành</option>
                </select>
                <select class="css_select" id="quan" name="quan" title="Chọn Quận Huyện">
                    <option value="0">Quận Huyện</option>
                </select>
                <select class="css_select" id="phuong" name="phuong" title="Chọn Phường Xã">
                    <option value="0">Phường Xã</option>
                </select>
            </div>
            <input type="hidden" name="hidden_tinh" id="hidden_tinh">
            <input type="hidden" name="hidden_quan" id="hidden_quan">
            <input type="hidden" name="hidden_phuong" id="hidden_phuong">
        </div>
        <button type="submit" class="btn-submit">Search by Address</button>
    </form>

    <button class="btn-submit" onclick="window.location.href='${pageContext.request.contextPath}/customer-create'">Create Customer</button>
    <table class="customer-table">
        <thead>
        <tr>
            <th>No</th>
            <th style="display: none">Username</th>
            <th style="display: none">Password</th>
            <th>Full Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Adress</th>
            <th >Gender</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.listCustomer}" var="c" varStatus="status">
            <tr data-id="${c.userId}" data-username="${c.userName}" data-password="${c.password}"
                data-fullname="${c.fullName}" data-mobile="${c.mobile}" data-email="${c.email}"
                data-gender="${c.gender}" data-birthdate="<fmt:formatDate value='${c.birthDate}' pattern='yyyy-MM-dd'/>"
                data-province="${c.province}" data-district="${c.district}" data-country="${c.country}">
                <td>${status.index + 1}</td>
                <td name="username" style="display: none">${c.userName}</td>
                <td name="password" style="display: none">${c.password}</td>
                <td name="fullName">${c.fullName}</td>
                <td name="mobile">${c.mobile}</td>
                <td name="email">${c.email}</td>
                <td name="address">${c.province}, ${c.district}, ${c.country}</td>
                <td name="gender" >${c.gender}</td>
                <td>
                    <div class="button-container">
                        <a href="${pageContext.request.contextPath}/customer-view?userID=${c.userId}" class="btn btn-info">View</a>
                        <a href="${pageContext.request.contextPath}/customer-edit?userID=${c.userId}" class="btn btn-warning">Edit</a>
                        <form action="${pageContext.request.contextPath}/customer-delete" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${c.userId}" />
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <c:forEach var="i" begin="1" end="${sessionScope.totalPages}">
            <c:choose>
                <c:when test="${i == sessionScope.currentPage}">
                    <a href="${pageContext.request.contextPath}/customer-manage?page=${i}&searchType=${param.searchType}&keyword=${param.keyword}&genderFilter=${param.genderFilter}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/customer-manage?page=${i}&searchType=${param.searchType}&keyword=${param.keyword}&genderFilter=${param.genderFilter}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>

    <div>
        <p>Total customers found: ${sessionScope.totalCustomersFound}</p>
        <p>Total customers in database: ${sessionScope.totalCustomers}</p>
    </div>
</div>
<!-- End of form -->
<!-- Include footer -->
<jsp:include page="/views/includes/footer.jsp"/>
<!-- End of footer -->

</body>

</html>
