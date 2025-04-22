<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodItem Update Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
        text-align: center;
        color: white;
        margin: 0;
        padding: 0;
    }
    .container {
        background: white;
        color: #ff6b6b;
        padding: 2rem;
        margin: 5% auto;
        width: 50%;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    h1 {
        margin-bottom: 1rem;
    }
    form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    input {
        padding: 10px;
        border: 1px solid #ff6b6b;
        border-radius: 5px;
        font-size: 1rem;
    }
    button {
        background: #ff6b6b;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        cursor: pointer;
        transition: 0.3s;
    }
    button:hover {
        background: #e05555;
    }
    .back-button {
        display: inline-block;
        margin-top: 1rem;
        padding: 10px;
        background: white;
        color: #ff6b6b;
        text-decoration: none;
        border-radius: 5px;
        transition: 0.3s;
    }
    .back-button:hover {
        background: #ff6b6b;
        color: white;
    }
</style>
</head>
<body>
   <div class="container">
        <h1>Update Food Item Details</h1>

        <form action="update">
            <input type="text" name="id" value="${f.id}" readonly>
            <input type="text" name="name" value="${f.name}" required>
            <input type="text" name="description" value="${f.description}" required>
            <input type="text" name="category" value="${f.category}" required>
            <input type="text" name="type" value="${f.type}" required>
            <input type="text" name="price" value="${f.price}" required>
            <input type="text" name="rating" value="${f.rating}" required>
            <input type="text" name="image" value="${f.image}" required>
            <button type="submit">Update</button>
        </form>
        <br>
        <a href="allfooditems.jsp" class="back-button">Back to Food Item List</a>
    </div>
</body>
</html>
