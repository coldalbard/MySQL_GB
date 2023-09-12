CREATE DATABASE IF NOT EXISTS seminar5;
USE seminar5;
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
('Charlie', 'Brown', 'Tester', 70000),
('Jonh', 'Doe', 'Enginner', 100000);

SELECT * FROM staff;

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

-- Задание 1
-- Вывести список всех сотрудников и указать место в рейтинге по зарплатам
SELECT DENSE_RANK()
OVER(ORDER BY salary) AS rank_salary,
CONCAT(firstname," ", lastname) AS full_name,
post, salary FROM staff
ORDER BY rank_salary;

-- Задание 2
-- Вывести список всех сотрудников и указать место в рейтинге по зарплатам, но по каждой должности
SELECT DENSE_RANK()
OVER(ORDER BY salary) AS rank_salary,
CONCAT(firstname," ", lastname) AS full_name,
post, salary FROM staff
ORDER BY rank_salary;

-- Задание 3
-- Найти самых высокооплачиваемых сотрудников по каждой должности
SELECT rank_salary, post, salary FROM (SELECT DENSE_RANK()
OVER(PARTITION BY post
ORDER BY salary DESC) AS rank_salary,
CONCAT(firstname," ", lastname) AS full_name,
post, salary FROM staff) AS List
WHERE rank_salary = 1
ORDER BY salary DESC;

-- Задание 4
-- Вывести список всех сотрудников, отсортировав по зарплатам в порядке убывания 
-- и указать на сколько процентов ЗП меньше, чем у сотрудника со следующей (по значению) зарплатой
SELECT
CONCAT(firstname," ", lastname) AS full_name, post, salary, 
ROUND(((LEAD(salary, 1, 0) OVER(ORDER BY salary DESC) - salary) * 100 * -1) / salary, 2) AS more
FROM staff;

-- Задание 5
-- Получить с помощью оконных функции:
-- средний балл ученика
-- наименьшую оценку ученика
-- наибольшую оценку ученика
-- сумму всех оценок ученика
-- количество всех оценок ученика
SELECT name, grade, 
ROUND(AVG(grade) OVER(PARTITION BY name), 2) AS AVG_student,
MIN(grade) OVER(PARTITION BY name) AS MIN_student,
MAX(grade) OVER(PARTITION BY name) AS MAX_student,
SUM(grade) OVER(PARTITION BY name) AS SUM_student,
COUNT(grade) OVER(PARTITION BY name) AS COUNT_student
FROM academic_record;



