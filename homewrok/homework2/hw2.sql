-- 1. Используя операторы языка SQL, 
-- создайте таблицу “sales”. Заполните ее данными.
-- Справа располагается рисунок к первому 
-- заданию.
CREATE SCHEMA homework2;
USE homework2;
CREATE TABLE sales(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);
INSERT INTO sales (order_date, count_product)
VAlUES ("2022-01-01", 156), ("2022-01-02", 180), ("2022-01-03", 21), 
("2022-01-04", 124), ("2022-01-05", 341);
SELECT * FROM sales;



-- 2. Для данных таблицы “sales” укажите тип 
-- заказа в зависимости от кол-ва : 
-- меньше 100 - Маленький заказ
-- от 100 до 300 - Средний заказ
-- больше 300 - Большой заказ
 SELECT 
 id,
 CASE
	 WHEN count_product < 100 THEN 'Маленький заказ'
	 WHEN count_product > 300 THEN 'Большой заказ'
     ELSE 'Средний заказ'
 END AS 'Тип заказа'
 FROM sales;
 
 

 -- 3. Создайте таблицу “orders”, заполните ее значениями
CREATE TABLE orders(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(3) NOT NULL,
    amount FLOAT NOT NULL,
    order_status VARCHAR(10) NOT NULL
);

INSERT INTO orders (employee_id, amount, order_status)
VAlUES ('e03', 15.00, 'open'), ('e01', 25.50, 'open'), ('e05', 100.70, 'closed'),
('e02', 22.18, 'open'), ('e04', 9.50, 'cancelled');
SELECT * FROM orders;

-- Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
-- OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
SELECT id, 
  CASE 
    WHEN order_status = 'open' THEN 'Order is in open state'
    WHEN order_status = 'closed' THEN 'Order is closed'
    WHEN order_status = 'cancelled' THEN 'Order is cancelled'
  END AS full_order_status
FROM orders;



-- 4. Чем 0 отличается от NULL?
-- 0 - это целое число, которое мы можем добавить, вычесть, делить и т.д
-- NULL - это ссылка в ни куда или отсутствие значения.
-- Вспомнил про NullPointerException)