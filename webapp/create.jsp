<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Food Item</title>
<style>
    body {
        margin: 0;
        padding: 1rem;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
        font-family: 'Arial', sans-serif;
        transition: background 0.5s, color 0.5s;
    }

    body[data-theme="dark"] {
        background: linear-gradient(135deg, #2c2c2c, #444);
        color: #fff;
    }

    .toggle-btn {
        position: absolute;
        top: 1rem;
        right: 1rem;
        padding: 0.5rem 1rem;
        font-size: 0.9rem;
        border: none;
        border-radius: 20px;
        background: #fff;
        color: #ff6b6b;
        cursor: pointer;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
    }

    .toggle-btn:hover {
        background: #ff6b6b;
        color: #fff;
    }

    .compact-form {
        background: white;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.15);
        max-width: 400px;
        margin: auto;
        width: 100%;
        transition: background 0.3s, color 0.3s;
    }

    body[data-theme="dark"] .compact-form {
        background: #333;
        color: white;
    }

    .compact-form label {
        font-size: 0.9rem;
        margin-bottom: 4px;
        display: block;
        color: #333;
    }

    body[data-theme="dark"] .compact-form label {
        color: #eee;
    }

    .compact-form input,
    .compact-form select,
    .compact-form button {
        width: 100%;
        padding: 10px 15px;
        margin-bottom: 12px;
        border: 2px solid #eee;
        border-radius: 6px;
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }

    body[data-theme="dark"] .compact-form input,
    body[data-theme="dark"] .compact-form select {
        background: #555;
        color: #fff;
        border: 2px solid #777;
    }

    .compact-form input:focus,
    .compact-form select:focus {
        outline: none;
        border-color: #ff6b6b;
        box-shadow: 0 0 8px rgba(255,107,107,0.3);
    }

    .compact-form button {
        background: #ff6b6b;
        color: white;
        border: none;
        padding: 12px;
        font-size: 1rem;
        cursor: pointer;
        margin-top: 8px;
    }

    .compact-form button:hover {
        background: #ff5252;
        transform: translateY(-2px);
    }
</style>
</head>
<body>
    <button class="toggle-btn" onclick="toggleTheme()">Toggle Theme</button>

    <div class="compact-form">
        <h2 style="color: #ff6b6b; text-align: center; margin-bottom: 1.5rem; font-size: 1.75rem;">Create Food Item</h2>
        <form action="save" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Name" required>

            <label for="description">Description</label>
            <input type="text" id="description" name="description" placeholder="Description" required>

            <label for="category">Category</label>
            <input type="text" id="category" name="category" placeholder="Category" required>

            <label for="type">Type</label>
            <select id="type" name="type" required>
                <option value="">Select Type</option>
                <option value="Veg">Veg</option>
                <option value="Non-Veg">Non-Veg</option>
            </select>

            <label for="price">Price</label>
            <input type="number" id="price" name="price" placeholder="Price" step="0.01" required>

            <label for="rating">Rating (1-5)</label>
            <input type="number" id="rating" name="rating" placeholder="Rating" min="1" max="5" step="0.1" required>

            <label for="image">Image URL</label>
            <input type="url" id="image" name="image" placeholder="Image URL" required>

            <button type="submit">Create</button>
        </form>
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
