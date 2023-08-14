CREATE SCHEMA homework3;
USE homework3;

CREATE TABLE staff
(
id int primary key auto_increment not null,
firstname varchar(40) not NULL,
lastname varchar(40) not NULL,
post varchar(40) not NULL,
seniority int,
salary int,
age int not NULL
);

select * from staff;
insert into staff
values (null, 'Вася', 'Петров', 'Начальник', '40', 100000, 60),
(null,'Петр', 'Власов', 'Начальник', '8', 70000, 30),
(null,'Катя', 'Катина', 'Инженер', '2', 70000, 19),
(null,'Саша', 'Сасин', 'Инженер', '12', 50000, 35),
(null,'Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
(null,'Петр', 'Петров', 'Рабочий', '20', 25000, 40),
(null,'Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
(null,'Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
(null,'Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
(null,'Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
(null,'Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
(null,'Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT * FROM staff
ORDER BY salary DESC;

SELECT * FROM staff
ORDER BY salary ASC;

-- 2. Выведите 5 максимальных заработных плат (salary)
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) AS sumPostSalary FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post)
-- «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT post, COUNT(id) AS COUNT_POST FROM staff
GROUP BY post
HAVING post = "Рабочий";

-- 5. Найдите количество специальностей
SELECT COUNT(post) AS postCOUNT FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, AVG(age) AS AgeAVG FROM staff
GROUP BY post
HAVING AgeAVG < 30;