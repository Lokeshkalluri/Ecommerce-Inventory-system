
-- two insert statements
INSERT INTO Customer VALUES (6, 'John', 'Doe', 'johndoe@gmail.com', 816793696);

INSERT INTO Products VALUES (17, 'Smartphone', 'A high-quality smartphone advanced features', 'Electronics', 500, 100);

-- two update statements
UPDATE Products
SET Price = 486
WHERE ProductID = 35;

SELECT * FROM Products;


UPDATE Inventory
SET QuantityReceived = 100
WHERE InventoryID = 40;

SELECT * FROM Inventory;

-- the delete statement
DELETE FROM Shipment
WHERE ShipmentID = 3;

SELECT * FROM Shipment;

-- the simple select statement
SELECT *
FROM Products
WHERE Price > 500;

-- 2 join statements
SELECT C.FirstName, C.LastName, P.ProductName, P.Price, O.OrderTotal 
FROM Customer AS C JOIN Orders AS O ON C.CustomerID = O.CustomerID  
JOIN Products AS P ON O.ProductID = P.ProductID;


SELECT S.SaleID, S.SaleQuantity, S.SalePrice, SH.ShipmentDate, SH.ShipmentStatus
FROM Sales AS S
JOIN Shipment AS SH ON S.SaleID = SH.SaleID;

-- two that use summary statements
SELECT P.ProductID, P.ProductName, SUM(S.SaleQuantity) AS TotalSales
FROM Sales AS S INNER JOIN Products AS P 
ON S.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName;


SELECT O.OrderID, COUNT(S.SaleID) AS TotalItemsSold
FROM Orders AS O INNER JOIN Sales AS S ON O.OrderID = S.OrderID
GROUP BY O.OrderID;


-- the multi-table query
SELECT O.OrderDate, P.ProductName, S.SalePrice, S.SaleQuantity
FROM Orders AS O INNER JOIN Sales AS S 
ON O.OrderID = S.OrderID 
INNER JOIN Products AS P ON S.ProductID = P.ProductID;

-- query of your choice
SELECT C.CustomerID, CONCAT(C.FirstName, ' ', C.LastName) AS 'CustomerName', SUM(OrderTotal) AS 'TotalPurchases'
FROM Customer C JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID
ORDER BY TotalPurchases DESC
LIMIT 2;