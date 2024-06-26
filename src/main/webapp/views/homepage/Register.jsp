<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iofrm-style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iofrm-theme14.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap&subset=vietnamese" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">

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
<body>
<div class="form-body">
    <div class="row">
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                        <div class="website-logo-inside">
                            <a href="home.jsp">
                                <div class="logo">
                                    <img class="logo-size" src="${pageContext.request.contextPath}/img/logo.png" alt="">
                                </div>
                            </a>
                        </div>
                        <h3>Get more things done with Loggin platform.</h3>
                        <p>Access to the most powerful tool in the entire design and web industry.</p>
                        <div class="page-links">
                            <a href="${pageContext.request.contextPath}/login">Login</a><a href="${pageContext.request.contextPath}/register" class="active">Register</a>
                        </div>
                        <form>
                            <input class="form-control" type="text" name="phone" placeholder="Phone" required>
                            <input class="form-control" type="email" name="email-address" placeholder="Email" required>
                            <input class="form-control" type="email" name="email" placeholder="E-mail Address" required>
                            <input class="form-control" type="password" name="password" placeholder="Password" required>

                            <div class="css_select_div">
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

                            <script src="https://esgoo.net/scripts/jquery.js"></script>
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
                            <input class="form-control" type="text" name="firstname" placeholder="First Name" required>
                            <input class="form-control" type="text" name="lastname" placeholder="Last Name" required>
                            <input class="form-control" type="text" name="fullname" placeholder="Full Name" required>
                            <input class="form-control" type="date" name="birthdate" placeholder="Birth Date" required>
                            <select class="form-control" name="gender" required>
                                <option value="" disabled selected>Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                            <div class="form-button">
                                <button id="submit" type="submit" class="ibtn">Register</button>
                            </div>
                        </form>
                        <p class="error">${requestScope.message}</p>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>