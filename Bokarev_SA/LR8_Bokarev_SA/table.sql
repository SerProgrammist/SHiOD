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



