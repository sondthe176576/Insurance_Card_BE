<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(45deg, #405e8c 0%, #fad0c4 99%, #fad0c4 100%);
        }

        .register-container {
            position: relative;
            width: 800px;
            height: 600px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            backdrop-filter: blur(5px);
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form {
            text-align: center;
            position: relative;
            width: 100%;
            height: 100%;
            padding: 40px;
            overflow-y: auto;
        }

        .form h2 {
            position: relative;
            color: #fff;
            font-size: 24px;
            font-weight: 600;
            letter-spacing: 1px;
            margin-bottom: 40px;
        }

        .form h2::before {
            content: '';
            position: absolute;
            left: 50%;
            bottom: -10px;
            width: 80px;
            height: 4px;
            background: #fff;
            transform: translateX(-50%);
        }

        .form .inputBox {
            width: 100%;
            margin-top: 20px;
        }

        .form .inputBox input,
        .form .inputBox select {
            width: 100%;
            background: rgba(255, 255, 255, 0.3);
            border: none;
            outline: none;
            padding: 10px 20px;
            border-radius: 35px;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 16px;
            letter-spacing: 1px;
            color: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .form .inputBox select option {
            background: #405e8c; /* Solid background color for options */
            color: #fff;
        }

        .form .inputBox input::placeholder,
        .form .inputBox select::placeholder {
            color: rgba(255, 255, 255, 0.9);
        }

        .form .inputBox input[type="submit"] {
            background: #fff;
            color: #666;
            max-width: 150px;
            cursor: pointer;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .css_select_div {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 20px;
        }

        .css_select {
            width: 32%;
            padding: 10px;
            border-radius: 35px;
            background: rgba(255, 255, 255, 0.3); /* Increased opacity */
            border: 1px solid rgba(255, 255, 255, 0.7); /* Increased border opacity */
            color: #fff;
            font-size: 16px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        .css_select option {
            background: #405e8c; /* Solid background color for options */
            color: #fff;
        }

        .error {
            color: #ff6b6b;
            margin-top: 10px;
            font-weight: 500;
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 80px;
            height: 80px;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translatey(0px); }
            50% { transform: translatey(-20px); }
            100% { transform: translatey(0px); }
        }

        .social-icons {
            position: absolute;
            bottom: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .social-icons a {
            margin: 0 10px;
            color: #fff;
            font-size: 24px;
            transition: 0.3s;
        }

        .social-icons a:hover {
            transform: translateY(-5px);
        }

        .page-links {
            margin-bottom: 20px;
        }

        .page-links a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            font-weight: 500;
            transition: 0.3s;
        }

        .page-links a.active {
            border-bottom: 2px solid #fff;
        }

        .page-links a:hover {
            opacity: 0.8;
        }

        /* Scrollbar Styles */
        .form::-webkit-scrollbar {
            width: 5px;
        }

        .form::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
        }

        .form::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.5);
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="register-container animate__animated animate__fadeIn">
    <form action="${pageContext.request.contextPath}/register" method="post" autocomplete="off" class="form">
        <h2>Register</h2>
        <div class="page-links">
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register" class="active">Register</a>
        </div>
        <div class="inputBox">
            <input type="number" name="phone" placeholder="Phone" required pattern="\d{1,11}" title="Phone number must be between 8 and 11 digits">
        </div>
        <div class="inputBox">
            <input type="email" name="email" placeholder="Email Address" required>
        </div>
        <div class="inputBox">
            <input type="password" name="password" placeholder="Password" required>
        </div>
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
        <input type="hidden" name="hidden_tinh" id="hidden_tinh">
        <input type="hidden" name="hidden_quan" id="hidden_quan">
        <input type="hidden" name="hidden_phuong" id="hidden_phuong">
        <div class="inputBox">
            <input type="text" name="firstname" placeholder="First Name" required>
        </div>
        <div class="inputBox">
            <input type="text" name="lastname" placeholder="Last Name" required>
        </div>
        <div class="inputBox">
            <input type="text" name="fullname" placeholder="Full Name" required>
        </div>
        <div class="inputBox">
            <input type="date" name="birthdate" placeholder="Birth Date" required max="2009-12-31">
        </div>
        <div class="inputBox">
            <select name="gender" required>
                <option value="" disabled selected>Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
        </div>
        <div class="inputBox">
            <input type="submit" value="Register">
        </div>
        <p class="error">${requestScope.message}</p>
    </form>
    <div class="social-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-google"></i></a>
    </div>
</div>

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

    gsap.from(".register-container", {duration: 1, opacity: 0, y: 50, ease: "power3.out"});
    gsap.from(".inputBox", {duration: 0.5, opacity: 0, y: 20, stagger: 0.1, ease: "power3.out", delay: 0.5});
    gsap.from(".social-icons a", {duration: 0.5, opacity: 0, y: 20, stagger: 0.1, ease: "power3.out", delay: 1});
</script>
</body>
</html>