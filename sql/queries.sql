SELECT
    c.id,
    c.name,
    SUM(p.price * oi.quantity) AS total_amount
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.order_date >= DATE_TRUNC('month', CURRENT_DATE)
  AND o.order_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month'
GROUP BY c.id, c.name
ORDER BY total_amount DESC;



SELECT
    p.id,
    p.name,
    p.price,
    c.name AS category
FROM products p
JOIN categories c ON p.category_id = c.id
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category_id = p.category_id
)
ORDER BY p.price ASC;



SELECT DISTINCT
    o.id AS order_id,
    o.customer_id,
    o.order_date
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
WHERE c.name = 'Электроника'
ORDER BY o.order_date ASC;



SELECT
    c.id,
    c.name,
    c.email
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
      AND o.order_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year'
      AND o.order_date < DATE_TRUNC('year', CURRENT_DATE)
)
ORDER BY c.name ASC;



SELECT
    p.id,
    p.name,
    p.price
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM order_items oi
    WHERE oi.product_id = p.id
)
ORDER BY p.name ASC;
