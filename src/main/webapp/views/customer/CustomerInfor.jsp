<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%@ page import="org.example.insurance_card_be.model.Customers" %>
<%@ page import="org.example.insurance_card_be.model.Motorcycle" %>

<%
    // Lấy thông tin người dùng từ session (giả sử bạn đã set session từ trước)
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        // Xử lý khi không có thông tin người dùng trong session
        response.sendRedirect("login"); // Chuyển hướng đến trang login nếu không có thông tin người dùng
        return;
    }

    // Kết nối và lấy thông tin người dùng từ cơ sở dữ liệu
    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        // Xử lý khi không lấy được thông tin người dùng từ cơ sở dữ liệu
        return;
    }

    Customers customerFromDB = (Customers) request.getAttribute("customer");
    Motorcycle motorcycleFromDB = (Motorcycle) request.getAttribute("motorcycle");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
        }
        .profile-button {
            background: #4A90E2;
            border: none;
        }
        .profile-button:hover {
            background: #357ABD;
        }
    </style>
</head>
<body class="bg-gray-100">

<jsp:include page="/views/includes/header.jsp"/>

<jsp:include page="/views/includes/navbar.jsp"/>

<div class="container mx-auto mt-16">
    <form action="${pageContext.request.contextPath}/customerinfo" method="post">
        <div class="bg-white shadow-md rounded-lg p-8">
            <div class="flex">
                <div class="w-1/3 border-r-2">
                    <div class="flex flex-col items-center text-center">
                        <img class="rounded-full mt-5 w-40 h-40" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="Profile Picture">
                        <span class="font-bold text-lg mt-3"><%= userFromDB.getFullName() %></span>
                        <span class="text-gray-500"><%= userFromDB.getEmail() %></span>
                    </div>
                </div>
                <div class="w-2/3 pl-8">
                    <h2 class="text-2xl font-bold mb-6">Profile Settings</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-gray-700">First Name</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= userFromDB.getFirstName() %>" readonly>
                        </div>
                        <div>
                            <label class="block text-gray-700">Last Name</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= userFromDB.getLastName() %>" readonly>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Full Name</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= userFromDB.getFullName() %>" readonly>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Mobile Number</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= userFromDB.getMobile() %>" readonly>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Birth Date</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= userFromDB.getBirthDate() %>" readonly>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Address</label>
                            <input type="text" id="address" class="form-input mt-1 block w-full" readonly>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Email ID</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= userFromDB.getEmail() %>" readonly>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700">Gender</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= userFromDB.getGender() %>" readonly>
                        </div>
                    </div>
                    <hr class="my-6">
                    <h2 class="text-2xl font-bold mb-6">Additional Information</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="col-span-2">
                            <label class="block text-gray-700">Personal Info</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= customerFromDB != null ? customerFromDB.getPersonalInfo() : "" %>" readonly>
                        </div>
                    </div>
                    <hr class="my-6">
                    <h2 class="text-2xl font-bold mb-6">Motorcycle Information</h2>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="col-span-2">
                            <label class="block text-gray-700">License Plate</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getLicensePlate() : "" %>" readonly>
                        </div>
                        <div>
                            <label class="block text-gray-700">Brand</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getBrand() : "" %>" readonly>
                        </div>
                        <div>
                            <label class="block text-gray-700">Model</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getModel() : "" %>" readonly>
                        </div>
                        <div>
                            <label class="block text-gray-700">Frame Number</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getFrameNumber() : "" %>" readonly>
                        </div>
                        <div>
                            <label class="block text-gray-700">Engine Number</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getEngineNumber() : "" %>" readonly>
                        </div>
                        <div>
                            <label class="block text-gray-700">Year of Manufacture</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getYearOfManufacture() : "" %>" readonly>
                        </div>
                        <div>
                            <label class="block text-gray-700">Color</label>
                            <input type="text" class="form-input mt-1 block w-full" value="<%= motorcycleFromDB != null ? motorcycleFromDB.getColor() : "" %>" readonly>
                        </div>
                    </div>
                    <div class="mt-6 text-center">
                        <button class="btn btn-primary profile-button" type="submit">Edit Profile</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<jsp:include page="/views/includes/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        var provinceId = "<%= userFromDB.getProvince() %>";
        var districtId = "<%= userFromDB.getDistrict() %>";
        var wardId = "<%= userFromDB.getCountry() %>";

        console.log('Fetching ward with ID:', wardId);
        $.getJSON('https://esgoo.net/api-tinhthanh/5/' + wardId + '.htm', function(data) {
            console.log('Ward API response:', data);
            if (data.error == 0) {
                $('#address').val(data.data.full_name);
            } else {
                console.error('Error fetching ward:', data.error_text);
            }
        });
    });
</script>
</body>
</html>