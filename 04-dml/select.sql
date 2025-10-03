## Задание 2
1. Название и продолжительность самого длительного трека.  

select name, duration from track where duration >= (SELECT MAX(duration) from track)

       name       | duration 
------------------+----------
 lucky track name |      231



2. Название треков, продолжительность которых не менее 3,5 минут.  

select name from track where duration > 180;

       name       
------------------
 lucky track name
 disc tra
 good maa
(3 rows)


3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.  

select name from collection where year >= '2018-01-01' and year <='2020-12-31';

      name       
-----------------
 collection 2019
(1 row)


4. Исполнители, чьё имя состоит из одного слова.  

select name from executor where name NOT LIKE '% %';

  name   
---------
 Jonatah
 Smith
 Fill
 Lick
(4 rows)

5. Название треков, которые содержат слово «мой» или «my».

SELECT name FROM track WHERE name ~ '\y(my|мой)\y';

     name      
---------------
 my list sound
 ler my gong
(2 rows)


## Задание 3

1. Количество исполнителей в каждом жанре.

SELECT g.name AS "Название жанра", COUNT(eg.ExecutorID) AS "Количество исполнителей"
FROM Genre g
LEFT JOIN ExeGe eg ON g.GenreID = eg.GenreID
GROUP BY g.name
ORDER BY "Количество исполнителей" DESC;


2. Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT COUNT(t.TrackID) AS "Количество треков"
FROM Track t
JOIN Album a ON t.AlbumID = a.AlbumID
WHERE EXTRACT(YEAR FROM a.year) BETWEEN 2019 AND 2020;


3. Средняя продолжительность треков по каждому альбому.

SELECT a.name AS "Альбом", ROUND(AVG(t.Duration), 2) AS "Средняя продолжительность трека (сек)"
FROM Album a
JOIN Track t ON a.AlbumID = t.AlbumID
GROUP BY a.AlbumID
ORDER BY "Средняя продолжительность трека (сек)" DESC;


4. Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT e.ExecutorID, e.name AS "Исполнитель"
FROM Executor e
WHERE e.ExecutorID NOT IN (
    SELECT DISTINCT ea.ExecutorID
    FROM ExeA ea
    JOIN Album a ON ea.AlbumID = a.AlbumID
    WHERE EXTRACT(YEAR FROM a.year) = 2020
)
ORDER BY e.name;


5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

SELECT DISTINCT c.name AS "Сборник", c.year AS "Год выхода"
FROM Collection c
JOIN ExeC ec ON c.CollectionID = ec.CollectionID
JOIN Track t ON ec.TrackID = t.TrackID
JOIN Album a ON t.AlbumID = a.AlbumID
JOIN ExeA ea ON a.AlbumID = ea.AlbumID
JOIN Executor e ON ea.ExecutorID = e.ExecutorID
WHERE e.name = 'Smith'
ORDER BY c.year;
