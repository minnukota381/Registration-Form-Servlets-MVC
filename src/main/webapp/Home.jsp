<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            color: #fff;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }
        h2 {
            margin-top: 0;
            font-weight: 600;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .message {
            font-size: 1.2em;
            color: #4eff91;
            margin-bottom: 30px;
            font-weight: 300;
        }
        p {
            margin-bottom: 30px;
            font-size: 1.1em;
        }
        a {
            color: #fff;
            text-decoration: none;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 10px 20px;
            border-radius: 50px;
            transition: all 0.3s ease;
            font-weight: 400;
        }
        a:hover {
            background-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome</h2>
        <p class="message">User Registration Successful</p>
        <p>Please <a href="Login.jsp">log in</a> to continue.</p>
    </div>
</body>
</html>