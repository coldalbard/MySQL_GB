use seminar3;
CREATE TABLE staff
(
id int primary key auto_increment not null,
firstname varchar(40) not null,
lastname varchar(40) not null,
post varchar(40) not null,
seniority int,
salary int,
age int not null
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

-- Задачи: Блок 1
-- 1.Выведите все записи, отсортированные по полю "age" по возрастанию
select * from staff
order by age;
-- 2.Выведите все записи, отсортированные по полю “firstname"
select * from staff
order by firstname;
-- 3.Выведите записи полей "firstname ", “lastname", "age", отсортированные по полю 
-- "firstname " в алфавитном порядке по убыванию
select firstname, lastname, age from staff
order by firstname DESC;
-- 4.Выполните сортировку по полям " firstname " и "age" по убыванию
select firstname, lastname, age from staff
order by firstname DESC, age DESC;
-- 5. Выведите уникальные (неповторяющиеся) значения полей "firstname"
select distinct firstname from staff;
-- 6. Отсортируйте записи по возрастанию значений поля "id". 
-- Выведите первые две записи данной выборки
select * from staff limit 2;
-- 7. Отсортируйте записи по возрастанию значений поля "id". 
-- Пропустите первые 4 строки данной выборки и извлеките следующие 3
select * from staff limit 4,3;
-- 8. Отсортируйте записи по убыванию поля "id". 
-- Пропустите две строки данной выборки и извлеките следующие за ними 3 строки
select * from staff 
order by id DESC
limit 2,3;
-- 9. Найдите количество сотрудников с должностью «Рабочий»
select count(*) from staff
where post ="рабочий";
-- 10. Посчитайте ежемесячную зарплату начальников
select sum(salary) from staff
where post ="начальник";
-- 11. Выведите средний возраст сотрудников, у которых заработная плата больше 30000
select avg(age) from staff
where salary > 30000;
-- 12. Выведите максимальную и минимальную заработные платы
select min(salary) AS минимальная, max(salary) AS максимальная from staff;

-- Задачи: Блок 2
CREATE TABLE activity_staff
(
id int primary key auto_increment not null,
staff_id int not null,
date_activity date,
count_page int,
FOREIGN KEY (staff_id) REFERENCES staff (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO activity_staff (staff_id, date_activity, count_page)
VALUES
(1, '2022-01-01', 250),
(2, '2022-01-01', 220),
(3, '2022-01-01', 170),
(1, '2022-01-02', 100),
(2, '2022-01-02', 220),
(3, '2022-01-02', 300),
(7, '2022-01-02', 350),
(1, '2022-01-03', 168),
(2, '2022-01-03', 62),
(3, '2022-01-03', 84);

select * from activity_staff;
-- 1. Выведите общее количество напечатанных страниц каждым сотрудником
SELECT staff_id, SUM(count_page) FROM activity_staff
GROUP BY staff_id;
-- 2. Посчитайте количество страниц за каждый день
SELECT date_activity, SUM(count_page) FROM activity_staff
GROUP BY date_activity;
-- 3. Найдите среднее арифметическое по количеству страниц, напечатанных сотрудниками за каждый день
SELECT date_activity, AVG(count_page) FROM activity_staff
GROUP BY date_activity;
-- 4. Сгруппируйте данные о сотрудниках по возрасту: 
-- 1 группа – младше 20 лет
-- 2 группа – от 20 до 40 лет
-- 3 группа – старше  40 лет 
-- Для каждой группы  найдите суммарную зарплату
SELECT
CASE
	WHEN age < 20 THEN '1 группа'
	WHEN age between 20 AND 40 THEN '2 группа'
	WHEN age > 40 THEN '3 группа'
	ELSE 'Не определено'
	END AS name_age, SUM(salary)
FROM staff
GROUP BY name_age;
-- 5. Выведите id сотрудников, которые напечатали более 500 страниц за все дни
SELECT staff_id, SUM(count_page) AS COUNT FROM activity_staff
GROUP BY staff_id
HAVING COUNT > 500;
-- 6. Выведите  дни, когда работало более 3 сотрудников Также укажите кол-во сотрудников, 
-- которые работали в выбранные дни.
SELECT date_activity, SUM(count_page) AS COUNT FROM activity_staff
GROUP BY date_activity
HAVING COUNT > 500;
-- Выведите должности, у которых средняя заработная плата составляет более 30000
SELECT post, AVG(salary) AS AVG_SALARY FROM staff
GROUP BY post
HAVING AVG_SALARY > 30000;