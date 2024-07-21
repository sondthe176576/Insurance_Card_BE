<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Header Design</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --text-color: #333;
            --bg-color: #ecf0f1;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
        }

        .tp-header {
            background-color: var(--primary-color); /* Màu nền xanh dương */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
            transition: transform 0.3s ease;
        }

        .navbar-brand:hover {
            transform: scale(1.05);
        }

        .right-section {
            display: flex;
            align-items: center;
        }

        .search-form {
            position: relative;
            margin-right: 20px;
        }

        .search-input {
            padding: 10px 40px 10px 15px;
            border: none;
            border-radius: 25px;
            background-color: var(--bg-color);
            font-size: 16px;
            width: 250px;
            transition: all 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            box-shadow: 0 0 0 2px var(--primary-color);
            width: 300px;
        }

        .search-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            cursor: pointer;
        }

        .login-btn {
            background-color: var(--secondary-color);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
        }

        .login-btn:hover {
            background-color: #fff;
            color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .login-btn i {
            margin-right: 10px;
        }

        .phone {
            font-size: 18px;
            font-weight: bold;
            margin-left: 20px;
            display: flex;
            align-items: center;
            color: #fff;
        }

        .phone i {
            margin-right: 10px;
            color: #fff;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .right-section {
                margin-top: 20px;
                flex-direction: column;
            }

            .search-form {
                margin-right: 0;
                margin-bottom: 20px;
            }

            .phone {
                margin-top: 20px;
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
<header class="tp-header" id="tp-header" data-aos="fade-down">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            Peace Insurance
        </a>
        <div class="right-section">
            <form class="search-form" onsubmit="return handleSearch(event)">
                <input type="search" class="search-input" placeholder="Search..." aria-label="Search" id="searchInput">
                <i class="fas fa-search search-icon"></i>
            </form>
            <button class="login-btn" data-aos="fade-up" data-aos-delay="200">
                <i class="fas fa-user"></i> LOGIN
            </button>
            <div class="phone" data-aos="fade-up" data-aos-delay="400">
                <i class="fas fa-phone-alt"></i>
                <span>0123 456 789</span>
            </div>
        </div>
    </div>
</header>

<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true
    });

    window.addEventListener('scroll', function() {
        var header = document.getElementById('tp-header');
        if (window.scrollY > 50) {
            header.style.padding = '10px 0';
        } else {
            header.style.padding = '20px 0';
        }
    });

    function handleSearch(event) {
        event.preventDefault();
        // Implement search functionality here
        console.log('Search for:', document.getElementById('searchInput').value);
    }
</script>
</body>
</html>