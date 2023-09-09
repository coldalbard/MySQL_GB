CREATE DATABASE lesson5;
USE lesson5;
CREATE TABLE sales(
	sales_employee VARCHAR(45) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee, fiscal_year)
    );
    INSERT INTO sales(sales_employee, fiscal_year, sale)
    VALUES('Bob', 2016, 100),
    ('Bob', 2017, 150),
    ('Bob', 2018, 200),
    ('Alice', 2016, 150),
    ('Alice', 2017, 100),
    ('Alice', 2018, 200),
    ('John', 2016, 200),
    ('John', 2017, 150),
    ('John', 2018, 250);
    SELECT * FROM sales;
    
    SELECT fiscal_year, SUM(sale)
    FROM sales
    GROUP BY fiscal_year;
    



CREATE TABLE products(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ProductName	VARCHAR(45) NOT NULL,
    Manufacturer VARCHAR(45) NOT NULL,
    ProductCount INT NOT NULL,
    Price INT NOT NULL
);
INSERT INTO products(ProductName, Manufacturer, ProductCount, Price)
VALUES('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('iPhone 7', 'Apple',5 , 32000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 46000),
('Honr 10', 'Huawei', 5, 28000),
('Nokia 8', 'HMD Global', 6, 38000);



CREATE VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer
FROM products
WHERE Manufacturer = 'Apple';

SELECT * FROM CopyProducts;

ALTER VIEW CopyProducts AS
SELECT Price, ProductCount, Manufacturer, ProductName
FROM products
WHERE Manufacturer = 'Apple';

ALTER TABLE test ADD COLUMN TestString VARCHAR(45);
SELECT * FROM test;

DROP VIEW CopyProducts;
