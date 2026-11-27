INSERT INTO customers (id, name, email) VALUES
(1, 'Иван Иванов', 'ivan@mail.ru'),
(2, 'Мария Петрова', 'maria@mail.ru'),
(3, 'Алексей Смирнов', 'alex@mail.ru'),
(4, 'Елена Кузнецова', 'elena@mail.ru'),
(5, 'Дмитрий Соколов', 'dmitry@mail.ru');

INSERT INTO categories (id, name) VALUES
(1, 'Электроника'),
(2, 'Мебель'),
(3, 'Книги');

INSERT INTO products (id, name, price, category_id) VALUES
(1, 'Смартфон', 50000, 1),
(2, 'Ноутбук', 80000, 1),
(3, 'Наушники', 7000, 1),
(4, 'Стул', 12000, 2),
(5, 'Стол', 18000, 2),
(6, 'Книга по SQL', 900, 3),
(7, 'Книга по Python', 1200, 3);

INSERT INTO orders (id, customer_id, order_date) VALUES
(1, 1, CURRENT_DATE - 2),
(2, 2, CURRENT_DATE - 5),
(3, 3, DATE '2025-06-15'),
(4, 4, CURRENT_DATE - 10);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(2, 4, 1),
(3, 1, 1),
(4, 5, 1);

SELECT setval(pg_get_serial_sequence('customers', 'id'), (SELECT MAX(id) FROM customers));
SELECT setval(pg_get_serial_sequence('categories', 'id'), (SELECT MAX(id) FROM categories));
SELECT setval(pg_get_serial_sequence('products', 'id'), (SELECT MAX(id) FROM products));
SELECT setval(pg_get_serial_sequence('orders', 'id'), (SELECT MAX(id) FROM orders));
