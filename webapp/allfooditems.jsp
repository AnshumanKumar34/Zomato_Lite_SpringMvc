<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Food Items</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 2rem;
        background: linear-gradient(135deg, #fff5f5, #ffe6e6);
        transition: background 0.5s, color 0.5s;
    }

    body[data-theme="dark"] {
        background: linear-gradient(135deg, #2c2c2c, #444);
        color: #f0f0f0;
    }

    .toggle-btn {
        position: fixed;
        top: 1rem;
        right: 1rem;
        padding: 0.5rem 1rem;
        font-size: 0.8rem;
        border: none;
        border-radius: 20px;
        background: #ff6b6b;
        color: white;
        cursor: pointer;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
        z-index: 1000;
    }

    .toggle-btn:hover {
        background: #e65a5a;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        transition: background 0.3s, color 0.3s;
    }

    body[data-theme="dark"] .container {
        background: #333;
        color: white;
    }

    h1 {
        color: #ff6b6b;
        text-align: center;
        margin-bottom: 1.5rem;
        font-size: 2.5rem;
    }

    body[data-theme="dark"] h1 {
        color: #ffa1a1;
    }

    .search-box {
        margin-bottom: 20px;
        display: flex;
        justify-content: center;
    }

    #searchInput {
        width: 100%;
        max-width: 400px;
        padding: 10px 15px;
        border: 2px solid #eee;
        border-radius: 6px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    body[data-theme="dark"] #searchInput {
        background: #555;
        border-color: #777;
        color: white;
    }

    .food-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 0.9em;
        border-radius: 8px 8px 0 0;
        overflow: hidden;
    }

    .food-table thead tr {
        background-color: #ff6b6b;
        color: white;
        text-align: left;
        font-weight: bold;
    }

    .food-table th,
    .food-table td {
        padding: 12px 15px;
        vertical-align: middle;
    }

    .food-table tbody tr {
        border-bottom: 1px solid #ddd;
    }

    .food-table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    body[data-theme="dark"] .food-table tbody tr:nth-child(even) {
        background-color: #444;
    }

    .food-table tbody tr:hover {
        background-color: #fff0f0;
    }

    body[data-theme="dark"] .food-table tbody tr:hover {
        background-color: #555;
    }

    .food-table img {
        width: 50px;
        height: 50px;
        object-fit: cover;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .action-btns {
        display: flex;
        gap: 8px;
    }

    .btn {
        padding: 6px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.85em;
        transition: all 0.3s ease;
        text-decoration: none;
    }

    .btn-delete {
        background-color: #ff4444;
        color: white;
    }

    .btn-delete:hover {
        background-color: #cc0000;
    }

    .btn-update {
        background-color: #4CAF50;
        color: white;
    }

    .btn-update:hover {
        background-color: #45a049;
    }

    @media (max-width: 768px) {
        .container {
            margin: 10px;
            padding: 10px;
        }

        .food-table {
            font-size: 0.8em;
        }

        .food-table th,
        .food-table td {
            padding: 8px 10px;
        }
    }

    /* Custom Popup Modal */
    .popup-overlay {
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0, 0, 0, 0.5);
        display: none;
        align-items: center;
        justify-content: center;
        z-index: 2000;
    }

    .popup-box {
        background: white;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 5px 25px rgba(0,0,0,0.3);
        text-align: center;
        width: 90%;
        max-width: 400px;
    }

    body[data-theme="dark"] .popup-box {
        background: #444;
        color: white;
    }

    .popup-buttons {
        margin-top: 1.5rem;
        display: flex;
        justify-content: center;
        gap: 1rem;
    }

    .popup-buttons button {
        padding: 0.5rem 1.5rem;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        cursor: pointer;
    }

    .confirm-btn {
        background: #ff4444;
        color: white;
    }

    .cancel-btn {
        background: #ccc;
        color: #333;
    }

    .confirm-btn:hover {
        background: #cc0000;
    }

    .cancel-btn:hover {
        background: #aaa;
    }
</style>
</head>
<body>
    <button class="toggle-btn" onclick="toggleTheme()">Toggle Theme</button>

    <div class="container">
        <h1>All Food Items</h1>

        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Search by name, category, etc..." onkeyup="filterTable()">
        </div>

        <table class="food-table" id="foodTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Rating</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="f" items="${fil}">
                    <tr>
                        <td>${f.id}</td>
                        <td>${f.name}</td>
                        <td>${f.description}</td>
                        <td>${f.category}</td>
                        <td>${f.type}</td>
                        <td>₹${f.price}</td>
                        <td>${f.rating}/5</td>
                        <td><img src="${f.image}" alt="Food Image"></td>
                        <td>
                            <div class="action-btns">
                                <button class="btn btn-delete" onclick="showPopup(${f.id})">Delete</button>
                                <a href="updatepage?id=${f.id}" class="btn btn-update">Update</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Popup Confirmation Modal -->
    <div class="popup-overlay" id="popup">
        <div class="popup-box">
            <h2>Confirm Deletion</h2>
            <p>Are you sure you want to delete this food item?</p>
            <div class="popup-buttons">
                <button class="confirm-btn" onclick="proceedDelete()">Yes</button>
                <button class="cancel-btn" onclick="hidePopup()">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        let deleteId = null;

        function filterTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const rows = document.querySelectorAll("#foodTable tbody tr");

            rows.forEach(row => {
                const rowText = row.innerText.toLowerCase();
                row.style.display = rowText.includes(filter) ? "" : "none";
            });
        }

        function toggleTheme() {
            const body = document.body;
            const isDark = body.getAttribute("data-theme") === "dark";
            body.setAttribute("data-theme", isDark ? "light" : "dark");
        }

        function showPopup(id) {
            deleteId = id;
            document.getElementById("popup").style.display = "flex";
        }

        function hidePopup() {
            deleteId = null;
            document.getElementById("popup").style.display = "none";
        }

        function proceedDelete() {
            if (deleteId !== null) {
                window.location.href = `delete?id=${deleteId}`;
            }
        }
    </script>
</body>
</html>
