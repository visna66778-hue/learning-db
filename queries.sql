-- Домашнее задание по SQL и DBeaver
-- База данных: learning.db (SQLite)

-- 1. Просмотр всех заказов
SELECT *
FROM Orders;

-- 2. Просмотр всех товаров
SELECT *
FROM products;

-- 3. JOIN: заказы с названиями товаров и суммами
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

-- 4. Агрегирующая выборка: сумма по категориям
SELECT
    p.category,
    SUM(o.Quantity * p.price) AS category_total
FROM Orders AS o
JOIN products AS p
    ON o.Product_ID = p.id
GROUP BY p.category
ORDER BY category_total DESC;

-- 5. Поиск товаров по названию с помощью LIKE
SELECT
    id,
    name,
    category,
    price
FROM products
WHERE name LIKE '%phone%';

-- 6. Параметризованный запрос по категории
-- В DBeaver укажи значение параметра category
SELECT
    id,
    name,
    category,
    price
FROM products
WHERE category = :category;

-- 7. Пример безопасного UPDATE
-- Пример закомментирован, чтобы случайно не изменить данные.
-- Перед использованием подставь существующий id товара.
-- UPDATE products
-- SET price = price
-- WHERE id = 1;

-- 8. Пример безопасного DELETE
-- Пример закомментирован, чтобы случайно не удалить данные.
-- Перед использованием проверь id и последствия удаления.
-- DELETE FROM products
-- WHERE id = -1;
