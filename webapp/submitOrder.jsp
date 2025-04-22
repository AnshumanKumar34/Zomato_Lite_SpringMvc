<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.jsp.Order" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
            font-family: 'Arial', sans-serif;
            text-align: center;
            color: white;
        }
        .container {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            color: #ff6b6b;
            width: 50%;
        }
        h1 {
            font-size: 2.5rem;
        }
        p {
            font-size: 1.2rem;
        }
        .btn {
            display: inline-block;
            margin-top: 1.5rem;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            background: #ff6b6b;
            color: white;
            text-decoration: none;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }
        .btn:hover {
            background: #e05555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Confirmed!</h1>
        <p>Thank you, <%= request.getParameter("name") %>!</p>
        <p>Your order for <b><%= request.getParameter("foodItem") %></b> has been placed.</p>
        <p>It will be delivered to: <b><%= request.getParameter("address") %></b></p>
        <p>We will contact you at: <b><%= request.getParameter("phone") %></b></p>
        <a href="index.jsp" class="btn">Back to Home</a>
    </div>
</body>
</html>
