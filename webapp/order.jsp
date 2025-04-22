<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Food | Zomato</title>
<style>
    :root {
        --bg-color-light: linear-gradient(135deg, #ff6b6b, #ff8e8e);
        --bg-color-dark: #1e1e1e;
        --form-bg-light: white;
        --form-bg-dark: #2c2c2c;
        --text-light: black;
        --text-dark: #f2f2f2;
        --primary-color: #ff6b6b;
    }

    body {
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        background: var(--bg-color-light);
        font-family: 'Arial', sans-serif;
        transition: background 0.3s ease;
    }

    body.dark-mode {
        background: var(--bg-color-dark);
    }

    .container {
        text-align: center;
        margin-top: 4rem;
        background: var(--form-bg-light);
        padding: 2rem;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        width: 50%;
        animation: fadeIn 1s ease-in-out;
        transition: background 0.3s ease, color 0.3s ease;
    }

    body.dark-mode .container {
        background: var(--form-bg-dark);
        color: var(--text-dark);
    }

    h1 {
        color: var(--primary-color);
        font-size: 2.5rem;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        align-items: center;
    }

    input, select {
        width: 80%;
        padding: 0.8rem;
        border: 1px solid #ddd;
        border-radius: 10px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    button {
        padding: 1rem 2rem;
        font-size: 1.1rem;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        background: var(--primary-color);
        color: white;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
    }

    button:hover {
        transform: translateY(-3px);
        background: #e05555;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
    }

    .theme-toggle {
        position: absolute;
        top: 1rem;
        right: 1rem;
        padding: 0.5rem 1rem;
        font-size: 0.9rem;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        background-color: white;
        color: var(--primary-color);
        font-weight: bold;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
    }

    body.dark-mode .theme-toggle {
        background: #444;
        color: white;
    }

    @media (max-width: 768px) {
        .container {
            width: 80%;
        }
    }
</style>
</head>
<body>
    <button class="theme-toggle" onclick="toggleTheme()">Toggle Theme</button>

    <div class="container">
        <h1>Order Your Favorite Food</h1>
        <form action="submitOrder.jsp" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="text" name="address" placeholder="Delivery Address" required>
            <input type="tel" name="phone" placeholder="Contact Number" required>

            <select name="foodItem" required>
                <option value="">Select a Food Item</option>
                <c:forEach var="item" items="${foodItems}">
                    <option value="${item.name}">${item.name}</option>
                </c:forEach>
            </select>

            <button type="submit">Place Order</button>
        </form>
    </div>

    <script>
        function toggleTheme() {
            document.body.classList.toggle('dark-mode');
        }
    </script>
</body>
</html>
