USE seminar2;
-- Задача 1. Создать сущность(таблицу в новой или существующей бд) с подборкой фильмов (movies).
CREATE TABLE movies(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(40) NOT NULL,
    title_en VARCHAR(40) NOT NULL,
    year_movie DATE NOT NULL,
    count_min INT NOT NULL,
    story_line TEXT
    );


-- Задача 2. Заполните табличку тестовыми данными, используя оператор INSERT INTO
ALTER TABLE movies
CHANGE COLUMN year_movie year_movie YEAR(4);

INSERT INTO movies (title, title_en, year_movie, count_min, story_line)
VALUES("Иван Васильевич меняет профессуру", "", "1973", 128, "Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...");

INSERT INTO movies (title, title_en, year_movie, count_min, story_line)
VALUES("Игры разума", "A Beautiful Mind", "2001", 135, "От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.");

INSERT INTO movies (title, title_en, year_movie, count_min, story_line)
VALUES("Форрест Гамп", "Forrest Gump", "1994", 142, "Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.");

INSERT INTO movies (title, title_en, year_movie, count_min, story_line)
VALUES("Назад в будущее", "Back to the Future", "1985", 116, "Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.");



-- Проведите следующие манипуляции с новосозданной таблицей:
-- Удалите атрибут status_active у сущности cinema.

-- Переименуйте сущность movies в cinema.
RENAME TABLE movies TO cinema;
SELECT * FROM cinema;
-- Добавьте сущности cinema новый атрибут status_active (тип BIT) и атрибут genre_id после атрибута title_eng.
ALTER TABLE cinema
ADD status_active BIT DEFAULT b'1';
ALTER TABLE cinema
ADD genre_id INT AFTER title_en;
SELECT * FROM cinema;
-- Добавьте внешний ключ на атрибут genre_id сущности cinema 
-- и направьте его на атрибут id сущности genres(предварительно создав таблицу genres).
CREATE TABLE genres (
	genre_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(20)
);
ALTER TABLE cinema
ADD FOREIGN KEY(genre_id) REFERENCES genres(genre_id);
-- Очистите сущность genres от данных и обнулить автоинкрементное поле.
SELECT * FROM genres;
-- TRUNCATE TABLE genres;



-- Задача 3. Выведите id, название фильма и категорию фильма, согласно следующего перечня:
-- Д- Детская, П – Подростковая, В – Взрослая, Не указана
-- ALTER TABLE cinema
-- DROP COLUMN age_category;
ALTER TABLE cinema
ADD COLUMN age_category VARCHAR(10);
INSERT INTO cinema (age_category)
VALUES (""), (""), ("П"), (""), ("Д");

SELECT
id,
title,
CASE age_category
WHEN 'Д' THEN 'Десткая'
WHEN 'П' THEN 'Подростковая'
WHEN 'В' THEN 'Взрослая'
ELSE 'Не указана'
END AS 'Категория'
FROM cinema;