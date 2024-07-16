<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
   <link rel="icon" href="${pageContext.request.contextPath}/img/logo_tab.webp">
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   <style>
      .error {
         color: red;
      }
   </style>
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">
<div class="w-full max-w-md p-8 space-y-6 bg-white rounded-lg shadow-md">
   <form action="${pageContext.request.contextPath}/login" method="post" autocomplete="off">
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
      <div class="mt-8">
         <input class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" type="text" name="username" placeholder="E-mail Address" autocomplete="off" required>
      </div>
      <div class="mt-4">
         <input class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" type="password" name="password" placeholder="Password" autocomplete="off" required>
      </div>
      <div class="mt-4 flex items-center justify-between">
         <button id="submit" type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">Login</button>
         <a href="${pageContext.request.contextPath}/forgot" class="text-gray-600 hover:text-blue-600">Forget password?</a>
      </div>
      <p class="error mt-4 text-center">${requestScope.mess}</p>
   </form>
</div>
</body>
</html>