<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
        }
        .success-message {
            margin-top: 100px;
            padding: 20px;
            background-color:#FF8674;
            color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }
        h1 {
            font-size: 24px;
        }
        /* Style the button */
        .return-button {
            background-color: #fff;
            color: #FF8674;
            border: 1px solid #FF8674;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        /* Style the button hover effect */
        .return-button:hover {
            background-color: #D2C5C0 ;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="success-message">
        <h1>Success!</h1>
        <p>Your operation was successful.</p>
        <!-- Use the link as a button -->
        <a href="<%= request.getContextPath() %>/index.jsp" class="return-button">Return to Home</a>
    </div>
</body>
</html>
