DROP DATABASE IF EXISTS homework6;
CREATE DATABASE homework6;
USE homework6;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP FUNCTION IF EXISTS seconds_to_time;
DELIMITER //
CREATE FUNCTION seconds_to_time(seconds INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE sec INT;
    DECLARE minutes INT;
    DECLARE hours INT;
    DECLARE days INT;
    DECLARE result VARCHAR(100);
    
    SET days = FLOOR(((seconds / 60) / 60) / 24);
    SET hours = FLOOR(((seconds / 60) / 60) - days * 24);
    SET minutes = FLOOR((seconds / 60) - (days * 24 * 60 + hours * 60));
    SET sec = FLOOR(seconds - ((days * 24 * 60 * 60) + (hours * 60 * 60) + (minutes * 60)));
    SET result = 
    CONCAT(days, " days ", hours, " hours ", minutes, " minutes ",  sec, " seconds ");
    RETURN result;
END //
DELIMITER ;
SELECT seconds_to_time(123456) AS Time;

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 
-- Данная промежуточная аттестация оценивается по системе 
-- "зачет" / "не зачет" "Зачет" ставится, если слушатель успешно выполнил 
-- 1 или 2 задачи "Незачет" ставится, если слушатель успешно выполнил 0 
-- задач Критерии оценивания: 1 - слушатель верно создал функцию, которая принимает 
-- кол-во сек и формат их в кол-во дней часов. 2 - слушатель выведили 
-- только четные числа от 1 до 10.

DROP FUNCTION IF EXISTS even_nums;
DELIMITER //
CREATE FUNCTION even_nums(last_number int)
RETURNS VARCHAR(245)
DETERMINISTIC
BEGIN
DECLARE result VARCHAR(245) DEFAULT 2;
DECLARE num INT DEFAULT 1;

IF (last_number < 2) THEN
	SET result = "no even numbers were found in this range";
ELSE
	WHILE num <= last_number do
		IF(MOD(num, 2) = 0 AND num != 2) THEN
			SET result = CONCAT(result, ', ', num);
		END IF;
		SET num = num + 1;
	END WHILE;
END IF;
RETURN result;
END //
DELIMITER ;
SELECT even_nums(13);