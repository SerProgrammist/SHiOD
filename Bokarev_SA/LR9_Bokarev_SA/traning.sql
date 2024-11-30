CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)
);
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP,
    TotalAmount DECIMAL(10, 2)
);
CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);


INSERT INTO Customers (FirstName, LastName, Email)
VALUES
    ('John', 'Doe', 'john.doe@example.com'),
    ('Alice', 'Smith', 'alice.smith@example.com'),
    ('Bob', 'Johnson', 'bob.johnson@example.com'),
    ('Eva', 'Williams', 'eva.williams@example.com'),
    ('Michael', 'Brown', 'michael.brown@example.com'),
    ('Olivia', 'Miller', 'olivia.miller@example.com'),
    ('David', 'Jones', 'david.jones@example.com'),
    ('Sophia', 'Taylor', 'sophia.taylor@example.com'),
    ('Daniel', 'Clark', 'daniel.clark@example.com'),
    ('Emma', 'Thomas', 'emma.thomas@example.com'),
    ('William', 'White', 'william.white@example.com'),
    ('Ava', 'Harris', 'ava.harris@example.com'),
    ('Matthew', 'Anderson', 'matthew.anderson@example.com'),
    ('Mia', 'Wilson', 'mia.wilson@example.com'),
    ('James', 'Moore', 'james.moore@example.com'),
    ('Isabella', 'Lee', 'isabella.lee@example.com'),
    ('Liam', 'Martin', 'liam.martin@example.com'),
    ('Emily', 'Taylor', 'emily.taylor@example.com'),
    ('Benjamin', 'Smith', 'benjamin.smith@example.com'),
    ('Avery', 'Davis', 'avery.davis@example.com'),
    ('Lucas', 'Johnson', 'lucas.johnson@example.com'),
    ('Scarlett', 'Brown', 'scarlett.brown@example.com'),
    ('Logan', 'Wilson', 'logan.wilson@example.com'),
    ('Grace', 'Miller', 'grace.miller@example.com');
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
    (1, '2024-10-01 08:00:00', 100.50),
    (2, '2024-10-02 12:30:00', 75.20),
    (3, '2024-10-03 15:45:00', 200.00),
    (4, '2024-10-04 10:20:00', 50.80),
    (5, '2024-10-05 14:15:00', 120.30),
    (6, '2024-10-06 09:30:00', 90.50),
    (7, '2024-10-07 16:00:00', 180.00),
    (8, '2024-10-08 11:45:00', 30.75),
    (9, '2024-10-09 13:20:00', 150.25),
    (10, '2024-10-10 08:45:00', 80.40),
    (11, '2024-10-11 17:30:00', 60.20),
    (12, '2024-10-12 12:00:00', 110.75),
    (13, '2024-10-13 14:50:00', 95.00),
    (14, '2024-10-14 09:15:00', 200.50),
    (15, '2024-10-15 16:45:00', 70.90),
    (16, '2024-10-16 11:00:00', 130.20),
    (17, '2024-10-17 13:30:00', 45.60),
    (18, '2024-10-18 08:20:00', 160.75),
    (19, '2024-10-19 15:10:00', 75.40),
    (20, '2024-10-20 10:40:00', 120.90),
    (21, '2024-10-21 14:00:00', 55.25),
    (22, '2024-10-22 09:50:00', 90.80),
    (23, '2024-10-23 12:15:00', 140.30),
    (24, '2024-10-24 16:30:00', 65.50),
    (25, '2024-10-25 11:10:00', 110.00);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1, 101, 2, 25.00),
    (1, 102, 1, 50.50),
    (2, 103, 3, 15.00),
    (2, 104, 2, 30.80),
    (3, 105, 1, 100.00),
    (4, 101, 2, 25.00),
    (4, 106, 1, 50.50),
    (5, 107, 3, 15.00),
    (5, 108, 2, 30.80),
    (6, 109, 1, 100.00),
    (7, 110, 2, 25.00),
    (7, 111, 1, 50.50),
    (8, 112, 3, 15.00),
    (8, 113, 2, 30.80),
    (9, 114, 1, 100.00),
    (10, 115, 2, 25.00),
    (10, 116, 1, 50.50),
    (11, 117, 3, 15.00),
    (11, 118, 2, 30.80),
    (12, 119, 1, 100.00),
    (13, 120, 2, 25.00),
    (13, 121, 1, 50.50),
    (14, 122, 3, 15.00),
    (14, 123, 2, 30.80),
    (15, 124, 1, 100.00);

SELECT c.FirstName, c.LastName, COALESCE(SUM(o.TotalAmount), 0) AS TotalOrderAmount FROM    Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.FirstName, c.LastName;

SELECT c.FirstName, c.LastName, COALESCE(SUM(o.TotalAmount), 0) AS TotalOrderAmount FROM    Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.FirstName, c.LastName ORDER BY TotalOrderAmount DESC, c.LastName, c.FirstName;

SELECT c.FirstName, c.LastName, COALESCE(SUM(o.TotalAmount), 0) AS TotalOrderAmount COALESCE(AVG(SUM(o.TotalAmount)) OVER (), 0) AS AvgTotalOrderAmount FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.FirstName, c.LastName ORDER BY TotalOrderAmount DESC, c.LastName, c.FirstName;

SELECT c.FirstName, c.LastName, COALESCE(SUM(o.TotalAmount), 0) AS TotalOrderAmount FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.FirstName, c.LastName ORDER BY TotalOrderAmount DESC LIMIT 1;

WITH RankedCustomers AS (SELECT c.CustomerID, c.FirstName, c.LastName, COALESCE(SUM(o.TotalAmount), 0) AS TotalOrderAmount, RANK() OVER (ORDER BY COALESCE(SUM(o.TotalAmount), 0) DESC) AS rnk FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.FirstName, c.LastName) SELECT rc.FirstName, rc.LastName, o.OrderID, o.TotalAmount AS OrderTotalAmount FROM RankedCustomers rc JOIN Orders o ON rc.CustomerID = o.CustomerID WHERE rc.rnk = 1 ORDER BY o.TotalAmount;

WITH CustomerOrderTotals AS (SELECT c.CustomerID, c.FirstName, c.LastName, COALESCE(SUM(o.TotalAmount), 0) AS TotalOrderAmount FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.FirstName, c.LastName), AverageOrderTotal AS (SELECT AVG(TotalOrderAmount) AS AvgOrderAmount FROM CustomerOrderTotals) SELECT cot.FirstName, cot.LastName, cot.TotalOrderAmount, aot.AvgOrderAmount FROM CustomerOrderTotals cot JOIN AverageOrderTotal aot ON 1=1 WHERE cot.TotalOrderAmount > aot.AvgOrderAmount;
