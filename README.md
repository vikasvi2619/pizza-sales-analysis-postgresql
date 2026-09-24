# Pizza Sales Analysis using PostgreSQL

## Project Overview

This project analyzes pizza sales data using PostgreSQL and SQL.

The analysis focuses on orders, pizza types, quantities, pricing, revenue, and ordering patterns. The goal is to practice SQL concepts and answer practical business questions using a relational dataset.

## Database Tables

The project uses four tables:

### 1. `pizzas`
- `pizza_id`
- `pizza_type_id`
- `size`
- `price`

### 2. `pizza_types`
- `pizza_type_id`
- `name`
- `category`
- `ingredients`

### 3. `orders`
- `order_id`
- `date`
- `time`

### 4. `order_details`
- `order_details_id`
- `order_id`
- `pizza_id`
- `quantity`

## Table Relationships

```text
pizza_types
    |
    | pizza_type_id
    v
pizzas
    |
    | pizza_id
    v
order_details
    |
    | order_id
    v
orders
```

## Analysis Questions

The project answers 13 SQL questions covering:

### Basic Analysis
1. Total number of orders placed
2. Total revenue generated from pizza sales
3. Highest-priced pizza
4. Most common pizza size ordered
5. Top 5 most ordered pizza types

### Intermediate Analysis
6. Total quantity of pizzas ordered by category
7. Distribution of orders by hour
8. Category-wise distribution of pizzas
9. Average number of pizzas ordered per day
10. Top 3 pizza types based on revenue

### Advanced Analysis
11. Percentage contribution of each pizza type to total revenue
12. Cumulative revenue generated over time
13. Top 3 pizza types based on revenue for each category

## SQL Concepts Used

- `SELECT`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `ROUND()`
- `JOIN`
- `GROUP BY`
- `ORDER BY`
- `LIMIT`
- `EXTRACT()`
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- `RANK()`
- `PARTITION BY`

## Tools Used

- PostgreSQL
- SQL
- pgAdmin 4

## Project Structure

```text
pizza-sales-analysis-postgresql/
│
├── Pizza_Sales_Analysis.sql
└── README.md
```

## Purpose

This project was created to practice PostgreSQL and develop practical SQL skills for data analysis, including data aggregation, joins, revenue analysis, and advanced analytical queries.
