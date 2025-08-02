#  Online Food Delivery System Database (Zomato/UberEats Clone)

A relational database system designed using MySQL to simulate the core functionalities of an online food delivery platform like Zomato or Uber Eats. This project focuses on managing users, restaurants, menus, orders, deliveries, and payments — with support for real-time order tracking and performance optimization using SQL best practices.

---

# Project Objectives

- Design a normalized database schema for an online food ordering platform.
- Track users, restaurants, food items, orders, payments, and delivery logistics.
- Implement stored procedures, views, triggers, and indexing for real-world performance.
- Enable detailed order tracking, rating systems, and analytics.

---

##  Entity-Relationship Diagram


*![ER Diagram](diagrams/online_food_er.jpg)


---

##  Database Schema Overview

| Table | Description |
|-------|-------------|
| `users` | Customer details (name, location, phone, email) |
| `restaurants` | Restaurant profile and location |
| `menus` | Food items and prices offered by restaurants |
| `orders` | Orders placed by users (with timestamps and status) |
| `order_items` | Individual items in each order |
| `delivery_agents` | Delivery personnel with availability status |
| `deliveries` | Assignment of delivery agents to orders |
| `payments` | Payment method and status tracking |
| `ratings` | Customer reviews for items and restaurants |
| `coupons` | Discount offers with usage constraints |


##  Features Implemented
- User & Restaurant Management
- Menu creation and item search
- Order placement with multi-item support
- Delivery assignment and tracking
- Payment tracking (cash/card/wallet)
- User ratings & restaurant reviews
- Coupon application logic
- SQL views for reporting & analytics

##  Advanced SQL Used

- Normalization (up to 3NF)
- Complex JOINs and subqueries
- Views (e.g., `top_restaurants`, `order_summary`)
- Stored Procedures (e.g., `assign_delivery_agent()`)
- Triggers (e.g., auto-update delivery status)
- Transactions (for order + payment consistency)
- Indexing for fast lookup (`restaurant_id`, `order_id`, etc.)

# Technologies Used
- Database: MySQL 8.0
- Modeling Tool: dbdiagram.io / draw.io
- Data Access: MySQL Workbench / phpMyAdmin
- (Optional) Flask / PHP frontend or Power BI dashboard for visualization

# How to Use
- Clone the repository
- Import schema.sql into your MySQL server
- Run sample_data.sql to populate data
- Execute views_and_procedures.sql and triggers.sql
- Use queries.sql to test functionality

# Future Enhancements
- User authentication system (via PHP or Flask)
- Real-time order tracking dashboard
- Business analytics dashboard using Power BI
- Frontend integration with mobile UI mockups

# Author
- Harshvardhan Singh Shekhawat
- harshvardhanss1433@gmail.com

