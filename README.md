# Pizza Sales Analysis using PostgreSQL

## Project Overview

This project analyzes pizza sales data using PostgreSQL and SQL.

The analysis focuses on orders, pizza types, quantities, pricing, revenue, and ordering patterns. The goal is to practice SQL and perform practical data analysis using a relational database.

## Database Tables

The project uses four tables:

- `pizzas`
- `pizza_types`
- `orders`
- `order_details`

### Table Structure

**pizzas**
- `pizza_id`
- `pizza_type_id`
- `size`
- `price`

**pizza_types**
- `pizza_type_id`
- `name`
- `category`
- `ingredients`

**orders**
- `order_id`
- `date`
- `time`

**order_details**
- `order_details_id`
- `order_id`
- `pizza_id`
- `quantity`

## Analysis Questions

### Basic Analysis

1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.

### Intermediate Analysis

6. Find the total quantity of each pizza category ordered.
7. Determine the distribution of orders by hour of the day.
8. Find the category-wise distribution of pizzas.
9. Calculate the average number of pizzas ordered per day.
10. Determine the top 3 most ordered pizza types based on revenue.

### Advanced Analysis

11. Calculate the percentage contribution of each pizza type to total revenue.
12. Analyze cumulative revenue generated over time.
13. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

## SQL Concepts Used

- SELECT
- COUNT()
- SUM()
- AVG()
- MAX()
- ROUND()
- JOIN
- GROUP BY
- ORDER BY
- LIMIT
- EXTRACT()
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- PARTITION BY

## Tools Used

- PostgreSQL
- SQL
- pgAdmin 4

## Project Structure

```text
pizza-sales-analysis-postgresql/
│
├── README.md
└── pizza-sales-analysis-postgresql.sql
