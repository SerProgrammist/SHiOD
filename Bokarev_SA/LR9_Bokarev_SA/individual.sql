CREATE TABLE Автомобиль (
    Автомобиль_ID SERIAL PRIMARY KEY,
    Марка VARCHAR(50) NOT NULL,
    Модель VARCHAR(50) NOT NULL,
    Год_выпуска INT NOT NULL,
    Номерной_знак VARCHAR(10) NOT NULL,
    Владелец_ID INT NOT NULL REFERENCES "Владелец автомобиля"(Владелец_Автомобиля_ID),
    Страховая_стоимость_ID INT NOT NULL REFERENCES "Страховая стоимость автомобиля"(Страховая_стоимость_автомобиля_ID)
);
CREATE TABLE "Владелец автомобиля" (
    Владелец_Автомобиля_ID SERIAL PRIMARY KEY,
    Имя VARCHAR(50) NOT NULL,
    Фамилия VARCHAR(50) NOT NULL,
    Дата_рождения DATE NOT NULL,
    Адрес VARCHAR(100) NOT NULL,
    Номер_телефона VARCHAR(20) NOT NULL
);
CREATE TABLE Водитель (
    Водитель_ID SERIAL PRIMARY KEY,
    Имя VARCHAR(50) NOT NULL,
    Фамилия VARCHAR(50) NOT NULL,
    Дата_Рождения DATE NOT NULL,
    Адрес VARCHAR(100) NOT NULL,
    Номер_телефона VARCHAR(20) NOT NULL,
    Автомобиль_ID INT NOT NULL REFERENCES Автомобиль(Автомобиль_ID)
);
CREATE TABLE "Нарушение ПДД" (
    Нарушение_ПДД_ID SERIAL PRIMARY KEY,
    Описание_нарушения VARCHAR(100) NOT NULL,
    Дата_и_время_нарушения TIMESTAMP NOT NULL,
    Место_нарушения VARCHAR(100) NOT NULL,
    Водитель_ID INT NOT NULL REFERENCES Водитель(Водитель_ID)
);
CREATE TABLE Штраф (
    Штраф_ID SERIAL PRIMARY KEY,
    Сумма_штрафа DECIMAL(10,2) NOT NULL,
    Дата_оплаты_штрафа DATE NOT NULL,
    Нарушение_ПДД_ID INT NOT NULL REFERENCES "Нарушение ПДД"(Нарушение_ПДД_ID)
);
CREATE TABLE "Страховая стоимость автомобиля" (
    Страховая_стоимость_автомобиля_ID SERIAL PRIMARY KEY,
    Сумма_страхования DECIMAL(10,2) NOT NULL,
    Дата_начала_страхования DATE NOT NULL,
    Дата_окончания_страхования DATE NOT NULL
);

INSERT INTO Автомобиль (Марка, Модель, Год_выпуска, Номерной_знак, Владелец_ID)
VALUES
    ('Лада', 'xgfg1', '2001', 'н283тх', '1'),
    ('Нива', 'а7нg', '2007', 'а170тз', '2'),
    ('Ауди', 'hbfh', '2013', 'о803то', '3'),
    ('Фольсваген', 'afg1', '2017', 'а111а', '4'),
    ('БМВ', 'dsg56, ' '2017', 'е463за', '5'),
    ('Лада', 'fssnjdk', '2019', 'о124пр', '6'),
    ('БМВ', 'efwg', '2003', 'н436ап', '7'),
    ('Лада', 'x8fgd', '2007', 'з364тх', '8'),
    ('Нива', 'hdfh4', '2002', 'г573вп', '9'),
    ('Лада', 'sgffd', '2019', 'н256хз', '10'),
    ('Ауди', '46fdh', '2020', 'н286жо', '11'),
    (' Фольсваген ', 'xfdh6', '2004', 'к256хн', '12'),
    ('Лада', 'hd46', '2003', 'а864го', '13'),
    ('Ауди', 'erye5', '2011', 'з113кх', '14'),
    ('Нива', 'dfh5t', '2013', 'о262ка', '15'),
    ('Лада', 'ryer5', '2005', 'е633нг', '16'),
    ('БМВ', 'xyeq1', '2008', 'н123ее', '17'),
    ('Лада', '25yfd', '2009', 'а352пе', '18'),
    (' Фольсваген ', '46dfh', '2013', 'ф263рп', '19'),
    (' Фольсваген ', 'wt46f',  '2000', 'м113тт', '20'),

INSERT INTO Владелец_автомобиля (Имя, Фамилия, Дата_рождения, Адрес, Номер_телефона)
VALUES
    ('Павел', 'Воскресенкий', '1997', 'Воронеж', '89611831956'),
    ('Антон', 'Бахарев', '1991', 'Воронеж', '89209180281'),
    ('Дмитрий', 'Маховой', '1980', 'Пенза', '89611831882'),
    ('Екатерина, 'Булдыгина', '1967', 'Липецк', '89274252283'),
    ('Алексей', 'Запрягаев', '1989', 'Оскол, '89065820329'),
    ('Евгений', '	Онегин', '1974', 'Уфа', '89515573282'),
    ('Любовь', 'Успенская', '2001', 'Воронеж', '89058394906'),
    ('Александр', 'Серб, '2000', 'Саратов', '89061145168'),
    ('Никита', 'Кишинька', '2003', 'Пенза', '89611838650'),
    ('Дмитрий', 'Куликов', '1992', 'Уфа', '89472213343'),
    ('Сергей', 'Сот', '1998, 'Пенза', '89587410136'),
    ('Георгий', 'Литвинов, '2000', 'Липецк', '89611871142'),
    ('Вадим', 'Петыхин', '2001', 'Краснодар', '89611871586'),
    ('Павел', 'Гондарт', '2002', 'Москва', '89178144079'),
    ('Константин', 'Ситников', '1968', 'Воронеж', '89065820329'),
    ('Роман', 'Синайко', '1999', 'Москва, '89065820329'),
    ('Николай', 'Назаров', '1997', 'Саратов', '89065828394'),
    ('Анастасия', 'Рубцова', '2001', 'Липецк', '89675657092'),
    (' Фольсваген ', '46dfh', '2013', 'ф263рп', '89315214494'),
    (' Фольсваген ', 'wt46f',  '2000', 'м113тт', '89315219197'),

    INSERT INTO Водитель (Имя, Фамилия, Дата_рождения, Адрес, Номер_телефона, Автомобиль_ID)
VALUES
    ('Павел', 'Воскресенкий', '1997', 'Воронеж', '89611831956', '1'),
    ('Антон', 'Бахарев', '1991', 'Воронеж', '89209180281', '2'),
    ('Дмитрий', 'Маховой', '1980', 'Пенза', '89611831882', '3'),
    ('Екатерина, 'Булдыгина', '1967', 'Липецк', '89274252283', '4'),
    ('Алексей', 'Запрягаев', '1989', 'Оскол, '89065820329', '5'),
    ('Евгений', '	Онегин', '1974', 'Уфа', '89515573282', '6'),
    ('Любовь', 'Успенская', '2001', 'Воронеж', '89058394906', '7'),
    ('Александр', 'Серб, '2000', 'Саратов', '89061145168', '8'),
    ('Никита', 'Кишинька', '2003', 'Пенза', '89611838650', '9'),
    ('Дмитрий', 'Куликов', '1992', 'Уфа', '89472213343', '10'),
    ('Сергей', 'Сот', '1998, 'Пенза', '89587410136', '11'),
    ('Георгий', 'Литвинов, '2000', 'Липецк', '89611871142', '12'),
    ('Вадим', 'Петыхин', '2001', 'Краснодар', '89611871586', '13'),
    ('Павел', 'Гондарт', '2002', 'Москва', '89178144079', '14'),
    ('Константин', 'Ситников', '1968', 'Воронеж', '89065820329', '15'),
    ('Роман', 'Синайко', '1999', 'Москва', '89065820329', '16'),
    ('Николай', 'Назаров', '1997', 'Саратов', '89065828394', '17'),
    ('Анастасия', 'Рубцова', '2001', 'Липецк', '89675657092', '18'),
    (' Фольсваген ', '46dfh', '2013', 'ф263рп', '89315214494', '19'),
    (' Фольсваген ', 'wt46f',  '2000', 'м113тт', '89315219197', '20'),


INSERT INTO Нарушение_ПДД (Описание_нарушени,  Дата_и_время_нарушения, Место_нарушения, Водитель_ID)
VALUES
    ('Движение по встречной полосе', '2023-05-10', 'Воронеж', '1'),
    ('Парковка на месте для инвалидов', '2023-06-15', Краснодар', '2'),
    ('Проезд на красный свет', '2023-07-20', 'Москва', '3'),
    ('Неправильная парковка', '2023-08-25', 'Пенза', '4'),
    (''Движение по встречной полосе'', '2023-09-30', 'Липецк', '5'),
    ('Неправильная парковка', '2023-10-05', 'Уфа', '6'),
    ('Движение по встречной полосе ', '2023-11-10', 'Краснодар', '7'),
    ('Движение на красный свет', '2023-12-15', 'Москва', '8'),
    ('Парковка на месте для инвалидов ', '2024-01-20', 'Воронеж', '9'),
    (''Проезд на красный свет', '2024-02-25', 'Белгород', '10'),
    (''Неправильная парковка ', '2024-03-30', 'Орел', '11'),
    (''Движение по встречной полосе'', '2024-04-05', 'Уфа', '12'),
    (''Проезд на красный свет'', '2024-05-10', 'Пенза', '13'),
    (''Парковка на месте для инвалидов ', '2024-06-15', 'Липецк', '14'),
    (''Движение на красный свет ', '2024-07-20', 'Воронеж', '15'),
    (''Движение на красный свет ', '2024-08-25', 'Краснодар', '16'),
    (''Парковка на месте для инвалидов ', '2024-09-30', 'Москва', '17'),
    (''Проезд на красный свет'', '2024-10-05', 'Липецк', '18'),
    (''Движение по встречной полосе, '2024-11-10', 'Уфа', '19'),
    (''Движение по встречной полосе', '2024-12-15', 'Белгород', '20'),

INSERT INTO Штраф (Сумма_штрафа, Дата_оплаты_штрафа, Нарушение_ПДД_ID)
VALUES

    (1200.00, '2023-05-15', 1),
    (1300.50, '2023-06-20', 2),
    (1400.75, '2023-07-25', 3),
    (1250.25, '2023-08-30', 4),
    (1350.00, '2023-09-30', 5),
    (1500.25, '2023-10-05', 6),
    (1200.50, '2023-11-10', 7),
    (1450.75, '2023-12-15', 8),
    (1300.25, '2024-01-20', 9),
    (1400.00, '2024-02-25', 10),
    (1325.50, '2024-03-30', 11),
    (1375.25, '2024-04-05', 12),
    (1200.75, '2024-05-10', 13),
    (1285.00, '2024-06-15', 14),
    (1420.50, '2024-07-20', 15),
    (1350.25, '2024-08-25', 16),
    (1390.50, '2024-09-30', 17),
    (1250.75, '2024-10-05', 18),
    (1385.25, '2024-11-10', 19),
    (1415.50, '2024-12-15', 20);    

INSERT INTO Страховая_стоимость_автомобиля (Сумма_страхования, Дата_начала_страхования, Дата_окончания_страхования)
VALUES
    (3300000, '2020-05-01', '2023-05-15'),
    (6130050, '2011-06-20', '2023-06-20'),
    (5140075, '2007-07-25', '2023-07-25'),
    (4125025, '2018-11-30', '2024-12-15'),
    (2135000, '2019-09-30', '2024-11-10'),
    (1150025, '2021-10-05', '2024-10-05'),
    (41200.50, '2017-11-10', '2024-09-30'),
    (31450.75, '2018-11-01', '2024-08-25'),
    (31300.25, '2019-01-20', '2024-07-20'),
    (2140000, '2020-02-25', '2024-05-10'),
    (1132550, '2021-03-30', '2024-04-05'),
    (1137525, '2022-04-05', '2024-03-30'),
    (1120075, '2021-05-10', 2024-06-15'),
    (1128500, '2022-06-15', '2024-02-25'),
    (3142050, '2022-07-20', '2024-01-20'),
    (2135025, '2020-08-25', 2023-12-15'),
    (1139050, '2021-09-30', '2023-11-10'),
    (3125075, '2021-10-05', '2023-11-10'),
    (2138525, '2021-11-10', 12024-06-15'),
    (1141550, '2021-12-15', '2024-07-20');    

SELECT Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска, SUM(Штраф.Сумма_штрафа) AS Суммарная_оплата
FROM Водитель
INNER JOIN Автомобиль ON Водитель.Автомобиль_ID = Автомобиль.Автомобиль_ID
INNER JOIN "Нарушение ПДД" ON Водитель.Водитель_ID = "Нарушение ПДД".Водитель_ID
INNER JOIN Штраф ON "Нарушение ПДД".Нарушение_ПДД_ID = Штраф.Нарушение_ПДД_ID
GROUP BY Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска;

SELECT Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска, SUM(Штраф.Сумма_штрафа) AS Суммарная_оплата
FROM Водитель
INNER JOIN Автомобиль ON Водитель.Автомобиль_ID = Автомобиль.Автомобиль_ID
INNER JOIN "Нарушение ПДД" ON Водитель.Водитель_ID = "Нарушение ПДД".Водитель_ID
INNER JOIN Штраф ON "Нарушение ПДД".Нарушение_ПДД_ID = Штраф.Нарушение_ПДД_ID
GROUP BY Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска
ORDER BY Суммарная_оплата DESC;

SELECT AVG(Суммарная_оплата) AS Средняя_оплата
FROM (
    SELECT SUM(Штраф.Сумма_штрафа) AS Суммарная_оплата
    FROM Водитель
    INNER JOIN Автомобиль ON Водитель.Автомобиль_ID = Автомобиль.Автомобиль_ID
    INNER JOIN "Нарушение ПДД" ON Водитель.Водитель_ID = "Нарушение ПДД".Водитель_ID
    INNER JOIN Штраф ON "Нарушение ПДД".Нарушение_ПДД_ID = Штраф.Нарушение_ПДД_ID
    GROUP BY Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска
) AS Суммы_штрафов;

SELECT-выражении.
SELECT AVG(Суммарная_оплата) AS Средняя_оплата, MAX(Суммарная_оплата) AS Максимальная_оплата
FROM (
    SELECT SUM(Штраф.Сумма_штрафа) AS Суммарная_оплата, MAX(Штраф.Сумма_штрафа) AS Максимальный_штраф
    FROM Водитель
    INNER JOIN Автомобиль ON Водитель.Автомобиль_ID = Автомобиль.Автомобиль_ID
    INNER JOIN "Нарушение ПДД" ON Водитель.Водитель_ID = "Нарушение ПДД".Водитель_ID
    INNER JOIN Штраф ON "Нарушение ПДД".Нарушение_ПДД_ID = Штраф.Нарушение_ПДД_ID
    GROUP BY Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска
) AS Суммы_штрафов;

SELECT Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска, SUM(Штраф.Сумма_штрафа) AS Суммарная_оплата
FROM Водитель
INNER JOIN Автомобиль ON Водитель.Автомобиль_ID = Автомобиль.Автомобиль_ID
INNER JOIN "Нарушение ПДД" ON Водитель.Водитель_ID = "Нарушение ПДД".Водитель_ID
INNER JOIN Штраф ON "Нарушение ПДД".Нарушение_ПДД_ID = Штраф.Нарушение_ПДД_ID
WHERE Штраф.Сумма_штрафа = (
    SELECT MAX(Штраф.Сумма_штрафа)
    FROM Штраф
)
GROUP BY Водитель.Имя,
 Водитель.Фамилия,
 Автомобиль.Марка, 
Автомобиль.Модель,
 Автомобиль.Год_выпуска;

SELECT Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска, SUM(Штраф.Сумма_штрафа) AS Суммарная_оплата
FROM Водитель
INNER JOIN Автомобиль ON Водитель.Автомобиль_ID = Автомобиль.Автомобиль_ID
INNER JOIN "Нарушение ПДД" ON Водитель.Водитель_ID = "Нарушение ПДД".Водитель_ID
INNER JOIN Штраф ON "Нарушение ПДД".Нарушение_ПДД_ID = Штраф.Нарушение_ПДД_ID
GROUP BY Водитель.Имя, Водитель.Фамилия, Автомобиль.Марка, Автомобиль.Модель, Автомобиль.Год_выпуска
HAVING SUM(Штраф.Сумма_штрафа) > (
    SELECT AVG(Сумма_штрафа)
    FROM (
        SELECT SUM(Штраф.Сумма_штрафа) AS Сумма_штрафа
        FROM Штраф
        GROUP BY "Нарушение_ПДД_ID"
    ) AS Средняя_сумма_штрафов
);

