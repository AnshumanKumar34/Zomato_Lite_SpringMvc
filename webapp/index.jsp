<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zomato | Food Delivery</title>
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }

    body {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
        font-family: 'Arial', sans-serif;
        transition: background 0.5s, color 0.5s;
    }

    body[data-theme="dark"] {
        background: linear-gradient(135deg, #2c2c2c, #444);
        color: #fff;
    }

    * {
        box-sizing: border-box;
    }

    .toggle-btn {
        position: fixed;
        top: 1rem;
        right: 1rem;
        z-index: 1000;
        padding: 0.5rem 1rem;
        border: none;
        border-radius: 20px;
        background: #fff;
        color: #ff6b6b;
        font-size: 0.9rem;
        cursor: pointer;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
    }

    .toggle-btn:hover {
        background: #ff6b6b;
        color: #fff;
    }

    .main-content {
        flex: 1 0 auto;
        padding: 5rem 1rem 2rem;
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        max-width: 100vw;
        overflow-x: hidden;
    }

    h1 {
        color: #fff;
        font-size: 3.5rem;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        margin-bottom: 1rem;
        text-align: center;
        word-break: break-word;
    }

    body[data-theme="dark"] h1 {
        color: #ff8e8e;
    }

    h1 sub {
        display: block;
        font-size: 1.2rem;
        color: #ffe8e8;
        margin-top: 0.5rem;
        font-style: italic;
        animation: fadeIn 2s infinite alternate;
    }

    .button-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 2rem;
        margin-top: 3rem;
        padding: 0 1rem;
        max-width: 100%;
    }

    .button-container a {
        text-decoration: none;
    }

    button {
        padding: 1.5rem 3rem;
        font-size: 1.1rem;
        border: none;
        border-radius: 15px;
        background: #fff;
        color: #ff6b6b;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
        font-weight: bold;
        cursor: pointer;
        max-width: 100%;
    }

    button:hover {
        transform: translateY(-5px) scale(1.05);
        background: #ff6b6b;
        color: #fff;
        border: 2px solid #fff;
    }

    .footer {
        flex-shrink: 0;
        width: 100%;
        padding: 1rem;
        background: rgba(0, 0, 0, 0.2);
        text-align: center;
        color: white;
        font-size: 1rem;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @media (max-width: 768px) {
        h1 {
            font-size: 2.5rem;
        }

        .button-container {
            flex-direction: column;
            gap: 1.5rem;
        }

        button {
            width: 100%;
        }
    }
</style>
</head>
<body>
    <button class="toggle-btn" onclick="toggleTheme()">Toggle Theme</button>

    <div class="main-content">
        <h1>Welcome to ZOMATO<sub>The Taste of Heaven</sub></h1>
        <div class="button-container">
            <a href="create.jsp"><button>Create Food Item</button></a>
            <a href="all"><button>View All Food Items</button></a>
            <a href="order.jsp"><button>Order Now</button></a>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 Zomato. All rights reserved. | Delicious food delivered to your doorstep.
    </div>

    <script>
        function toggleTheme() {
            const body = document.body;
            const isDark = body.getAttribute('data-theme') === 'dark';
            body.setAttribute('data-theme', isDark ? 'light' : 'dark');
        }
    </script>
</body>
</html>
