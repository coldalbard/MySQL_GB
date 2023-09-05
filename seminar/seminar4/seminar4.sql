DROP DATABASE IF EXISTS seminar4;
CREATE DATABASE seminar4;
USE seminar4;
DROP TABLE IF EXISTS teacher;
CREATE TABLE teacher
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teacher
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000),
    (7,"Шарпов",40000),
    (8,"Питошин",30000);
    
SELECT * from teacher; 
DROP TABLE IF EXISTS lesson;
CREATE TABLE lesson
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teacher(id)
);
INSERT INTO lesson(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4),
    ("Нейронные сети", NULL); -- Учитель, который ведет данный предмет, временно отстутствует
    

-- Задачи семинара 4
-- Задание 1. Используя таблицу ниже, выполните объединения Inner Join (Inner outer Join) по следующим условиям:
-- I. Создайте запрос, который покажет список учителей и курсов, которые они ведут.
SELECT teacher.surname, lesson.course FROM teacher
INNER JOIN lesson
WHERE lesson.teacher_id = teacher.id;
-- II. Выведите список учителей с зарплатой выше 25000, которые ведут курсы.
SELECT teacher.surname, teacher.salary FROM teacher
INNER JOIN lesson
ON lesson.teacher_id = teacher.id 
WHERE teacher.salary > 25000;
-- III. Составьте запрос, который выведет курсы, которые ведут учителя с одинаковыми фамилиями.
INSERT INTO lesson(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",6),
    ("Знакомство с веб-технологиями",7);

SELECT t1.surname, l1.course, l2.course
FROM teacher t1
INNER JOIN teacher t2 ON t1.surname = t2.surname AND t1.id != t2.id
INNER JOIN lesson l1 ON t1.id = l1.teacher_id
INNER JOIN lesson l2 ON t2.id = l2.teacher_id;

-- IV. Найдите учителей, которые не ведут курс "Знакомство с веб-технологиями".
SELECT teacher.surname, lesson.course FROM teacher
INNER JOIN lesson
ON lesson.teacher_id = teacher.id
WHERE lesson.course != "Знакомство с веб-технологиями";


-- Задание 2. Используя эту же таблицу, выполните объединения Left Join (Left outer Join) по следующим условиям:
-- I. Список всех учителей и курсы, которые они ведут (если ведут).
SELECT teacher.surname, lesson.course FROM teacher
LEFT JOIN lesson
ON lesson.teacher_id = teacher.id;
-- II. Список учителей с зарплатой ниже 30000 и курсы, которые они ведут (если ведут).
SELECT teacher.surname, lesson.course, teacher.salary FROM teacher
LEFT JOIN lesson
ON lesson.teacher_id = teacher.id
WHERE teacher.salary < 30000;
-- III. Учителя, которые не ведут курсы.
SELECT teacher.surname, lesson.course FROM teacher
LEFT JOIN lesson
ON lesson.teacher_id = teacher.id
WHERE lesson.course IS NULL;
-- IV. Учителя и количество курсов, которые они ведут.
SELECT teacher.id, teacher.surname, COUNT(lesson.id) AS number_of_courses FROM teacher
LEFT JOIN lesson
ON lesson.teacher_id = teacher.id
group by teacher.id;


-- Задание 3. Используя эту же таблицу, выполните объединения Right Join (Right outer Join) по следующим условиям:
-- I. Курсы без учителей.
SELECT teacher.surname, lesson.course FROM teacher
RIGHT JOIN lesson
ON lesson.teacher_id = teacher.id
WHERE lesson.teacher_id IS NULL;
-- II. Курсы и зарплаты учителей, которые их ведут.
SELECT teacher.surname, lesson.course, teacher.salary FROM teacher
RIGHT JOIN lesson
ON lesson.teacher_id = teacher.id;
-- III. Количество учителей для каждого курса.
SELECT lesson.course, COUNT(teacher.id) AS number_of_courses FROM teacher
RIGHT JOIN lesson
ON lesson.teacher_id = teacher.id
group by lesson.course;


-- Задание 4. Используя эту же таблицу, выполните объединения Full Join (Full outer Join) по следующим условиям:
-- I. Список всех учителей и курсов, независимо от того, ведут ли учителя эти курсы или нет.
SELECT teacher.surname, lesson.course FROM teacher
LEFT JOIN lesson
ON lesson.teacher_id = teacher.id
UNION
SELECT teacher.surname, lesson.course FROM teacher
RIGHT JOIN lesson
ON lesson.teacher_id = teacher.id;

-- II. Учителя и курсы, с учетом учителей без курсов и курсов без учителей, сортировка по зарплате.
SELECT teacher.surname, teacher.salary, lesson.course from teacher
LEFT JOIN lesson
ON teacher.id = lesson.teacher_id
UNION
SELECT teacher.surname, teacher.salary, lesson.course from teacher
RIGHT JOIN lesson
ON teacher.id = lesson.teacher_id
ORDER BY salary;

-- III. Учителя и курсы, с учетом учителей без курсов и курсов без учителей, только с зарплатами выше 25000.
SELECT teacher.surname, teacher.salary, lesson.course from teacher
LEFT JOIN lesson
ON teacher.id = lesson.teacher_id
UNION
SELECT teacher.surname, teacher.salary, lesson.course from teacher
RIGHT JOIN lesson
ON teacher.id = lesson.teacher_id
WHERE teacher.salary > 25000;

-- IV. Учителя и курсы, с учетом учителей без курсов и курсов без учителей, сортировка по названию курса.
SELECT teacher.surname, lesson.course from teacher
LEFT JOIN lesson
ON teacher.id = lesson.teacher_id
UNION
SELECT teacher.surname, lesson.course from teacher
RIGHT JOIN lesson
ON teacher.id = lesson.teacher_id
ORDER BY course;


-- Задание 5. Используя эту же таблицу, выполните объединения Cross Join (Cross outer Join) по следующим условиям:
-- I. Список всех возможных комбинаций учителей и курсов.
SELECT teacher.surname, lesson.course from teacher
CROSS JOIN lesson;
-- II. Список всех учителей и курсов с указанием зарплаты учителя.
SELECT teacher.surname, lesson.course, teacher.salary from teacher
CROSS JOIN lesson;
