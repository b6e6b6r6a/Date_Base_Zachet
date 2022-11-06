-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookk`
--

DROP TABLE IF EXISTS `bookk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookk` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `amount` int NOT NULL,
  `buy` int DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookk`
--

LOCK TABLES `bookk` WRITE;
/*!40000 ALTER TABLE `bookk` DISABLE KEYS */;
INSERT INTO `bookk` VALUES (1,'Белая гвардия','Булгаков М.А.',477.19,19,0),(2,'Идиот','Достоевский Ф.М.',331.72,16,0),(3,'Братья Карамазовы','Достоевский Ф.М.',471.81,2,0),(4,'Белая гвардия','Булгаков М.А.',477.19,19,0),(5,'Идиот','Достоевский Ф.М.',331.72,16,0),(6,'Братья Карамазовы','Достоевский Ф.М.',471.81,2,0),(7,'Лирика','Пастернак Б.Л.',465.86,6,0),(8,'Черный человек','Есенин С.А.',503.41,18,0);
/*!40000 ALTER TABLE `bookk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `supply_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`supply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES (1,'Лирика','Пастернак Б.Л.',518.99,2),(2,'Черный человек','Есенин С.А.',570.20,6),(3,'Белая гвардия','Булгаков М.А.',540.50,7),(4,'Идиот','Достоевский Ф.М.',360.80,3);
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 11:00:21
-- 1.6.2
Вывести из таблицы trip информацию о командировках тех сотрудников, фамилия которых заканчивается на букву «а», в отсортированном по убыванию даты последнего дня командировки виде. В результат включить столбцы name, city, per_diem, date_first, date_last.
SELECT name, city, per_diem, date_first, date_last  FROM trip 
WHERE name LIKE '%а %' ORDER BY date_last DESC;

-- 1.6.3
Вывести в алфавитном порядке фамилии и инициалы тех сотрудников, которые были в командировке в Москве.
SELECT name FROM trip 
WHERE city = "Москва" GROUP BY name ORDER BY name ASC;


-- 1.6.4
Для каждого города посчитать, сколько раз сотрудники в нем были.  Информацию вывести в отсортированном в алфавитном порядке по названию городов. Вычисляемый столбец назвать Количество. 
SELECT city, (SELECT  COUNT(city)) AS Количество
FROM trip
GROUP BY city ORDER BY city;


-- 1.6.5
Вывести два города, в которых чаще всего были в командировках сотрудники. Вычисляемый столбец назвать Количество.
SELECT city, (SELECT  COUNT(city)) AS Количество
FROM trip
GROUP BY city ORDER BY Количество DESC LIMIT 2;


-- 1.6.6
Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга (фамилии и инициалы сотрудников, город ,  длительность командировки в днях, при этом первый и последний день относится к периоду командировки). Последний столбец назвать Длительность. Информацию вывести в упорядоченном по убыванию длительности поездки, а потом по убыванию названий городов (в обратном алфавитном порядке).
SELECT name,city, (SELECT  DATEDIFF(date_last, date_first ) + 1) AS Длительность
FROM trip WHERE city <> "Москва" AND city <> "Санкт-Петербург" ORDER BY Длительность DESC ;

-- 1.6.7
Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени. В результат включить столбцы name, city, date_first, date_last.
SELECT name, city, date_first, date_last 
FROM trip 
where DATEDIFF(date_last, date_first) IN (
    SELECT MIN(DATEDIFF(date_last, date_first))
    FROM trip
);          

-- 1.6.8
Вывести информацию о командировках, начало и конец которых относятся к одному месяцу (год может быть любой). В результат включить столбцы name, city, date_first, date_last. Строки отсортировать сначала  в алфавитном порядке по названию города, а затем по фамилии сотрудника .
SELECT name, city, date_first, date_last 
FROM trip 
where MONTH(date_last) = MONTH(date_first) ORDER BY city, name;

-- 1.6.9
Вывести название месяца и количество командировок для каждого месяца. Считаем, что командировка относится к некоторому месяцу, если она началась в этом месяце. Информацию вывести сначала в отсортированном по убыванию количества, а потом в алфавитном порядке по названию месяца виде. Название столбцов – Месяц и Количество.
SELECT  MONTHNAME(date_first) AS Месяц, Count(MONTHNAME(date_first)) AS Количество
FROM trip 
GROUP BY Месяц ORDER BY Количество DESC, Месяц;

-- 1.6.10
Вывести сумму суточных (произведение количества дней командировки и размера суточных) для командировок, первый день которых пришелся на февраль или март 2020 года. Значение суточных для каждой командировки занесено в столбец per_diem. Вывести фамилию и инициалы сотрудника, город, первый день командировки и сумму суточных. Последний столбец назвать Сумма. Информацию отсортировать сначала  в алфавитном порядке по фамилиям сотрудников, а затем по убыванию суммы суточных.
SELECT name, city, date_first, (DATEDIFF(date_last, date_first) +1) * per_diem  AS  Сумма 
FROM trip 
WHERE MONTH(date_first) = 2 OR MONTH(date_first) = 3 ORDER BY name, Сумма DESC;


-- 1.6.11
Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки для тех сотрудников, которые были в командировках больше чем 3 раза, в отсортированном по убыванию сумм суточных виде. Последний столбец назвать Сумма.
SELECT name, SUM((DATEDIFF(date_last, date_first) + 1) * per_diem) AS Сумма
FROM trip 
WHERE name IN (
    SELECT name
    FROM trip
    GROUP BY name 
    HAVING COUNT(name) > 3)
GROUP BY name 
ORDER BY Сумма DESC;

--  1.7.2
Создать таблицу fine следующей структуры
CREATE TABLE fine(
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    number_plate VARCHAR(6),
    violation VARCHAR(50),
    sum_fine DECIMAL(8,2),
    date_violation DATETIME,
    date_payment DATETIME	
);

-- 1.7.3
В таблицу fine первые 5 строк уже занесены. Добавить в таблицу записи с ключевыми значениями 6, 7, 8.
INSERT INTO fine(name, number_plate, violation, sum_fine, date_violation, date_payment)
values('Баранов П.Е.', 'Р523ВТ', 'Превышение скорости(от 40 до 60)', null, '2020-02-14', null),
('Абрамова К.А.', 'О111АВ', 'Проезд на запрещающий сигнал', null, '2020-02-23', null),
('Яковлев Г.Р.', 'Т330ТТ', 'Проезд на запрещающий сигнал', null, '2020-03-03', null);

-- 1.7.4
Занести в таблицу fine суммы штрафов, которые должен оплатить водитель, в соответствии с данными из таблицы traffic_violation. При этом суммы заносить только в пустые поля столбца  sum_fine.
UPDATE fine
SET sum_fine=(SELECT sum_fine FROM traffic_violation WHERE traffic_violation.violation=fine.violation)
WHERE sum_fine is NULL

-- 1.7.5
Вывести фамилию, номер машины и нарушение только для тех водителей, которые на одной машине нарушили одно и то же правило   два и более раз. При этом учитывать все нарушения, независимо от того оплачены они или нет. Информацию отсортировать в алфавитном порядке, сначала по фамилии водителя, потом по номеру машины и, наконец, по нарушению.
/*SELECT name, number_plate, violation
from fine
group by name, number_plate, violation
having count(*) > 1;*/;

-- 1.7.6
В таблице fine увеличить в два раза сумму неоплаченных штрафов для отобранных на предыдущем шаге записей. 
create table  NewTable AS 
(
    select name, number_plate, violation from fine 
GROUP BY name, number_plate, violation 
HAVING count(violation)>1
ORDER BY name, number_plate, violation
); 
UPDATE fine, NewTable 
SET sum_fine=sum_fine*2 
WHERE 
fine.name=NewTable.name AND fine.number_plate=NewTable.number_plate AND  fine.violation=NewTable.violation
AND fine.date_payment IS NULL; 
select * from fine;

-- 1.7.7
Необходимо:
в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
уменьшить начисленный штраф в таблице fine в два раза  (только для тех штрафов, информация о которых занесена в таблицу payment) , если оплата произведена не позднее 20 дней со дня нарушения.
UPDATE fine f, payment p
SET f.date_payment = p.date_payment,
    f.sum_fine = IF(DATEDIFF(f.date_payment, f.date_violation) <= 20, f.sum_fine / 2, f.sum_fine)
WHERE f.name = p.name AND
      f.number_plate = p.number_plate AND
      f.violation = p.violation AND
      f.date_violation = p.date_violation AND
      f.date_payment IS NULL;

SELECT name, violation, sum_fine, date_violation, date_payment
FROM fine;

-- 1.7.8
Создать новую таблицу back_payment, куда внести информацию о неоплаченных штрафах (Фамилию и инициалы водителя, номер машины, нарушение, сумму штрафа  и  дату нарушения) из таблицы fine.
CREATE TABLE back_payment
    (SELECT name, number_plate, violation, sum_fine, date_violation
     FROM fine
     WHERE date_payment IS NULL);
     
SELECT * FROM back_payment;

-- 1.7.9
Удалить из таблицы fine информацию о нарушениях, совершенных раньше 1 февраля 2020 года. Удалить из таблицы fine информацию о нарушениях, совершенных раньше 1 февраля 2020 года. 
DELETE FROM fine
WHERE date_violation <'2020-02-01';
SELECT * FROM fine;

-- 1.8.2
На данном шаге можно найти шаги курса, в которых встречаются ключевые слова SQL, которые рассматриваются в курсе.
Для этого скопируйте один из запросов в окно решений, укажите нужные ключевые слова и запустите запрос. В окне решений будут выведены ссылки на соответствующие шаги.
Это НЕ ЗАДАНИЕ, а просто запросы, с помощью которых можно найти шаги, в которых встречаются те или иные ключевые слова. Выполнять не обязательно (это задание оценивается в 0 баллов). Это ПРОСТО ПОМОЩЬ для навигации по курсу.
SELECT 
   CONCAT(module_id,'.',lesson_position,".",step_position," ", CONCAT(LEFT(step_name, 50), '...')) AS Шаг,
   note AS Примечание
FROM step
        INNER JOIN lesson USING(lesson_id)
        INNER JOIN module USING(module_id)
        INNER JOIN step_keyword USING(step_id)
        INNER JOIN keyword USING(keyword_id)
WHERE keyword_name = 'DISTINCT'
ORDER BY 1;

-- 2.1.6
Создать таблицу author следующей структуры:
CREATE TABLE author (
        author_id	INT PRIMARY KEY AUTO_INCREMENT,
        name_author	VARCHAR(50)
);

-- 2.1.7
Заполнить таблицу author. В нее включить следующих авторов:

Булгаков М.А.
Достоевский Ф.М.
Есенин С.А.
Пастернак Б.Л.
insert into author (name_author) 
values ('Булгаков М.А.'), ('Достоевский Ф.М.'), ('Есенин С.А.'), ('Пастернак Б.Л.');

-- 2.1.8
Перепишите запрос на создание таблицы book , чтобы ее структура соответствовала структуре, показанной на логической схеме (таблица genre уже создана, порядок следования столбцов - как на логической схеме в таблице book, genre_id  - внешний ключ) . Для genre_id ограничение о недопустимости пустых значений не задавать. В качестве главной таблицы для описания поля  genre_idиспользовать таблицу genre следующей структуры:
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL,
    genre_id INT,
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id),
    FOREIGN KEY (genre_id)  REFERENCES genre (genre_id)
);
-- 2.1.9
Создать таблицу book той же структуры, что и на предыдущем шаге. Будем считать, что при удалении автора из таблицы author, должны удаляться все записи о книгах из таблицы book, написанные этим автором. А при удалении жанра из таблицы genre для соответствующей записи book установить значение Null в столбце genre_id. 
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL,
    genre_id INT,
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id)  REFERENCES genre (genre_id) ON DELETE SET NULL
);

-- 2.1.11
Добавьте три последние записи (с ключевыми значениями 6, 7, 8) в таблицу book, первые 5 записей уже добавлены:
INSERT INTO book (title, author_id, genre_id, price, amount)
VALUES ('Стихотворения и поэмы',3,2,650.00,15),
 ('Черный человек',3,2,570.20,6),
('Лирика',4,2,518.99,2);

-- 2.2.2
Вывести название, жанр и цену тех книг, количество которых больше 8, в отсортированном по убыванию цены виде.
SELECT title, name_genre, price
FROM
genre INNER JOIN book
ON genre.genre_id = book.genre_id
WHERE amount >8 ORDER BY price DESC ;

-- 2.2.3
Вывести все жанры, которые не представлены в книгах на складе.
SELECT name_genre
FROM genre LEFT JOIN book
ON genre.genre_id = book.genre_id
WHERE book.genre_id IS NULL;

-- 2.2.4
Необходимо в каждом городе провести выставку книг каждого автора в течение 2020 года. Дату проведения выставки выбрать случайным образом. Создать запрос, который выведет город, автора и дату проведения выставки. Последний столбец назвать Дата. Информацию вывести, отсортировав сначала в алфавитном порядке по названиям городов, а потом по убыванию дат проведения выставок.
SELECT name_city, name_author, (DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY)) as Дата
FROM 
    city, author    
    ORDER by name_city, Дата desc;
    
-- 2.2.5
Вывести информацию о книгах (жанр, книга, автор), относящихся к жанру, включающему слово «роман» в отсортированном по названиям книг виде.
SELECT name_genre, title, name_author
FROM
    book
    INNER JOIN  author ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre LIKE 'Роман' ORDER BY title;

-- 2.2.6
Посчитать количество экземпляров  книг каждого автора из таблицы author.  Вывести тех авторов,  количество книг которых меньше 10, в отсортированном по возрастанию количества виде. Последний столбец назвать Количество.
SELECT name_author, SUM(amount) AS Количество
FROM 
    author LEFT JOIN book
    on author.author_id = book.author_id
GROUP BY name_author
HAVING SUM(amount) < 10 OR SUM(amount) IS NULL
ORDER BY Количество;

-- 2.2.7
Вывести в алфавитном порядке всех авторов, которые пишут только в одном жанре. Поскольку у нас в таблицах так занесены данные, что у каждого автора книги только в одном жанре,  для этого запроса внесем изменения в таблицу book. Пусть у нас  книга Есенина «Черный человек» относится к жанру «Роман», а книга Булгакова «Белая гвардия» к «Приключениям» (эти изменения в таблицы уже внесены).
SELECT name_author
FROM 
    author INNER JOIN book
    on author.author_id = book.author_id
GROUP BY name_author
        HAVING COUNT(distinct(genre_id)) = 1;
        
-- 2.2.8
Вывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра, цену и количество экземпляров книги), написанных в самых популярных жанрах, в отсортированном в алфавитном порядке по названию книг виде. Самым популярным считать жанр, общее количество экземпляров книг которого на складе максимально.
SELECT   title, name_author, name_genre, price, amount
FROM 
    book 
    INNER JOIN genre ON book.genre_id = genre.genre_id
    INNER JOIN author ON  book.author_id = author.author_id
WHERE genre.genre_id IN
         (SELECT query_in_1.genre_id
          FROM 
              (SELECT genre_id, SUM(amount) AS sum_amount
                FROM book
                GROUP BY genre_id
               )query_in_1
          INNER JOIN 
              ( SELECT genre_id, SUM(amount) AS sum_amount
                FROM book
                GROUP BY genre_id
                ORDER BY sum_amount DESC
                LIMIT 1
               ) query_in_2
          ON query_in_1.sum_amount= query_in_2.sum_amount
         ) ORDER BY title;
         
-- 2.2.9
Если в таблицах supply  и book есть одинаковые книги, которые имеют равную цену,  вывести их название и автора, а также посчитать общее количество экземпляров книг в таблицах supply и book,  столбцы назвать Название, Автор  и Количество.
SELECT title AS Название, name_author AS Автор, SUM(book.amount + supply.amount) AS Количество
FROM supply
INNER JOIN book USING(price,title)
INNER JOIN author ON author.name_author = supply.author
GROUP BY author.name_author, book.title;

-- 2.2.10
Придумайте один или несколько запросов для таблиц book,  author, genre и city. Проверьте, правильно ли они работают.
При желании можно формулировку запросов  разместить в комментариях. 
Размещенные задания можно использовать для закрепления материала урока.
Оценивайте понравившиеся Вам запросы.
В последнем модуле создан отдельный урок, в котором мы разместим запросы, набравшие наибольшее количество лайков. 
SELECT title AS Название, name_author AS Автор, SUM(book.amount + supply.amount) AS Количество
FROM supply
INNER JOIN book USING(price,title)
INNER JOIN author ON author.name_author = supply.author
GROUP BY author.name_author, book.title;

-- 2.3.2
Для книг, которые уже есть на складе (в таблице book), но по другой цене, чем в поставке (supply),  необходимо в таблице book увеличить количество на значение, указанное в поставке,  и пересчитать цену. А в таблице  supply обнулить количество этих книг. Формула для пересчета цены:
UPDATE book
INNER JOIN author ON author.author_id = book.author_id
INNER JOIN supply ON book.title = supply.title
and supply.author = author.name_author
SET book.price = (book.price * book.amount + supply.price * supply.amount)/(book.amount + supply.amount) , book.amount = book.amount + supply.amount, supply.amount = 0
WHERE book.price <> supply.price;

SELECT * FROM book;

SELECT * FROM supply;

-- 2.3.3
Включить новых авторов в таблицу author с помощью запроса на добавление, а затем вывести все данные из таблицы author.  Новыми считаются авторы, которые есть в таблице supply, но нет в таблице author.
INsert into author (name_author)
SELECT supply.author
FROM  author
RIGHT JOIN supply on author.name_author = supply.author
WHERE name_author IS Null;

select * from author;

-- 2.3.4
Добавить новые книги из таблицы supply в таблицу book на основе сформированного выше запроса. Затем вывести для просмотра таблицу book.
INSERT INTO book(title, author_id, price, amount)
SELECT title, author_id, price, amount
FROM
author
INNER JOIN supply ON author.name_author = supply.author
WHERE amount <> 0;

SELECT * FROM book;

-- 2.3.5
Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», а для книги «Остров сокровищ» Стивенсона - «Приключения». (Использовать два запроса).
UPDATE book
SET genre_id = 
      (
       SELECT genre_id 
       FROM genre 
       WHERE name_genre = 'Поэзия'
      )
WHERE book_id = 10;

SELECT * FROM book;

UPDATE book
SET genre_id = 
      (
       SELECT genre_id 
       FROM genre 
       WHERE name_genre = 'Приключения'
      )
WHERE book_id = 11;

SELECT * FROM book;

-- 2.3.6
Удалить всех авторов и все их книги, общее количество книг которых меньше 20.
DELETE FROM author
WHERE author_id IN(
SELECT author_id
FROM book
GROUP BY author_id
HAVING SUM(amount) < 20
);
SELECT * FROM book;

-- 2.3.7
Удалить все жанры, к которым относится меньше 4-х книг. В таблице book для этих жанров установить значение Null.
DELETE FROM genre
WHERE genre_id IN(
SELECT genre_id
FROM book
GROUP BY genre_id
HAVING COUNT(book_id) < 4
);
SELECT * FROM book;

SELECT * FROM genre;

-- 2.3.8
Удалить всех авторов, которые пишут в жанре "Поэзия". Из таблицы book удалить все книги этих авторов. В запросе для отбора авторов использовать полное название жанра, а не его id.
DELETE FROM author 
USING 
    author
     INNER JOIN book ON author.author_id = book.author_id
     INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre LIKE "Поэзия";

SELECT * FROM author;

SELECT * FROM book;

-- 2.3.9
Придумайте один или несколько запросов корректировки данных для таблиц book,  author, genre и supply . Проверьте, правильно ли они работают.
При желании можно формулировку запросов  разместить в комментариях. 
Размещенные задания можно использовать для закрепления материала урока.
Оценивайте понравившиеся Вам запросы.
В последнем модуле создан отдельный урок, в котором мы разместим запросы, набравшие наибольшее количество лайков. 
DELETE FROM author 
USING 
    author
     INNER JOIN book ON author.author_id = book.author_id
     INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE name_genre LIKE "Поэзия";

SELECT * FROM author;

SELECT * FROM book;

-- 2.4.5
Вывести все заказы Баранова Павла (id заказа, какие книги, по какой цене и в каком количестве он заказал) в отсортированном по номеру заказа и названиям книг виде.
SELECT buy.buy_id,title,  price, buy_book.amount
FROM client INNER JOIN buy USING(client_id)
    INNER JOIN buy_book USING(buy_id)
    INNER JOIN book USING(book_id)
WHERE name_client = 'Баранов Павел'
ORDER BY buy_id, book.title;

-- 2.4.6
Посчитать, сколько раз была заказана каждая книга, для книги вывести ее автора (нужно посчитать, в каком количестве заказов фигурирует каждая книга).  Вывести фамилию и инициалы автора, название книги, последний столбец назвать Количество. Результат отсортировать сначала  по фамилиям авторов, а потом по названиям книг.
SELECT name_author, title, COUNT(buy_book.amount) AS Количество 
FROM author 
INNER JOIN book USING(author_id) 
LEFT JOIN buy_book USING(book_id) 
GROUP BY book.title, name_author 
ORDER BY name_author, title;

-- 2.4.7
Вывести города, в которых живут клиенты, оформлявшие заказы в интернет-магазине. Указать количество заказов в каждый город, этот столбец назвать Количество. Информацию вывести по убыванию количества заказов, а затем в алфавитном порядке по названию городов.
SELECT name_city, COUNT(buy_id) AS 'Количество' FROM 
city
inner join client ON city.city_id = client.city_id
inner join buy ON client.client_id = buy.client_id
group by  name_city 
ORDER BY name_city ASC;

-- 2.4.8
Вывести номера всех оплаченных заказов и даты, когда они были оплачены.
SELECT buy_id, date_step_end
FROM buy_step
WHERE step_id = 1 AND date_step_end IS NOT NULL
ORDER BY date_step_end;

-- 2.4.9
Вывести информацию о каждом заказе: его номер, кто его сформировал (фамилия пользователя) и его стоимость (сумма произведений количества заказанных книг и их цены), в отсортированном по номеру заказа виде. Последний столбец назвать Стоимость.
select buy_id,name_client,sum(book.price*buy_book.amount) as Стоимость
from buy_book
join buy using(buy_id)
JOIN client using(client_id)
join book using(book_id)
Group BY buy_id,name_client
  ORDER BY buy_id;
  
-- 2.4.10
Вывести номера заказов (buy_id) и названия этапов,  на которых они в данный момент находятся. Если заказ доставлен –  информацию о нем не выводить. Информацию отсортировать по возрастанию buy_id.
SELECT buy_id, name_step
FROM step INNER JOIN buy_step ON step.step_id = buy_step.step_id
WHERE date_step_beg IS NOT NULL AND date_step_end IS NULL
ORDER BY buy_id;

-- 2.4.11
В таблице city для каждого города указано количество дней, за которые заказ может быть доставлен в этот город (рассматривается только этап Транспортировка). Для тех заказов, которые прошли этап транспортировки, вывести количество дней за которое заказ реально доставлен в город. А также, если заказ доставлен с опозданием, указать количество дней задержки, в противном случае вывести 0. В результат включить номер заказа (buy_id), а также вычисляемые столбцы Количество_дней и Опоздание. Информацию вывести в отсортированном по номеру заказа виде.
SELECT
  buy_step.buy_id,
  datediff(date_step_end, date_step_beg) as 'Количество_дней',
  IF(days_delivery - datediff(date_step_end, date_step_beg)>0, 0,abs(days_delivery - datediff(date_step_end,           date_step_beg)))  as 'Опоздание'
FROM
  buy_step
  INNER JOIN step
  ON buy_step.step_id = step.step_id
  INNER JOIN buy
  ON buy_step.buy_id = buy.buy_id
  INNER JOIN client
  ON buy.client_id = client.client_id
  INNER JOIN city
  ON client.city_id = city.city_id
WHERE
  name_step IN ('Транспортировка')
  and
  date_step_end IS NOT NULL;
  
-- 2.4.12
Выбрать всех клиентов, которые заказывали книги Достоевского, информацию вывести в отсортированном по алфавиту виде. В решении используйте фамилию автора, а не его id.
select distinct name_client
from client
inner join buy using(client_id)
inner join buy_book using(buy_id)
inner join book using(book_id)
inner join author using(author_id)
where name_author like 'Достоевск%'
order by name_client;

-- 2.4.13
Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг, указать это количество. Последний столбец назвать Количество.
SELECT name_genre, Количество
FROM
    (SELECT name_genre, sum(amount_1) as Количество
        FROM (SELECT book_id, SUM(amount) AS amount_1
        FROM buy_book
        GROUP BY book_id) AS temp
        INNER JOIN book ON temp.book_id = book.book_id
        INNER JOIN genre ON book.genre_id = genre.genre_id
        GROUP BY name_genre) as k
        where k.Количество IN (SELECT MAX(t.Количество) as n
                               FROM( SELECT name_genre, sum(amount_1) as Количество
                               FROM (SELECT book_id, SUM(amount) AS amount_1
                               FROM buy_book
                               GROUP BY book_id) AS temp
                               INNER JOIN book ON temp.book_id = book.book_id
                               INNER JOIN genre ON book.genre_id = genre.genre_id
                               GROUP BY name_genre) as t);
                               
-- 2.4.14
Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы. Для этого вывести год, месяц, сумму выручки в отсортированном сначала по возрастанию месяцев, затем по возрастанию лет виде. Название столбцов: Год, Месяц, Сумма.
SELECT YEAR(date_payment) AS Год, MONTHNAME(date_payment)AS Месяц, SUM(price*amount) AS Сумма
FROM buy_archive
GROUP BY Год, Месяц
UNION
SELECT YEAR(date_step_end) AS Год, MONTHNAME(date_step_end)AS Месяц, SUM(price*buy_book.amount) AS Сумма
FROM buy_step
        INNER JOIN buy_book USING(buy_id)
    INNER JOIN book USING(book_id)
        where date_step_end is not null and step_id = 1
        GROUP BY Год, Месяц
        ORDER BY Месяц ASC, Год ASC;
        
-- 2.4.15
Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров и их стоимости за 2020 и 2019 год . Вычисляемые столбцы назвать Количество и Сумма. Информацию отсортировать по убыванию стоимости.
SELECT title, sum(Количество) as 'Количество', sum(Сумма) as 'Сумма'
FROM
(select title, sum(buy_archive.amount) as 'Количество', sum(buy_archive.price*buy_archive.amount) as 'Сумма' from buy_archive
JOIN book USING(book_id)
group by title
union all
select title, sum(buy_book.amount) as 'Количество', sum(price*buy_book.amount) as 'Сумма' from book
JOIN buy_book using (book_id)
JOIN buy_step using (buy_id)
JOIN step using (step_id)
where step.name_step = 'Оплата' and buy_step.date_step_end is not null
group by title) as query_in
group by title
order by Сумма desc  ;

-- 2.4.16
Придумайте один или несколько запросов на выборку для предметной области «Интернет-магазин книг» (в таблицы занесены данные, как на первом шаге урока). Проверьте, правильно ли они работают.
При желании можно формулировку запросов  разместить в комментариях. 
Размещенные задания можно использовать для закрепления материала урока.
Оценивайте понравившиеся Вам запросы.
В последнем модуле создан отдельный урок, в котором мы разместим запросы, набравшие наибольшее количество лайков.
SELECT title, sum(Количество) as 'Количество', sum(Сумма) as 'Сумма'
FROM
(select title, sum(buy_archive.amount) as 'Количество', sum(buy_archive.price*buy_archive.amount) as 'Сумма' from buy_archive
JOIN book USING(book_id)
group by title
union all
select title, sum(buy_book.amount) as 'Количество', sum(price*buy_book.amount) as 'Сумма' from book
JOIN buy_book using (book_id)
JOIN buy_step using (buy_id)
JOIN step using (step_id)
where step.name_step = 'Оплата' and buy_step.date_step_end is not null
group by title) as query_in
group by title
order by Сумма desc;

-- 2.5.2
Включить нового человека в таблицу с клиентами. Его имя Попов Илья, его email popov@test, проживает он в Москве.
используйте книгу;
INSERT INTO city(name_client,city_id,email) SELECT 'Попов Илья', '1', 'popov@test' FROM city WHERE name_city = 'Москва';
ИЗ * ВЫБЕРИТЕ город;

-- 2.5.3
Создать новый заказ для Попова Ильи. Его комментарий для заказа: «Связаться со мной по вопросу доставки».
INSERT buy (buy_description, client_id) SELECT 'Связаться со мной по вопросу доставки', client_id FROM client WHERE name_client IN ('Попов Илья');

-- 2.5.4
В таблицу buy_book добавить заказ с номером 5. Этот заказ должен содержать книгу Пастернака «Лирика» в количестве двух экземпляров и книгу Булгакова «Белая гвардия» в одном экземпляре.
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (5, (SELECT book_id FROM book JOIN author USING(author_id)  WHERE title='Лирика' AND name_author LIKE 'Пастернак%'), 2),(5, (SELECT book_id  FROM book JOIN author USING(author_id)  WHERE title='Белая Гвардия' AND name_author LIKE 'Булгаков%'), 1);
SELECT * FROM buy_book;

-- 2.5.5
Количество тех книг на складе, которые были включены в заказ с номером 5, уменьшить на то количество, которое в заказе с номером 5  указано.
UPDATE book, buy_book
SET    book.amount = book.amount - buy_book.amount
WHERE  buy_book.buy_id = 5 AND book.book_id = buy_book.book_id;

SELECT * FROM book;

-- 2.5.6
Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить название книг, их автора, цену, количество заказанных книг и  стоимость. Последний столбец назвать Стоимость. Информацию в таблицу занести в отсортированном по названиям книг виде.
 CREATE TABLE buy_pay AS
SELECT 
    title,
    name_author,
    book.price,
    buy_book.amount,
    book.price * buy_book.amount AS 'Стоимость'
FROM
    buy_book
    INNER JOIN book USING (book_id)
    INNER JOIN author USING (author_id)
WHERE
    buy_id = 5
ORDER BY title;

-- 2.5.7
Создать общий счет (таблицу buy_pay) на оплату заказа с номером 5. Куда включить номер заказа, количество книг в заказе (название столбца Количество) и его общую стоимость (название столбца Итого). Для решения используйте ОДИН запрос.
CREATE TABLE buy_pay
SELECT buy_id, sum(buy_book.amount) as Количество, sum(book.price*buy_book.amount) as Итого
FROM buy_book
JOIN book USING(book_id)
JOIN author USING(author_id)
WHERE buy_id=5
GROUP BY 1;

SELECT * FROM buy_pay;

-- 2.5.8
В таблицу buy_step для заказа с номером 5 включить все этапы из таблицы step, которые должен пройти этот заказ. В столбцы date_step_beg и date_step_end всех записей занести Null.
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end)
SELECT buy_id, step_id, Null, Null
FROM buy
CROSS JOIN step
WHERE buy_id = 5;

-- 2.5.9
В таблицу buy_step занести дату 12.04.2020 выставления счета на оплату заказа с номером 5.

Правильнее было бы занести не конкретную, а текущую дату. Это можно сделать с помощью функции Now(). Но при этом в разные дни будут вставляться разная дата, и задание нельзя будет проверить, поэтому  вставим дату 12.04.2020.
UPDATE buy_step SET date_step_beg = '2020-04-12'
WHERE buy_id = 5 AND step_id = 1;

-- 2.5.10
Завершить этап «Оплата» для заказа с номером 5, вставив в столбец date_step_end дату 13.04.2020, и начать следующий этап («Упаковка»), задав в столбце date_step_beg для этого этапа ту же дату.
Реализовать два запроса для завершения этапа и начала следующего. Они должны быть записаны в общем виде, чтобы его можно было применять для любых этапов, изменив только текущий этап. Для примера пусть это будет этап «Оплата».
UPDATE buy_step
SET date_step_end = IF(buy_id = 5 AND step_id = 1, '2020-04-13', date_step_end),
    date_step_beg = IF(buy_id = 5 AND step_id = 2, '2020-04-13', date_step_beg);
    
-- 2.5.11
Придумайте один или несколько запросов корректировки данных для предметной области «Интернет-магазин книг» (в таблицы занесены данные, как на этом шаге). Проверьте, правильно ли они работают.
При желании можно формулировку запросов  разместить в комментариях. 
Размещенные задания можно реализовать для закрепления материала урока.
Оценивайте понравившиеся Вам запросы.
В последнем модуле создан отдельный урок, в котором мы разместим запросы, набравшие наибольшее количество лайков. 
UPDATE buy_step SET date_step_beg = '2020-04-12'
WHERE buy_id = 5 AND step_id = 1;

-- 3.1.2
Вывести студентов, которые сдавали дисциплину «Основы баз данных», указать дату попытки и результат. Информацию вывести по убыванию результатов тестирования.
SELECT name_student, date_attempt, result
FROM student
    INNER JOIN attempt USING(student_id)
    INNER JOIN subject USING(subject_id)
WHERE name_subject = 'Основы баз данных'
ORDER BY result DESC;

-- 3.1.3
Вывести, сколько попыток сделали студенты по каждой дисциплине, а также средний результат попыток, который округлить до 2 знаков после запятой. Под результатом попытки понимается процент правильных ответов на вопросы теста, который занесен в столбец result.  В результат включить название дисциплины, а также вычисляемые столбцы Количество и Среднее. Информацию вывести по убыванию средних результатов.
SELECT name_subject, 
       COUNT(attempt_id) AS Количество,
       ROUND(AVG(result), 2) AS Среднее
FROM subject
       LEFT JOIN attempt USING(subject_id)
GROUP BY name_subject
ORDER BY Среднее DESC;

-- 3.1.4
Вывести студентов (различных студентов), имеющих максимальные результаты попыток. Информацию отсортировать в алфавитном порядке по фамилии студента.
Максимальный результат не обязательно будет 100%, поэтому явно это значение в запросе не задавать.
SELECT name_student, result
FROM student
    INNER JOIN attempt USING(student_id)
WHERE result = (
         SELECT MAX(result) 
         FROM attempt)
ORDER BY name_student;

-- 3.1.5
Если студент совершал несколько попыток по одной и той же дисциплине, то вывести разницу в днях между первой и последней попыткой. В результат включить фамилию и имя студента, название дисциплины и вычисляемый столбец Интервал. Информацию вывести по возрастанию разницы. Студентов, сделавших одну попытку по дисциплине, не учитывать. 
SELECT name_student,
       name_subject, 
       DATEDIFF(MAX(date_attempt), MIN(date_attempt)) AS Интервал
  FROM subject 
       JOIN attempt USING (subject_id)
       JOIN student USING (student_id)
 GROUP BY name_student, name_subject
 HAVING COUNT(attempt_id) > 1 
 ORDER BY 3;  
 
-- 3.1.6
Студенты могут тестироваться по одной или нескольким дисциплинам (не обязательно по всем). Вывести дисциплину и количество уникальных студентов (столбец назвать Количество), которые по ней проходили тестирование . Информацию отсортировать сначала по убыванию количества, а потом по названию дисциплины. В результат включить и дисциплины, тестирование по которым студенты еще не проходили, в этом случае указать количество студентов 0.
SELECT name_subject, COUNT(DISTINCT student_id) AS 'Количество'
FROM subject LEFT JOIN attempt USING(subject_id)
GROUP BY name_subject
ORDER BY COUNT(DISTINCT student_id) DESC, name_subject;

-- 3.1.7
Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных». В результат включите столбцы question_id и name_question.
SELECT question_id, name_question
FROM subject INNER JOIN question USING(subject_id)
WHERE subject.subject_id = 2
ORDER BY RAND()
LIMIT--  3;

-- 3.1.8
Вывести вопросы, которые были включены в тест для Семенова Ивана по дисциплине «Основы SQL» 2020-05-17  (значение attempt_id для этой попытки равно 7). Указать, какой ответ дал студент и правильный он или нет (вывести Верно или Неверно). В результат включить вопрос, ответ и вычисляемый столбец  Результат.
SELECT name_question, 
       name_answer, 
       IF(is_correct, 'Верно', 'Неверно') AS Результат
FROM question
     INNER JOIN testing USING(question_id)
     INNER JOIN answer USING(answer_id)
WHERE attempt_id = 7

-- 3.1.9
Посчитать результаты тестирования. Результат попытки вычислить как количество правильных ответов, деленное на 3 (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до двух знаков после запятой. Вывести фамилию студента, название предмета, дату и результат. Последний столбец назвать Результат. Информацию отсортировать сначала по фамилии студента, потом по убыванию даты попытки.
SELECT name_student, name_subject, date_attempt, 
    ROUND(SUM(is_correct)*100/3,2) Результат
FROM answer
    JOIN testing USING(answer_id)
    JOIN attempt USING(attempt_id)
    JOIN subject USING(subject_id)
    JOIN student USING(student_id)
GROUP BY 1, 2, 3
ORDER BY 1, 3 DESC;

-- 3.1.10
Для каждого вопроса вывести процент успешных решений, то есть отношение количества верных ответов к общему количеству ответов, значение округлить до 2-х знаков после запятой. Также вывести название предмета, к которому относится вопрос, и общее количество ответов на этот вопрос. В результат включить название дисциплины, вопросы по ней (столбец назвать Вопрос), а также два вычисляемых столбца Всего_ответов и Успешность. Информацию отсортировать сначала по названию дисциплины, потом по убыванию успешности, а потом по тексту вопроса в алфавитном порядке.
Поскольку тексты вопросов могут быть длинными, обрезать их 30 символов и добавить многоточие "...".
SELECT name_subject, 
       CONCAT(LEFT(name_question, 30), '...') AS Вопрос, 
       COUNT(t.answer_id) AS Всего_ответов, 
       ROUND(SUM(is_correct) / COUNT(t.answer_id) * 100, 2) AS Успешность
  FROM subject
       JOIN question USING(subject_id)
       JOIN testing t USING(question_id)
       LEFT JOIN answer a USING(answer_id)
 GROUP BY 1, 2
 ORDER BY 1, 4 DESC, 2;
 
--  3.1.11
Придумайте один или несколько запросов на выборку для предметной области «Тестирование» (в таблицы занесены данные, как на первом шаге урока). Проверьте, правильно ли они работают.
При желании можно формулировку запросов  разместить в комментариях. 
Размещенные задания можно реализовать для закрепления материала урока.
 SELECT name_subject, 
       CONCAT(LEFT(name_question, 30), '...') AS Вопрос, 
       COUNT(t.answer_id) AS Всего_ответов, 
       ROUND(SUM(is_correct) / COUNT(t.answer_id) * 100, 2) AS Успешность
  FROM subject
       JOIN question USING(subject_id)
       JOIN testing t USING(question_id)
       LEFT JOIN answer a USING(answer_id)
 GROUP BY 1, 2
 ORDER BY 1, 4 DESC, 2;
 
-- 3.2.2
В таблицу attempt включить новую попытку для студента Баранова Павла по дисциплине «Основы баз данных». Установить текущую дату в качестве даты выполнения попытки.
INSERT INTO attempt(student_id, subject_id, date_attempt)
SELECT 
    (SELECT student_id FROM student WHERE name_student = 'Баранов Павел'), 
    (SELECT subject_id FROM subject WHERE name_subject = 'Основы баз данных'), 
    NOW();
    
-- 3.2.3
Случайным образом выбрать три вопроса (запрос) по дисциплине, тестирование по которой собирается проходить студент, занесенный в таблицу attempt последним, и добавить их в таблицу testing. id последней попытки получить как максимальное значение id из таблицы attempt.
INSERT INTO testing (attempt_id, question_id)
SELECT attempt_id, question_id
FROM question
JOIN attempt USING(subject_id)
WHERE attempt_id = (SELECT MAX(attempt_id) FROM attempt)
ORDER BY RAND()
limit 3;

-- 3.2.4
Студент прошел тестирование (то есть все его ответы занесены в таблицу testing), далее необходимо вычислить результат(запрос) и занести его в таблицу attempt для соответствующей попытки.  Результат попытки вычислить как количество правильных ответов, деленное на 3 (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до целого.
UPDATE attempt
    SET result = (SELECT ROUND((SUM(is_correct)/3)*100, 2)
        FROM answer INNER JOIN testing ON answer.answer_id = testing.answer_id
        WHERE testing.attempt_id = 8)
    WHERE attempt.attempt_id = 8;
    
-- 3.2.5
Удалить из таблицы attempt все попытки, выполненные раньше 1 мая 2020 года. Также удалить и все соответствующие этим попыткам вопросы из таблицы testing, которая создавалась следующим запросом:
DELETE FROM attempt
WHERE date_attempt < '2020-05-01';

-- 3.2.6
Придумайте один или несколько запросов корректировки данных для предметной области «Тестирование» (в таблицы занесены данные, как на первом шаге урока). Проверьте, правильно ли они работают.
SELECT * 
FROM attempt;

-- 3.3.2
Вывести абитуриентов, которые хотят поступать на образовательную программу «Мехатроника и робототехника» в отсортированном по фамилиям виде.
SELECT name_enrollee
FROM enrollee INNER JOIN program_enrollee USING(enrollee_id)
INNER JOIN program USING(program_id)
WHERE name_program = 'Мехатроника и робототехника'
ORDER BY name_enrollee 

-- 3.3.3
Вывести образовательные программы, на которые для поступления необходим предмет «Информатика». Программы отсортировать в обратном алфавитном порядке.
SELECT name_program FROM program
INNER JOIN program_subject USING(program_id)
INNER JOIN subject USING(subject_id)
WHERE name_subject = 'Информатика'
ORDER BY name_program DESC;

-- 3.3.4
Выведите количество абитуриентов, сдавших ЕГЭ по каждому предмету, максимальное, минимальное и среднее значение баллов по предмету ЕГЭ. Вычисляемые столбцы назвать Количество, Максимум, Минимум, Среднее. Информацию отсортировать по названию предмета в алфавитном порядке, среднее значение округлить до одного знака после запятой.
SELECT name_subject, 
       COUNT(enrollee_id) AS Количество,
       MAX(result) AS Максимум,
       MIN(result) AS Минимум,
       ROUND(AVG(result), 1) AS Среднее
FROM subject
       INNER JOIN enrollee_subject USING(subject_id)
GROUP BY 1
ORDER BY 1;

-- 3.3.5
Вывести образовательные программы, для которых минимальный балл ЕГЭ по каждому предмету больше или равен 40 баллам. Программы вывести в отсортированном по алфавиту виде.
SELECT name_program
FROM (
    SELECT name_program, MIN(min_result) r
    FROM program
        NATURAL JOIN program_subject
    GROUP BY 1
    HAVING r >= 40) table1
ORDER BY 1

-- 3.3.6
Вывести образовательные программы, которые имеют самый большой план набора,  вместе с этой величиной.
SELECT name_program, plan
FROM program
WHERE plan = (SELECT MAX(plan) FROM program) 

-- 3.3.7
Посчитать, сколько дополнительных баллов получит каждый абитуриент. Столбец с дополнительными баллами назвать Бонус. Информацию вывести в отсортированном по фамилиям виде.
SELECT name_enrollee,
       IFNULL(SUM(achievement.bonus),0) AS Бонус
FROM enrollee
     LEFT JOIN enrollee_achievement USING(enrollee_id)
     LEFT JOIN achievement USING(achievement_id)
GROUP BY 1
ORDER BY 1;

-- 3.3.8
Выведите сколько человек подало заявление на каждую образовательную программу и конкурс на нее (число поданных заявлений деленное на количество мест по плану), округленный до 2-х знаков после запятой. В запросе вывести название факультета, к которому относится образовательная программа, название образовательной программы, план набора абитуриентов на образовательную программу (plan), количество поданных заявлений (Количество) и Конкурс. Информацию отсортировать в порядке убывания конкурса.
SELECT name_department, name_program, plan,
	COUNT(*) AS Количество,
	ROUND(COUNT(*)/plan ,2) AS Конкурс
FROM program_enrollee
	JOIN program USING (program_id)
	JOIN department USING (department_id)
GROUP BY name_department, name_program, plan
ORDER BY plan, name_program DESC

-- 3.3.9
Вывести образовательные программы, на которые для поступления необходимы предмет «Информатика» и «Математика» в отсортированном по названию программ виде.
SELECT name_program
FROM program
    JOIN program_subject ps USING(program_id)
    JOIN subject s ON ps.subject_id=s.subject_id AND name_subject IN ('Информатика','Математика')
GROUP BY 1
HAVING COUNT(name_subject)=2
ORDER BY 1

-- 3.3.10
Посчитать количество баллов каждого абитуриента на каждую образовательную программу, на которую он подал заявление, по результатам ЕГЭ. В результат включить название образовательной программы, фамилию и имя абитуриента, а также столбец с суммой баллов, который назвать itog. Информацию вывести в отсортированном сначала по образовательной программе, а потом по убыванию суммы баллов виде.
SELECT p.name_program, e.name_enrollee, SUM(es.result) AS itog
FROM program_subject ps
    INNER JOIN program p USING(program_id)
    INNER JOIN program_enrollee pe USING(program_id)
    INNER JOIN enrollee e USING(enrollee_id)
    INNER JOIN enrollee_subject es ON es.subject_id = ps.subject_id AND
                                  es.enrollee_id = pe.enrollee_id
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- 3.3.11
Вывести название образовательной программы и фамилию тех абитуриентов, которые подавали документы на эту образовательную программу, но не могут быть зачислены на нее. Эти абитуриенты имеют результат по одному или нескольким предметам ЕГЭ, необходимым для поступления на эту образовательную программу, меньше минимального балла. Информацию вывести в отсортированном сначала по программам, а потом по фамилиям абитуриентов виде.
Например, Баранов Павел по «Физике» набрал 41 балл, а  для образовательной программы «Прикладная механика» минимальный балл по этому предмету определен в 45 баллов. Следовательно, абитуриент на данную программу не может поступить.
SELECT name_program, name_enrollee
FROM enrollee
     JOIN program_enrollee USING(enrollee_id)
     JOIN program USING(program_id)
     JOIN program_subject USING(program_id)
     JOIN subject USING(subject_id)
     JOIN enrollee_subject USING(subject_id)
WHERE enrollee_subject.enrollee_id = enrollee.enrollee_id and result < min_result
ORDER BY 1, 2

-- 3.3.12
Придумайте один или несколько запросов на выборку для предметной области «Абитуриент» (в таблицы занесены данные, как на первом шаге урока). Проверьте, правильно ли они работают.
SELECT * FROM department;

-- 3.4.2
Создать вспомогательную таблицу applicant,  куда включить id образовательной программы, id абитуриента, сумму баллов абитуриентов (столбец itog) в отсортированном сначала по id образовательной программы, а потом по убыванию суммы баллов виде (использовать запрос из предыдущего урока).
CREATE TABLE applicant
SELECT program_id, enrollee.enrollee_id, SUM(result) AS itog
FROM enrollee
     JOIN program_enrollee USING(enrollee_id)
     JOIN program USING(program_id)
     JOIN program_subject USING(program_id)
     JOIN subject USING(subject_id)
     JOIN enrollee_subject USING(subject_id)
WHERE enrollee_subject.enrollee_id = enrollee.enrollee_id
GROUP BY program_id, enrollee_id
ORDER BY program_id, itog DESC;

-- 3.4.3
Из таблицы applicant, созданной на предыдущем шаге, удалить записи, если абитуриент на выбранную образовательную программу не набрал минимального балла хотя бы по одному предмету (использовать запрос из предыдущего урока).
DELETE FROM applicant
USING
  applicant
  JOIN (
    SELECT program_enrollee.program_id, program_enrollee.enrollee_id 
    FROM program
    JOIN program_subject  USING(program_id)
    JOIN program_enrollee USING(program_id)
    JOIN enrollee_subject ON 
    enrollee_subject.enrollee_id = program_enrollee.enrollee_id AND
    enrollee_subject.subject_id = program_subject.subject_id
    WHERE result < min_result
 ) AS t
 ON applicant.program_id = t.program_id AND
    applicant.enrollee_id = t.enrollee_id
    
-- 3.4.4
Повысить итоговые баллы абитуриентов в таблице applicant на значения дополнительных баллов (использовать запрос из предыдущего урока).
UPDATE applicant JOIN (
    SELECT enrollee_id, IFNULL(SUM(bonus), 0) AS Бонус FROM enrollee_achievement
    LEFT JOIN achievement USING(achievement_id)
    GROUP BY enrollee_id 
    ) AS t USING(enrollee_id)
SET itog = itog + Бонус;

-- 3.4.5
Поскольку при добавлении дополнительных баллов, абитуриенты по каждой образовательной программе могут следовать не в порядке убывания суммарных баллов, необходимо создать новую таблицу applicant_order на основе таблицы applicant. При создании таблицы данные нужно отсортировать сначала по id образовательной программы, потом по убыванию итогового балла. А таблицу applicant, которая была создана как вспомогательная, необходимо удалить.
CREATE TABLE applicant_order
SELECT * FROM applicant
ORDER BY 1, 3 DESC;
DROP TABLE applicant

-- 3.4.6
Включить в таблицу applicant_order новый столбец str_id целого типа , расположить его перед первым.
ALTER TABLE applicant_order ADD
str_id int FIRST

-- 3.4.7
Занести в столбец str_id таблицы applicant_order нумерацию абитуриентов, которая начинается с 1 для каждой образовательной программы.
SET @row_num := 1;
SET @num_pr := 0;
UPDATE applicant_order
SET str_id = IF(program_id = @num_pr, @row_num := @row_num + 1, @row_num := 1 AND @num_pr := @num_pr + 1);

-- 3.4.8
Создать таблицу student,  в которую включить абитуриентов, которые могут быть рекомендованы к зачислению  в соответствии с планом набора. Информацию отсортировать сначала в алфавитном порядке по названию программ, а потом по убыванию итогового балла.
CREATE TABLE student
SELECT name_program, name_enrollee, itog FROM enrollee
	JOIN applicant_order USING (enrollee_id)
	JOIN program USING (program_id)
WHERE str_id<=plan
ORDER BY name_program, itog DESC

-- 3.4.9
Придумайте один или несколько запросов корректировки данных для предметной области «Абитуриент» (в таблицы занесены данные, как на предыдущем шаге, таблица student создана). Проверьте, правильно ли они работают.
SELECT *
FROM applicant_order

-- 3.5.2
Отобрать все шаги, в которых рассматриваются вложенные запросы (то есть в названии шага упоминаются вложенные запросы). Указать к какому уроку и модулю они относятся. Для этого вывести 3 поля:
в поле Модуль указать номер модуля и его название через пробел;
в поле Урок указать номер модуля, порядковый номер урока (lesson_position) через точку и название урока через пробел;
в поле Шаг указать номер модуля, порядковый номер урока (lesson_position) через точку, порядковый номер шага (step_position) через точку и название шага через пробел.
Длину полей Модуль и Урок ограничить 19 символами, при этом слишком длинные надписи обозначить многоточием в конце (16 символов - это номер модуля или урока, пробел и  название Урока или Модуля к ним присоединить "..."). Информацию отсортировать по возрастанию номеров модулей, порядковых номеров уроков и порядковых номеров шагов.
SELECT CONCAT(LEFT(CONCAT(module_id, ' ', module_name), 16), '...') Модуль,
       CONCAT(LEFT(CONCAT(module_id, '.', lesson_position, ' ', lesson_name), 16), '...') Урок,
       CONCAT(module_id, '.', lesson_position, '.', step_position, ' ', step_name) Шаг
  FROM module
       INNER JOIN lesson USING(module_id)
       INNER JOIN step   USING(lesson_id)
 WHERE step_name LIKE '%ложенн% запрос%'
 ORDER BY module_id, lesson_id, step_id;
 
-- 3.5.3
Заполнить таблицу step_keyword следующим образом: если ключевое слово есть в названии шага, то включить в step_keyword строку с id шага и id ключевого слова. 
INSERT INTO step_keyword
SELECT step.step_id, keyword.keyword_id 
FROM 
    keyword
    CROSS JOIN step
WHERE step.step_name REGEXP CONCAT(' ', CONCAT(keyword.keyword_name, '\\b'))
GROUP BY step.step_id, keyword.keyword_id
ORDER BY keyword.keyword_id;

-- 3.5.4
Реализовать поиск по ключевым словам. Вывести шаги, с которыми связаны ключевые слова MAX и AVG одновременно. Для шагов указать id модуля, позицию урока в модуле, позицию шага в уроке через точку, после позиции шага перед заголовком - пробел. Позицию шага в уроке вывести в виде двух цифр (если позиция шага меньше 10, то перед цифрой поставить 0). Столбец назвать Шаг. Информацию отсортировать по первому столбцу в алфавитном порядке.
SELECT 
    concat(module_id,'.',lesson_position,
           IF(step_position < 10, ".0","."),
           step_position," ",step_name) AS Шаг
FROM
   step
   JOIN lesson USING(lesson_id)
   JOIN module USING(module_id)
   JOIN step_keyword USING (step_id)
   JOIN keyword USING(keyword_id)
WHERE keyword_name = 'MAX' OR keyword_name ='AVG'
GROUP BY ШАГ
HAVING COUNT(*) = 2
ORDER BY 1;

-- 3.5.5
Посчитать, сколько студентов относится к каждой группе. Столбцы назвать Группа, Интервал, Количество. Указать границы интервала.
SELECT rate_group Группа, CASE rate_group WHEN 'I'   THEN 'от 0 до 10' WHEN 'II'  THEN 'от 11 до 15'WHEN 'III' THEN 'от 16 до 27' ELSE 'больше 27'END Интервал,
COUNT(*) Количество FROM
(SELECT CASE WHEN COUNT(DISTINCT step_id) <= 10 THEN 'I'WHEN COUNT(DISTINCT step_id) <= 15 THEN 'II'
WHEN COUNT(DISTINCT step_id) <= 27 THEN 'III'
ELSE 'IV' END rate_group FROM step_student WHERE result = 'correct' GROUP BY student_id) query_in
GROUP BY rate_group
ORDER BY 1;

-- 3.5.6
Исправить запрос примера так: для шагов, которые  не имеют неверных ответов,  указать 100 как процент успешных попыток, если же шаг не имеет верных ответов, указать 0. Информацию отсортировать сначала по возрастанию успешности, а затем по названию шага в алфавитном порядке.
WITH table1 (step_name, correct, count) AS (   
SELECT step_name,SUM( IF (result = 'correct' , 1 , 0)) AS s, COUNT(result) AS c FROM step JOIN step_student USING (step_id) GROUP BY step_name)
SELECT  step_name AS Шаг, ROUND((correct/count)*100) AS Успешность
FROM table1
ORDER BY 2, 1

-- 3.5.7
Вычислить прогресс пользователей по курсу. Прогресс вычисляется как отношение верно пройденных шагов к общему количеству шагов в процентах, округленное до целого. В нашей базе данные о решениях занесены не для всех шагов, поэтому общее количество шагов определить как количество различных шагов в таблице step_student.
Тем пользователям, которые прошли все шаги (прогресс = 100%) выдать "Сертификат с отличием". Тем, у кого прогресс больше или равен 80% - "Сертификат". Для остальных записей в столбце Результат задать пустую строку ("").
Информацию отсортировать по убыванию прогресса, затем по имени пользователя в алфавитном порядке.
WITH get_passed (student_name, pssd)
    AS
        (
           SELECT student_name, COUNT(DISTINCT step_id) AS passed
           FROM student JOIN step_student USING(student_id)
           WHERE result = "correct"
           GROUP BY student_id
           ORDER BY passed
         )
SELECT student_name AS Студент, ROUND(100*pssd/(SELECT COUNT(DISTINCT step_id) FROM step_student)) AS Прогресс,
    CASE
        WHEN ROUND(100*pssd/(SELECT COUNT(DISTINCT step_id) FROM step_student)) =  100 THEN "Сертификат с отличием"
        WHEN ROUND(100*pssd/(SELECT COUNT(DISTINCT step_id) FROM step_student)) >= 80 THEN "Сертификат"
        ELSE ""
    END AS Результат
FROM get_passed
ORDER BY Прогресс DESC, Студент

-- 3.5.8
Для студента с именем student_61 вывести все его попытки: название шага, результат и дату отправки попытки (submission_time). Информацию отсортировать по дате отправки попытки и указать, сколько минут прошло между отправкой соседних попыток. Название шага ограничить 20 символами и добавить "...". Столбцы назвать Студент, Шаг, Результат, Дата_отправки, Разница.
SELECT student_name AS Студент, 
    CONCAT(LEFT(step_name, 20), '...') AS Шаг, 
    result AS Результат, 
    FROM_UNIXTIME(submission_time) AS Дата_отправки,
    SEC_TO_TIME(submission_time - LAG(submission_time, 1, submission_time) OVER (ORDER BY submission_time)) AS Разница
FROM student
    INNER JOIN step_student USING(student_id)
    INNER JOIN step USING(step_id)
WHERE student_name = 'student_61'
ORDER BY Дата_отправки;

-- 3.5.9
Посчитать среднее время, за которое пользователи проходят урок по следующему алгоритму:
для каждого пользователя вычислить время прохождения шага как сумму времени, потраченного на каждую попытку (время попытки - это разница между временем отправки задания и временем начала попытки), при этом попытки, которые длились больше 4 часов не учитывать, так как пользователь мог просто оставить задание открытым в браузере, а вернуться к нему на следующий день;
для каждого студента посчитать общее время, которое он затратил на каждый урок;
вычислить среднее время выполнения урока в часах, результат округлить до 2-х знаков после запятой;
вывести информацию по возрастанию времени, пронумеровав строки, для каждого урока указать номер модуля и его позицию в нем.
Столбцы результата назвать Номер, Урок, Среднее_время.
SELECT ROW_NUMBER() OVER (ORDER BY Среднее_время) AS Номер,
    Урок, Среднее_время
FROM(
    SELECT 
        Урок, ROUND(AVG(difference), 2) AS Среднее_время
FROM
     (SELECT student_id,
             CONCAT(module_id, '.', lesson_position, ' ', lesson_name) AS Урок,
             SUM((submission_time - attempt_time) / 3600) AS difference
      FROM module INNER JOIN lesson USING (module_id)
                  INNER JOIN step USING (lesson_id)
                  INNER JOIN step_student USING (step_id)
      WHERE submission_time - attempt_time <= 4 * 3600
      GROUP BY 1, 2) AS query_1
GROUP BY 1) AS TA
order by 3;

-- 3.5.10
Вычислить рейтинг каждого студента относительно студента, прошедшего наибольшее количество шагов в модуле (вычисляется как отношение количества пройденных студентом шагов к максимальному количеству пройденных шагов, умноженное на 100). Вывести номер модуля, имя студента, количество пройденных им шагов и относительный рейтинг. Относительный рейтинг округлить до одного знака после запятой. Столбцы назвать Модуль, Студент, Пройдено_шагов и Относительный_рейтинг  соответственно. Информацию отсортировать сначала по возрастанию номера модуля, потом по убыванию относительного рейтинга и, наконец, по имени студента в алфавитном порядке.
SELECT  module_id AS Модуль, student_name AS Студент, COUNT(DISTINCT step_id) AS Пройдено_шагов ,
	ROUND(COUNT(DISTINCT step_id) / 
      MAX(COUNT(DISTINCT step_id)) OVER(PARTITION BY module_id) *100, 1) AS Относительный_рейтинг
FROM lesson 
	JOIN step USING (lesson_id)
	JOIN step_student USING (step_id)
	JOIN student USING (student_id)
WHERE result = 'correct'
GROUP BY module_id, student_name
ORDER BY 1, 4 DESC, 2

-- 3.5.11
Проанализировать, в каком порядке и с каким интервалом пользователь отправлял последнее верно выполненное задание каждого урока. В базе занесены попытки студентов  для трех уроков курса, поэтому анализ проводить только для этих уроков.
Для студентов прошедших как минимум по одному шагу в каждом уроке, найти последний пройденный шаг каждого урока - крайний шаг, и указать:
имя студента;
номер урока, состоящий из номера модуля и через точку позиции каждого урока в модуле;
время отправки  - время подачи решения на проверку;
разницу во времени отправки между текущим и предыдущим крайним шагом в днях, при этом для первого шага поставить прочерк ("-"), а количество дней округлить до целого в большую сторону.
Столбцы назвать  Студент, Урок,  Макс_время_отправки и Интервал  соответственно. Отсортировать результаты по имени студента в алфавитном порядке, а потом по возрастанию времени отправки.
WITH get_time_lesson(student_name,  lesson, max_submission_time)
AS(SELECT student_name,  CONCAT(module_id, '.', lesson_position), MAX(submission_time)
FROM step_student INNER JOIN step USING (step_id)INNER JOIN lesson USING (lesson_id)INNER JOIN student USING(student_id) WHERE  result = 'correct' GROUP BY 1,2 ORDER BY 1),
get_students(student_name)
AS( SELECT student_name FROM get_time_lesson GROUP BY student_name HAVING COUNT(lesson) = 3)
SELECT student_name as Студент,  lesson as Урок, FROM_UNIXTIME(max_submission_time) as Макс_время_отправки, 
IFNULL(CEIL((max_submission_time - LAG(max_submission_time) OVER (PARTITION BY student_name ORDER BY max_submission_time )) / 86400),'-') as Интервал 
FROM get_time_lesson
WHERE student_name in (SELECT * FROM get_students)
ORDER BY 1,3;

-- 3.5.12
Для студента с именем student_59 вывести следующую информацию по всем его попыткам:
информация о шаге: номер модуля, символ '.', позиция урока в модуле, символ '.', позиция шага в модуле;
порядковый номер попытки для каждого шага - определяется по возрастанию времени отправки попытки;
результат попытки;
время попытки (преобразованное к формату времени) - определяется как разность между временем отправки попытки и времени ее начала, в случае если попытка длилась более 1 часа, то время попытки заменить на среднее время всех попыток пользователя по всем шагам без учета тех, которые длились больше 1 часа;
относительное время попытки  - определяется как отношение времени попытки (с учетом замены времени попытки) к суммарному времени всех попыток  шага, округленное до двух знаков после запятой  .
Столбцы назвать  Студент,  Шаг, Номер_попытки, Результат, Время_попытки и Относительное_время. Информацию отсортировать сначала по возрастанию id шага, а затем по возрастанию номера попытки (определяется по времени отправки попытки).
Важно. Все вычисления производить в секундах, округлять и переводить во временной формат только для вывода результата.
SET @avg_time := (SELECT CEIL(AVG(submission_time - attempt_time))
FROM step_student INNER JOIN student USING(student_id)
WHERE student_name = "student_59" AND (submission_time - attempt_time) < 3600);
WITH get_stat
AS(SELECT student_name, CONCAT(module_id, ".", lesson_position, ".", step_position) AS less, step_id, RANK() OVER (PARTITION BY CONCAT(module_id, ".", lesson_position, ".", step_position) ORDER BY submission_time) AS rang, result, 
CASE WHEN (submission_time - attempt_time) > 3600 THEN @avg_time ELSE (submission_time - attempt_time)
END AS qr FROM student INNER JOIN step_student USING(student_id)INNER JOIN step USING(step_id) INNER JOIN lesson USING(lesson_id) WHERE student_name = "student_59")
SELECT student_name AS Студент, less AS Шаг, rang AS Номер_попытки, result AS Результат, SEC_TO_TIME(CEIL(qr)) AS Время_попытки, ROUND((qr / (SUM(qr) OVER (PARTITION BY less ORDER BY less)) * 100), 2) AS Относительное_время
FROM get_stat
ORDER BY step_id, 3;

-- 3.5.13
Online курс обучающиеся могут проходить по различным траекториям, проследить за которыми можно по способу решения ими заданий шагов курса. Большинство обучающихся за несколько попыток  получают правильный ответ 
и переходят к следующему шагу. Но есть такие, что остаются на шаге, выполняя несколько верных попыток, или переходят к следующему, оставив нерешенные шаги.
Выделив эти "необычные" действия обучающихся, можно проследить их траекторию работы с курсом и проанализировать задания, для которых эти действия выполнялись, а затем их как-то изменить. 
Для этой цели необходимо выделить группы обучающихся по способу прохождения шагов:
I группа - это те пользователи, которые после верной попытки решения шага делают неверную (скорее всего для того, чтобы поэкспериментировать или проверить, как работают примеры);
II группа - это те пользователи, которые делают больше одной верной попытки для одного шага (возможно, улучшают свое решение или пробуют другой вариант);
III группа - это те пользователи, которые не смогли решить задание какого-то шага (у них все попытки по этому шагу - неверные).
Вывести группу (I, II, III), имя пользователя, количество шагов, которые пользователь выполнил по соответствующему способу. Столбцы назвать Группа, Студент, Количество_шагов. Отсортировать информацию по возрастанию номеров групп, потом по убыванию количества шагов и, наконец, по имени студента в алфавитном порядке.
WITH qr AS ( SELECT student_name, step_id, count(result) AS sm FROM step_student INNER JOIN student USING(student_id) WHERE result = "correct" GROUP BY 1, 2
HAVING count(result) > 1 )
SELECT "I" AS Группа, student_name AS Студент, count(step_id) AS Количество_шагов
FROM ( SELECT student_name, step_id, IF(result = "correct" AND submission_time < MAX(submission_time) OVER (PARTITION BY student_name, step_id), IF(LEAD(result) OVER (PARTITION BY student_id, step_id ORDER BY submission_time) = "wrong", 1, 0), 0) AS change_res
FROM step_student INNER JOIN student USING(student_id))qr1
WHERE change_res = 1 GROUP BY 1, 2 UNION  SELECT "II" AS Группа, student_name AS Студент, count(step_id) AS Количество_шагов FROM qr
GROUP BY 1, 2 UNION
SELECT "III" AS Группа, student_name AS Студент, count(DISTINCT step_id) AS Количество_шагов
FROM (SELECT student_id, step_id, SUM(new_result) OVER (PARTITION BY student_id, step_id) AS sum_result FROM ( SELECT student_id, step_id, IF(result = "wrong", 0, 1) AS new_result FROM step_student)qr_1)qr_2 INNER JOIN student USING(student_id) WHERE sum_result = 0
GROUP BY student_id
ORDER BY Группа, Количество_шагов DESC, Студент;

-- 4.1.2
Провести аналитику по трем ценовым категориям (до 600 руб, от 600 руб до 700 руб, свыше 700 руб) и вывести среднюю цену  книги, общую стоимость остатков книг  в этой ценовой позиции и количество позиций. Среднюю цену и стоимость округлить до двух знаков после запятой. Информацию отсортировать по возрастанию нижней границы ценовой категории.
SELECT beg_range, end_range,
     ROUND(AVG(price), 2) AS Средняя_цена,
     SUM(price * amount) AS Стоимость,
     COUNT(amount) AS Количество
FROM(
    SELECT beg_range, end_range, price, amount
    FROM stat 
    JOIN book ON beg_range<price AND end_range>price
    ) table1    
GROUP BY beg_range, end_range
ORDER BY 1

-- 4.1.3
Вывести всю информацию из таблицы book, упорядоченную по возрастанию длины названия книги.
SELECT *
FROM book
ORDER BY LENGTH(title)

-- 4.1.4
Удалить из таблиц book и supplyкниги, цены которых заканчиваются на 99 копеек. Например, книга с ценой 670.99 должна быть удалена.
DELETE book, supply 
FROM book, supply
WHERE book.price LIKE '%.99' 
    AND supply.price LIKE '%.99';

-- 4.1.5
Снизить цены книг, цена которых больше 600 рублей, на 20%. Вывести информацию о книгах, скидку (столбец sale_20) и цену книги со скидкой (price_sale).  Результаты округлить до двух знаков после запятой. Для тех книг, на которые скидка не действует, в последних двух столбцах вывести символ  "-".  Отсортировать информацию сначала по фамилии автора, а потом по названию книги.
SELECT author, title, price, amount,
    IF(price > 600, ROUND(price * 0.2, 2), '-') AS sale_20, 
    IF(price > 600, ROUND(price * 0.8, 2),  '-') AS price_sale
FROM book
ORDER BY author, title

-- 4.1.6
Вывести авторов и суммарную стоимость их книг, если хотя бы одна их книга имеет цену выше средней по складу. Средняя цена рассчитывается как простое среднее, с помощью avg(). Информацию отсортировать по убыванию суммарной стоимости.
ORDER BY 2 DESC;SET @avg_price := (SELECT AVG(price) FROM book);
SELECT author,  
    SUM(price * amount) AS Стоимость 
FROM book
WHERE author in (SELECT author FROM book WHERE price > @avg_price)
GROUP BY author
ORDER BY 2 DESC;

-- 4.1.7
Вывести автора, название, количество, цену (Розничная_цена). Для тех книг количество которых больше или равно 10, отобразить оптовую скидку 15% (Скидка), округлить до двух знаков после запятой и вывести оптовую цену с учетом скидки -15% (Оптовая_цена). Все атрибуты перевести на русский язык. Отсортировать по автору и названию книги.
SELECT author AS "Автор", title AS "Название_книги", amount AS "Количество", price AS "Розничная_цена",
    IF (amount >= 10, 15, 0) AS "Скидка",
    round (IF (amount >= 10, price * 0.85, price), 2) AS "Оптовая_цена"    
FROM book
ORDER BY author, title;

-- 4.1.8
Вывести авторов, у которых есть книги со стоимостью более 500 и количеством более 1 шт на складе. Учитывать книги только тех авторов, у которых не менее 2-х произведений на складе. Вывести автора, количество различных произведений автора, минимальную цену и количество книг на складе. Информацию отсортировать по фамилии автора в алфавитном порядке.
SELECT author, 
    COUNT(author) AS Количество_произведений, 
    MIN(price) AS Минимальная_цена, 
    SUM(amount) AS Число_книг 
FROM book
WHERE amount > 1
GROUP BY author
HAVING COUNT(author) > 1
ORDER BY author;

-- 4.2.1
Магазин счёл, что классика уже не пользуется популярностью, поэтому необходимо в выборке:
1. Сменить всех авторов на "Донцова Дарья".
2. К названию каждой книги в начале дописать "Евлампия Романова и " ( пробел в конце).
3. Цену поднять на 42% (округлить её до двух знаков после запятой).
4. Отсортировать по убыванию цены.
SELECT 'Донцова Дарья' AS author, CONCAT('Евлампия Романова и ', title) AS title, ROUND((price*1.42),2) AS price
FROM book
ORDER BY price DESC;

-- 4.2.2
Вывести жанр(ы), в котором было заказано меньше всего экземпляров книг, указать это количество. Учитывать только жанры, в которых была заказана хотя бы одна книга.
При реализации в основном запросе не используйте LIMIT, поскольку жанров с минимальным количеством заказанных книг может быть несколько.
select name_genre,sum(buy_book.amount) as Количество 
from genre
join book using(genre_id)
join buy_book on buy_book.book_id = book.book_id
group by name_genre
having sum(buy_book.amount) > 1 and sum(buy_book.amount) in (
    select min(aa) from
    (select sum(buy_book.amount) as aa from buy_book
    join book using(book_id)
    group by genre_id) q)

-- 4.2.3
Создать новую таблицу store, в которую занести данные из таблиц book и supply, при условии, что количество книг будет больше среднего количества книг по двум таблицам; если книга есть в обеих таблицах, то стоимость выбрать большую из двух. Отсортировать данные из таблицы их по имени автора в алфавитном порядке и по убыванию цены. Вывести данные из полученной таблицы.
SET @cou := (SELECT ROUND(SUM(amount) / COUNT(amount), 2)
             FROM (SELECT price, amount
                   FROM book 
                   UNION 
                   SELECT price, amount
                   FROM supply) test
            );            

CREATE TABLE store AS
WITH test(title, author, price, amount) AS
(
    SELECT title, author, price, amount
    FROM book
    UNION ALL
    SELECT title, author, price, amount
    FROM supply
    )
SELECT title, author, MAX(price) AS price, SUM(amount) AS amount
FROM test
GROUP BY author, title
HAVING SUM(amount) > @cou
ORDER BY author, price DESC;

SELECT * FROM store

-- 4.2.4
Объявить столбец "категории цены" (price_category): <500 - "низкая", 500 - 700 - "средняя", более 700 - "высокая"
Вывести автора, название, категорию, стоимость (цена * количество), исключив из авторов Есенина, из названий "Белую гвардию". Отсортировать по убыванию стоимости и названию (по возрастанию)
SELECT author, title,
    CASE
        WHEN price < 500 THEN 'низкая'
        WHEN price BETWEEN 500 AND 700 THEN 'средняя'
        ELSE 'высокая'
        END AS price_category, price * amount AS cost
FROM book
WHERE author <> 'Есенин С.А.' AND title <> 'Белая гвардия'
ORDER BY cost DESC, title

-- 4.2.5
Для нечетного количества книг посчитать разницу максимальной стоимости (цена * количество) и стоимостью всех экземпляров конкретной книги. Отсортировать по этой разнице по убыванию. Вывести название, автора, количество, разницу с максимальной стоимостью.
SELECT title, author, amount, (SELECT price * amount
                               FROM book
                               WHERE amount % 2 = 1
                               ORDER BY price * amount DESC
                               LIMIT 1) - amount * price AS Разница_с_макс_стоимостью
FROM book
WHERE amount % 2 = 1
ORDER BY Разница_с_макс_стоимостью DESC

-- 4.2.6
Магазин решил быстрее распродать остатки книг, цена которых выше 600, а также прописать условия доставки. Создать запрос на выборку, в котором:
Столбцы назовите Наименование, Цена и  Стоимость доставки.
Отберите все книги, цена которых выше 600.
Если остаток по отдельной книге меньше или равен 5, то стоимость доставки будет 500 рублей, если больше 5, то доставка будет бесплатной (вместо стоимости доставки вставить Бесплатно).
Отсортируйте значения по убыванию цены книг.
select title as Наименование, price as Цена, case when amount<=5 then 500
                                                   else 'Бесплатно' end as Стоимость_доставки
from book
where price>600
order by price desc;

-- 4.2.7
На распродаже размер скидки устанавливается в зависимости от количества экземпляров книги в магазине и от цены книги: для книг в остатке не менее 5 шт скидка 50%, тогда как для книг в остатке менее 5 шт скидка устанавливается в зависимости от цены (на книги не дешевле 700 руб скидка 20%, на остальные 10%). Два последних столбца назвать Скидка и Цена_со_скидкой.  Последний столбец округлить до двух знаков после запятой.
SELECT author, title, amount, price, IF(amount>=5, '50%', IF(price > 700, '20%', '10%')) AS Скидка,
IF(amount>=5, ROUND(price * 0.5, 2), IF(price > 700, ROUND(price * 0.8,2), ROUND(price * 0.9,2))) AS Цена_со_скидкой
FROM book

-- 4.2.8
Определить стоимость доставки:
- для книг c ценой 500 и менее, установить в размере 99.99
- при количестве книг на складе менее 5, а ценой выше 500, установить в размере 149.99
- для остальных случаев доставка должна быть бесплатной
Определить новую стоимость для книг:
- для книг, совокупной стоимостью более 5000, добавить 20% к стоимости за экземпляр
- для остальных случаев снизить стоимость одного экземпляра на 20%
Настроить фильтр при выборке:
- только позиции творчества авторов: Булгаков и Есенин, при количестве экземпляров на складе: от 3 до 14 включительно.
Сортировку выполнить:
- по имени автора в порядке возрастания
- затем по названию в порядке убывания
- по стоимости доставки (от меньшей к большей)
В таблице должны быть отображены данные:
- автора
- название
- количество
- цену, как real_price
- новую цену, как new_price (округлить до двух знаков после запятой)
- стоимость доставки, как delivery_price 
SELECT author, title, amount, price AS real_price, IF(price * amount > 5000, ROUND(price + price * 0.2, 2), ROUND(price * 0.8,2)) AS new_price, IF(price < 500, 99.99, IF(amount<5, 149.99, 0)) AS delivery_price
FROM book
WHERE (author = 'Булгаков М.А.' or author ='Есенин С.А.') AND amount BETWEEN 3 AND 14
ORDER BY 1, 2 DESC, 6

-- 4.3.1
Вывести авторов и названия книг и их цену в двух столбцах - рубли и копейки.  Информацию отсортировать по убыванию копеек. 
SELECT author, title, TRUNCATE(price, 0) AS Рубли, ROUND((price - TRUNCATE(price, 0))*100) AS Копейки
FROM book
ORDER BY  ROUND((price - TRUNCATE(price, 0))*100) DESC

-- 4.3.2
В связи с повышенным спросом на классическую литературу школьниками в формате "А есть то же самое, но покороче, чтобы читать поменьше?" была выпущена серия "Графоман и. Краткое содержание".
В выборке:
- к имени автора добавить "Графоман и ";
- к названию книги дописать ". Краткое содержание.";
- цену на новый опус установить 40% от цены оригинала, но не более 250. (Если 40% больше 250, то цена должна быть 250);
- в зависимости от остатка на складе вывести "Спрос": до 3 (включительно) - высокий, до 10 (включительно) - средний, иначе низкий;
- добавить колонку "Наличие" в зависимости от количества: 1-2 шт - очень мало, 3-14 - в наличии, 15 и больше - много;
- отсортировать по цене по возрастанию, затем по Спросу от высокого к низкому, а затем по названию книги в алфавитном порядке.
select concat('Графоман и ', author) as Автор,
       concat(title, '. Краткое содержание.') as Название,
       case when price*0.4>250 then 250 else round(price*0.4, 3) end as Цена,
       case when amount<=3 then 'высокий'
            when amount <= 10 then 'средний'
            else 'низкий' end as Спрос, 
       case when amount<=2 then 'очень мало'
            when amount <= 14 then 'в наличии'
            else 'много' end as Наличие
from book
order by Цена, amount, Название;

-- 4.3.3
Для клиентов у которых сумма заказов выше средней по суммам заказов клиентов (общей стоимости всех заказов клиентов), вывести имя, общую сумму всех заказов, количество заказов, количество заказанных книг. Этим клиентам мы предложим специальную программу лояльности! Информацию отсортировать по имени клиентов ( в алфавитном порядке).
SELECT name_client, SUM(price * bb.amount) AS Общая_сумма_заказов, COUNT(DISTINCT bb.buy_id) AS Заказов_всего, SUM(bb.amount) AS Книг_всего
FROM book
    JOIN buy_book bb USING(book_id)
    JOIN buy USING(buy_id)
    JOIN client USING(client_id)
GROUP BY name_client
HAVING SUM(price * bb.amount) > (SELECT AVG(pr)
                                 FROM (SELECT SUM(price * buy_book.amount) AS pr
                                       FROM book
                                           JOIN buy_book USING(book_id)
                                           JOIN buy USING(buy_id)
                                       GROUP BY buy.client_id) test_1)
ORDER BY name_client

-- 4.3.4
Составить рейтинг книг в зависимости от того, какая книга принесет больше всего выручки (в процентах), при условии продажи всех книг. Рейтинг отсортировать по убыванию выручки. Выручка в процентах вычисляется как стоимость всех экземпляров книги деленное на суммарную стоимость всех экземпляров книг на складе и умноженное на 100, полученный результат округлить до двух знаков после запятой.
Судя по результату, магазин хорошо вложился в Стихи Есенина
select author, title, price, amount, round((price*amount/(sum(price*amount) over()))*100, 2) as income_percent
from book
order by income_percent desc;

-- 4.3.5
Для каждого автора из таблицы author вывести количество книг, написанных им в каждом жанре.
Вывести: ФИО автора, жанр, количество.
Отсортировать: по фамилии, затем - по убыванию количества написанных книг, а затем в алфавитном порядке по названию жанра.
Важно! Реализовать задание одним запросом на выборку.
select name_author, name_genre, count(amount) as Количество
from author cross join genre left join book
using(author_id, genre_id)
group by author_id, genre_id
order by name_author, Количество desc, name_genre

-- 4.3.6
Акция "Купи книгу от 500 руб. и получи подарок".
Вывести автора, название книги и цену. Выбрать книги с ценой 500 рублей и выше, отсортировать информацию в алфавитном порядке по автору и названию книги. Добавить столбец Подарок,  в котором вывести, какой подарок получает покупатель: если куплена книга от 500 рублей до 600 рублей (включительно), то подарок - ручка, от 600 до 700 (включительно) - детская раскраска, выше 700 - гороскоп.
select author as Автор,
       title as Название_книги,
       price as Цена,
       case when price>500 and price<=600 then 'ручка'
            when price>600 and price<=700 then 'детская раскраска'
            when price>700 then 'гороскоп'
       end as Подарок
from book
where price >=500
order by Автор, Название_книги;

-- 4.3.7
При анализе остатков книг на складе было решено дополнительно заказать книги авторов, у которых суммарное число экземпляров книг меньше 10. В таблице должны быть отображены авторы, наименьшее и наибольшее количество их книг.
select author as Автор ,min(amount) as Наименьшее_кол_во ,max(amount) as Наибольшее_кол_во 
from book 
group by author
HAVING SUM(amount) < 10;

-- 4.3.8
В последний заказ (таблица buy_book) клиента Баранов Павел добавить по одному экземпляру всех книг Достоевского, которые есть в таблице book.
set @m:= (select max(buy_id)
          from buy_book join buy
          using(buy_id) join client
          using(client_id)
          where name_client = 'Баранов Павел');
insert into buy_book(buy_id, book_id, amount)
select @m as buy_id, book_id,1 as amount
from author join book
using(author_id)
where name_author like 'Достоевский%';

-- 4.4.1
Найти вопрос, с самой большой успешностью выполнения - "самый легкий" и вопрос, с самой маленькой успешностью выполнения - "самый сложный".  (Подробно про успешность на этом шаге). Вывести предмет, эти два вопроса и указание - самый сложный или самый легкий это вопрос. Сначала вывести самый легкий запроса, потом самый сложный.
SET @mn = (SELECT SUM(is_correct) / COUNT(is_correct) * 100
           FROM subject 
               JOIN question USING(subject_id)
               JOIN testing USING(question_id)
           LEFT JOIN answer USING(answer_id)
           GROUP BY name_subject, name_question
           ORDER BY 1
           LIMIT 1);
          
SET @mx = (SELECT SUM(is_correct) / COUNT(is_correct) * 100
           FROM subject 
               JOIN question USING(subject_id)
               JOIN testing USING(question_id)
           LEFT JOIN answer USING(answer_id)
           GROUP BY name_subject, name_question
           ORDER BY 1 DESC
           LIMIT 1);

SELECT name_subject, name_question, 
    IF(SUM(is_correct) / COUNT(is_correct) * 100 = @mx, 'самый легкий', 'самый сложный') AS Сложность 
FROM subject 
    JOIN question USING(subject_id)
    JOIN testing USING(question_id)
    LEFT JOIN answer USING(answer_id)
GROUP BY name_subject, name_question
HAVING SUM(is_correct) / COUNT(is_correct) * 100 = @mn OR SUM(is_correct) / COUNT(is_correct) * 100 = @mx
ORDER BY SUM(is_correct) / COUNT(is_correct) * 100 DESC

-- 4.4.2
Для повышения успеваемости, предоставить возможность студентам снова пройти тестирование.
Для студентов, у которых количество попыток меньше 3 и максимальный балл < 70, в таблицу attempt добавить новые попытки по соответствующим предметам с текущей датой.
INSERT attempt(student_id, subject_id, date_attempt, result)
SELECT student_id, subject_id, NOW(), NULL
FROM attempt
GROUP BY student_id, subject_id
HAVING COUNT(subject_id) < 3 AND MAX(result) < 70







