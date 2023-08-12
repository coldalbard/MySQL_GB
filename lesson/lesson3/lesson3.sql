USE lesson3;
INSERT INTO products(ProductName, Manufacturer, ProductCount, Price)
VALUES('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('iPhone 7', 'Apple',5 , 32000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 46000),
('Honr 10', 'Huawei', 5, 28000),
('Nokia 8', 'HMD Global', 6, 38000);

SELECT * FROM products
ORDER BY Price DESC;
-- DESC cортировка по убыванию




SELECT COUNT(*) as COUNT
FROM products;

SELECT SUM(Price) AS TotalSum FROM products;

SELECT MIN(Price) FROM products
WHERE Manufacturer = 'Apple';

SELECT MIN(Price), MAX(Price), AVG(Price) FROM products
WHERE Manufacturer = 'Samsung';

-- AVG: вычисляет среднее значение
-- SUM: вычисляет сумму значений
-- MIN: вычисляет наименьшее значение
-- MAX: вычисляет наибольшее значение
-- COUNT: вычисляет количество строк в запросе




SELECT * FROM products
LIMIT 5;
SELECT * FROM products
LIMIT 2, 3;
-- Ограничение выборки: top, LIMIT


