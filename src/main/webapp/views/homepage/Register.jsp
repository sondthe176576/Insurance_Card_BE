<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap&subset=vietnamese" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .error {
            color: red;
        }
        .css_select_div {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .css_select {
            width: 30%;
            padding: 5px;
            margin: 10px 0;
            border: solid 1px #686868;
            border-radius: 5px;
            font-family: inherit;
        }
    </style>
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">
<div class="w-full max-w-md p-8 space-y-6 bg-white rounded-lg shadow-md">
    <div class="text-center">
        <a href="home.jsp">
            <img class="w-32 mx-auto mb-4" src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
        </a>
        <h3 class="text-2xl font-semibold">Get more things done with Loggin platform.</h3>
        <p class="mt-2 text-gray-600">Access to the most powerful tool in the entire design and web industry.</p>
    </div>
    <div class="flex justify-center mt-4 space-x-4">
        <a href="${pageContext.request.contextPath}/login" class="text-blue-600 border-b-2 border-blue-600">Login</a>
        <a href="${pageContext.request.contextPath}/register" class="text-gray-600 hover:text-blue-600">Register</a>
    </div>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="text" name="phone" placeholder="Phone" required>
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="email" name="email-address" placeholder="Email" required>
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="email" name="email" placeholder="E-mail Address" required>
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="password" name="password" placeholder="Password" required>
        <div class="css_select_div mt-4">
            <select class="css_select" id="tinh" name="tinh" title="Choose Province">
                <option value="0">Province</option>
            </select>
            <select class="css_select" id="quan" name="quan" title="Choose District">
                <option value="0">District</option>
            </select>
            <select class="css_select" id="phuong" name="phuong" title="Choose County">
                <option value="0">Country</option>
            </select>
        </div>
        <input type="hidden" name="tinh" id="hidden_tinh">
        <input type="hidden" name="quan" id="hidden_quan">
        <input type="hidden" name="phuong" id="hidden_phuong">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
                    if (data_tinh.error == 0) {
                        $.each(data_tinh.data, function (key_tinh, val_tinh) {
                            $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                        });
                        $("#tinh").change(function (e) {
                            var idtinh = $(this).val();
                            $("#hidden_tinh").val($("#tinh option:selected").text());
                            $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                                if (data_quan.error == 0) {
                                    $("#quan").html('<option value="0">District</option>');
                                    $("#phuong").html('<option value="0">Country</option>');
                                    $.each(data_quan.data, function (key_quan, val_quan) {
                                        $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                                    });
                                    $("#quan").change(function (e) {
                                        var idquan = $(this).val();
                                        $("#hidden_quan").val($("#quan option:selected").text());
                                        $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                            if (data_phuong.error == 0) {
                                                $("#phuong").html('<option value="0">Country</option>');
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
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="text" name="firstname" placeholder="First Name" required>
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="text" name="lastname" placeholder="Last Name" required>
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="text" name="fullname" placeholder="Full Name" required>
        <input class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" type="date" name="birthdate" placeholder="Birth Date" required>
        <select class="form-input mt-1 block w-full rounded-lg border-gray-300 shadow-sm" name="gender" required>
            <option value="" disabled selected>Gender</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>
        <div class="form-button mt-4">
            <button id="submit" type="submit" class="w-full px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">Register</button>
        </div>
    </form>
    <p class="error mt-4 text-center">${requestScope.message}</p>
</div>
</body>
</html>