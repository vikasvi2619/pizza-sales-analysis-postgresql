-- ============================================================
--                       BASIC
-- ============================================================

-- Q1. Retrieve the total number of orders placed.

SELECT COUNT(order_id) AS total_orders
FROM orders;


-- Q2. Calculate the total revenue generated from pizza sales.

SELECT SUM(p.price * od.quantity) AS total_revenue
FROM pizzas p
JOIN order_details od
ON p.pizza_id = od.pizza_id;


-- Q3. Identify the highest-priced pizza.

SELECT pt.name,
       p.price AS highest_price
FROM pizza_types pt
JOIN pizzas p
ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;


-- Q4. Identify the most common pizza size ordered.

SELECT p.size,
       COUNT(od.order_details_id) AS order_count
FROM pizzas p
JOIN order_details od
ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY order_count DESC
LIMIT 1;


-- Q5. List the top 5 most ordered pizza types
-- along with their quantities.

SELECT pt.name,
       SUM(od.quantity) AS quantity
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY quantity DESC
LIMIT 5;


-- ============================================================
--                     INTERMEDIATE
-- ============================================================


-- Q6. Find the total quantity of each pizza category ordered.

SELECT pt.category,
       SUM(od.quantity) AS quantity
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY quantity DESC;


-- Q7. Determine the distribution of orders by hour of the day.

SELECT EXTRACT(HOUR FROM time) AS order_hour,
       COUNT(order_id) AS order_count
FROM orders
GROUP BY EXTRACT(HOUR FROM time)
ORDER BY order_hour;


-- Q8. Find the category-wise distribution of pizzas.

SELECT category,
       COUNT(name) AS pizza_count
FROM pizza_types
GROUP BY category
ORDER BY pizza_count DESC;


-- Q9. Group the orders by date and calculate
-- the average number of pizzas ordered per day.

SELECT ROUND(AVG(quantity), 0) AS avg_pizzas_per_day
FROM (
    SELECT o.date,
           SUM(od.quantity) AS quantity
    FROM orders o
    JOIN order_details od
    ON o.order_id = od.order_id
    GROUP BY o.date
) AS daily_quantity;


-- Q10. Determine the top 3 most ordered pizza types
-- based on revenue.

SELECT pt.name,
       SUM(p.price * od.quantity) AS revenue
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;


-- ============================================================
--                       ADVANCED
-- ============================================================


-- Q11. Calculate the percentage contribution of
-- each pizza type to total revenue.

SELECT
    pt.name,
    SUM(p.price * od.quantity) AS revenue,
    ROUND(
        SUM(p.price * od.quantity) * 100.0 /
        (
            SELECT SUM(p2.price * od2.quantity)
            FROM pizzas p2
            JOIN order_details od2
                ON p2.pizza_id = od2.pizza_id
        ),
        2
    ) AS percentage_contribution
FROM pizza_types pt
JOIN pizzas p
    ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od
    ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY percentage_contribution DESC;

-- Q12. Analyze the cumulative revenue generated over time.

WITH daily_revenue AS (
    SELECT
        o.date,
        SUM(p.price * od.quantity) AS revenue
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    GROUP BY o.date
)
SELECT
    date,
    revenue,
    SUM(revenue) OVER (
        ORDER BY date
    ) AS cumulative_revenue
FROM daily_revenue
ORDER BY date;

-- Q13. Determine the top 3 most ordered pizza types
-- based on revenue for each pizza category.

WITH pizza_revenue AS (
    SELECT pt.category,
           pt.name,
           SUM(od.quantity * p.price) AS revenue
    FROM pizza_types pt
    JOIN pizzas p
    ON pt.pizza_type_id = p.pizza_type_id
    JOIN order_details od
    ON od.pizza_id = p.pizza_id
    GROUP BY pt.category, pt.name
),
ranked_pizzas AS (
    SELECT category,
           name,
           revenue,
           RANK() OVER (
               PARTITION BY category
               ORDER BY revenue DESC
           ) AS rank
    FROM pizza_revenue
)
SELECT category,
       name,
       revenue
FROM ranked_pizzas
WHERE rank <= 3
ORDER BY category, revenue DESC;


-- ============================================================
--                       END
-- ============================================================