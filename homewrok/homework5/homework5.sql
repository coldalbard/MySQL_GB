CREATE DATABASE IF NOT EXISTS homework5;
USE homework5;

CREATE TABLE IF NOT EXISTS staff (
  id INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  post VARCHAR(50),
  salary INT
);

INSERT INTO staff (firstname, lastname, post, salary) VALUES
('John', 'Doe', 'Engineer', 80000),
('Jane', 'Doe', 'Manager', 90000),
('Bob', 'Smith', 'Developer', 85000),
('Alice', 'Johnson', 'Designer', 75000),
('Charlie', 'Brown', 'Tester', 70000);

CREATE TABLE IF NOT EXISTS academic_record (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  quartal INT,
  subject VARCHAR(50),
  grade INT
);

INSERT INTO academic_record (name, quartal, subject, grade) VALUES
('Петя', 1, 'физика', 5),
('Петя', 1, 'математика', 4),
('Петя', 2, 'физика', 3),
('Петя', 2, 'математика', 4),
('Петя', 3, 'физика', 4),
('Петя', 3, 'математика', 5),
('Вася', 1, 'физика', 2),
('Вася', 1, 'математика', 3),
('Вася', 2, 'физика', 4),
('Вася', 2, 'математика', 4),
('Маша', 3, 'математика', 5),
('Маша', 1, 'физика', 2),
('Маша', 1, 'математика', 3),
('Маша', 2, 'физика', 4),
('Маша', 2, 'математика', 4);

-- Использовать таблицу: https://drive.google.com/file/d/17Ze0I9hil2AtAZ7_IgGnzMFkHQ3JUnVu/view?usp=sharing
-- Получить информацию об оценках Пети по физике по четвертям:
-- 1. текущая успеваемость
SELECT * FROM academic_record
WHERE name = "Петя" AND subject = "физика";
-- 2. оценка в следующей четверти
SELECT name, quartal, subject, grade,
LEAD(grade) OVER() AS next_quartal_grade
FROM academic_record
WHERE name = "Петя" AND subject = "физика";
-- 3. оценка в предыдущей четверти
SELECT name, quartal, subject, grade,
LAG(grade) OVER() AS past_quartal_grade
FROM academic_record
WHERE name = "Петя" AND subject = "физика";
