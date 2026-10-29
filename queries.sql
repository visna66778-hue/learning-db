-- Домашнее задание по SQL и DBeaver
-- База данных SQLite: learning.db

-- 1. Просмотр всех заказов
SELECT *
FROM Orders;

-- 2. Просмотр всех товаров
SELECT *
FROM products;

-- 3. Заказы с названиями товаров и суммой по каждой строке
SELECT
o.id AS order_id,
o.Order_Date AS order_date,
p.name AS product_name,
p.category AS category,
o.Quantity AS quantity,
p.price AS price,
o.Quantity * p.price AS total_amount
FROM Orders AS o
JOIN products AS p
ON o.Product_ID = p.id
ORDER BY o.Order_Date;

-- 4. Общая сумма заказов по категориям
SELECT
p.category AS category,
SUM(o.Quantity * p.price) AS category_total
FROM Orders AS o
JOIN products AS p
ON o.Product_ID = p.id
GROUP BY p.category
ORDER BY category_total DESC;
