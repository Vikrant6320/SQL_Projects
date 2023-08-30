CREATE DATABASE Customers_Orders_Products 

USE Customers_Orders_Products

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')


  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);





CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);

SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM Products


---TASK->1---


/* 1.Write a query to retrieve all records from the Customers table.. */

SELECT * FROM Customers


/* 2.Write a query to retrieve the names and email addresses of customers whose names start with 'J'. */

SELECT Name,Email FROM Customers
WHERE Name LIKE 'J%'


/* 3.Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders.. */

SELECT OrderID,ProductName,Quantity FROM Orders


/* 4.Write a query to calculate the total quantity of products ordered. */

SELECT SUM(Quantity) TOTAL_QUANTITY FROM Orders


/* 5.Write a query to retrieve the names of customers who have placed an order. */

SELECT C.Name FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
WHERE O.OrderID IS NOT NULL


/* 6.Write a query to retrieve the products with a price greater than $10.00. */

SELECT * FROM Products
WHERE Price>10.00


/* 7.Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'. */

SELECT C.Name,O.OrderDate FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
WHERE O.OrderDate>='2023-07-05'


/* 8.Write a query to calculate the average price of all products. */

SELECT AVG(Price) AVERAGE_PRICE FROM Products


/* 9.Write a query to retrieve the customer names along with the total quantity of products they have ordered. */

SELECT C.Name,O.Quantity FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID


/* 10.Write a query to retrieve the products that have not been ordered. */       

SELECT P.ProductName FROM Products P
LEFT JOIN
Orders O
ON P.ProductID=O.OrderID
WHERE P.ProductName!=O.ProductName



---TASK->2---

/* 1.Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders. */

SELECT TOP 5 SUM(O.Quantity) TOTAL_QUANTITY,C.Name FROM Customers C
LEFT JOIN
Orders O
ON C.CustomerID=O.CustomerID
GROUP BY C.Name
ORDER BY TOTAL_QUANTITY DESC


/* 2.Write a query to calculate the average price of products for each product category. */

SELECT O.ProductName,AVG(P.Price) FROM ORDERS O
JOIN
Products P
ON O.ProductName=P.ProductName
GROUP BY O.ProductName


/* 3.Write a query to retrieve the customers who have not placed any orders. */

SELECT C.Name FROM Customers C
LEFT JOIN
Orders O
ON C.CustomerID=O.CustomerID
WHERE O.OrderID IS NULL


/* 4.Write a query to retrieve the order details (OrderID, ProductName, Quantity) 
for orders placed by customers whose names start with 'M'. */

SELECT O.OrderID,O.ProductName,O.Quantity FROM Orders O
LEFT JOIN
Customers C
ON O.CustomerID=C.CustomerID
WHERE C.Name LIKE 'M%'


/* 5.Write a query to calculate the total revenue generated from all orders. */

SELECT SUM(O.Quantity*P.Price) TOTAL_REVENUE FROM Orders O
JOIN 
Products P
ON O.OrderID=P.ProductID


/* 6.Write a query to retrieve the customer names along with the total revenue generated from their orders. */

SELECT C.Name,SUM(O.Quantity*P.Price) FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
JOIN
Products P
ON O.OrderID=P.ProductID
GROUP BY C.Name


/* 7.Write a query to retrieve the customers who have placed at least one order for each product category. */

SELECT C.Name FROM Customers C

JOIN
Products P
ON C.CustomerID=P.ProductID
GROUP BY C.Name


/* 8.Write a query to retrieve the customers who have placed orders on consecutive days. */

SELECT C.Name FROM Customers C
JOIN
Orders O1
ON C.CustomerID=O1.CustomerID
JOIN
Orders O2
ON C.CustomerID=O2.CustomerID
WHERE DATEDIFF(DAY,O1.OrderDate,O2.OrderDate)=1


/* 9.Write a query to retrieve the top 3 products with the highest average quantity ordered. */

SELECT TOP 3 P.ProductName,AVG(O.Quantity) AVERAGE_QUANTITY FROM Products P 
JOIN
Orders O
ON P.ProductName=O.ProductName
GROUP BY P.ProductName
ORDER BY AVERAGE_QUANTITY DESC


/* 10.Write a query to calculate the percentage of orders that have a quantity greater than the average quantity. */

SELECT
    (COUNT(CASE WHEN quantity > avg_quantity THEN 1 END) / COUNT(*)) * 100 AS percentage
FROM (
    SELECT AVG(quantity) AS avg_quantity
    FROM orders
) AS avgordersquery
CROSS JOIN orders;


---TASK->3---

/* 1.Write a query to retrieve the customers who have placed orders for all products. */

SELECT c.CustomerID, c.Name FROM Customers c 
	WHERE NOT EXISTS ( SELECT 1 FROM Products p 
		WHERE NOT EXISTS 
			( SELECT 1 FROM Orders o WHERE
				o.CustomerID = c.CustomerID AND o.ProductName = p.ProductName ) );


/* 2.Write a query to retrieve the products that have been ordered by all customers. */

SELECT P.ProductName FROM Products P
JOIN
Orders O
ON P.ProductName=O.ProductName
GROUP BY P.ProductName

SELECT P.ProductName FROM Products AS P 
	WHERE NOT EXISTS ( SELECT 1 FROM Products p 
		WHERE NOT EXISTS 
			( SELECT 1 FROM Orders o WHERE
				o.CustomerID = o.ProductName AND o.ProductName = p.ProductName ) );

/* 3.Write a query to calculate the total revenue generated from orders placed in each month. */

SELECT CONVERT(varchar(7), O.OrderDate, 120) AS ORDER_MONTH ,SUM(O.Quantity*P.Price) FROM Orders O
JOIN
Products P
ON O.OrderID=P.ProductID
GROUP BY CONVERT(varchar(7), O.OrderDate, 120)
ORDER BY ORDER_MONTH


/* 4.Write a query to retrieve the products that have been ordered by more than 50% of the customers. */

SELECT ProductID, ProductName
FROM products
WHERE productid IN (
    SELECT o.OrderID
    FROM orders o
    GROUP BY o.OrderID
    HAVING COUNT(DISTINCT o.CustomerID) > (SELECT COUNT(DISTINCT customerid) FROM customers) * 0.5
)


/* 5.Write a query to retrieve the customers who have placed orders for all products in a specific category. */

SELECT C.Name,COUNT(DISTINCT P.ProductID) PRODUCT_COUNT FROM Customers C
INNER JOIN
Orders O
ON C.CustomerID=O.CustomerID
JOIN
Products P
ON O.ProductName=P.ProductName
GROUP BY C.Name
HAVING COUNT(DISTINCT P.ProductID)>10

SELECT c.customerid, c.name
FROM customers c
WHERE NOT EXISTS (
    SELECT p.productid
    FROM products p
    WHERE p.ProductName = 'PRODUCT A'
      AND NOT EXISTS (
          SELECT o.orderid
          FROM orders o
          WHERE o.customerid = c.customerid
            AND o.OrderID = p.productid
      )
)


/* 6.Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders. */

SELECT TOP 5 C.Name,O.Quantity*P.Price SPEND_MONEY FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
JOIN
Products P
ON O.ProductName=P.ProductName
GROUP BY C.Name,O.Quantity,P.Price
ORDER BY SPEND_MONEY DESC


/* 7.Write a query to calculate the running total of order quantities for each customer. */

SELECT C.Name,O.Quantity FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
GROUP BY C.Name,O.Quantity


/* 8.Write a query to retrieve the top 3 most recent orders for each customer. */

SELECT TOP 3 C.Name,O.ProductName,O.OrderDate FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
GROUP BY C.Name,O.ProductName,O.OrderDate
ORDER BY O.OrderDate DESC


/* 9.Write a query to calculate the total revenue generated by each customer in the last 30 days. */

SELECT C.Name,O.Quantity*P.Price FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
JOIN
Products P
ON O.ProductName=P.ProductName
WHERE O.OrderDate=DATEADD(DAY,-30,O.OrderDate)
GROUP BY C.Name,O.Quantity,P.Price


/* 10.Write a query to retrieve the customers who have placed orders for at least two different product categories. */

SELECT c.customerid, c.name FROM customers c
WHERE (SELECT COUNT(DISTINCT p.ProductName) FROM orders o
JOIN products p ON o.OrderID = p.productid
WHERE o.customerid = c.CustomerID) >= 2

/* 11.Write a query to calculate the average revenue per order for each customer. */

SELECT C.Name,AVG(O.Quantity*P.Price) REVENUE FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
JOIN
Products P
ON O.OrderID=P.ProductID
GROUP BY C.Name
ORDER BY REVENUE DESC


/* 12.Write a query to retrieve the products that have been ordered by customers from a specific country. */

---Not to be answered


/* 13.Write a query to retrieve the customers who have placed orders for every month of a specific year. */

SELECT c.CustomerID, c.Name 
FROM Customers c 
	WHERE NOT EXISTS 
		( SELECT 1 FROM ( SELECT DISTINCT DATEPART(MONTH, OrderDate) AS Month FROM Orders 
			WHERE DATEPART(YEAR, OrderDate) = 2023 ) m 
				WHERE NOT EXISTS ( SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID AND 
					DATEPART(MONTH, o.OrderDate) = m.Month ) );

/* 14.Write a query to retrieve the customers who have placed orders for a specific product in consecutive months. */

SELECT C.Name FROM Customers AS C
INNER JOIN Orders AS O1
ON 
C.CustomerID = O1.CustomerID
INNER JOIN Orders AS O2
ON
C.CustomerID = o2.CustomerID
WHERE O1.ProductName = 'ProductName' AND
O2.ProductName = 'ProductName' AND
DATEDIFF(MONTH , O1.OrderDate  , O2.OrderDate)=1

/* 15.Write a query to retrieve the products that have been ordered by a specific customer at least twice. */

SELECT C.Name,O.Quantity FROM Customers C
JOIN
Orders O
ON C.CustomerID=O.CustomerID
WHERE O.Quantity=2
GROUP BY C.Name,O.Quantity