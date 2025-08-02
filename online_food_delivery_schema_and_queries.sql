
-- Online Food Delivery System Database

-- Drop existing tables if they exist
DROP TABLE IF EXISTS ratings, payments, order_items, orders, delivery_agents, menus, restaurants, users;

-- 1. Users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    location VARCHAR(100)
);

-- 2. Restaurants
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    rating FLOAT
);

-- 3. Menus
CREATE TABLE menus (
    menu_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- 4. Delivery Agents
CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    status VARCHAR(20)
);

-- 5. Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    timestamp DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- 6. Order Items
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    menu_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES menus(menu_id)
);

-- 7. Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    method VARCHAR(20),
    status VARCHAR(20),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- 8. Ratings
CREATE TABLE ratings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    rating FLOAT,
    comment TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Example SQL queries after data import
-- Top 5 most active users
SELECT u.name, COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id
ORDER BY total_orders DESC
LIMIT 5;

-- Average rating per restaurant
SELECT r.name AS restaurant, ROUND(AVG(rt.rating), 2) AS avg_rating
FROM restaurants r
JOIN ratings rt ON r.restaurant_id = rt.restaurant_id
GROUP BY r.restaurant_id
ORDER BY avg_rating DESC;

-- Total sales per restaurant
SELECT r.name, SUM(p.amount) AS total_sales
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id
ORDER BY total_sales DESC;

-- Top 3 best-selling food items
SELECT m.item_name, COUNT(oi.menu_id) AS total_sold
FROM order_items oi
JOIN menus m ON oi.menu_id = m.menu_id
GROUP BY oi.menu_id
ORDER BY total_sold DESC
LIMIT 3;
