/* Create   Database Name as Order_Stores_Data */

CREATE DATABASE Order_Stores_Data

USE Order_Stores_Data


/* Create two Table names as Orders_Table and Stores_Table */

CREATE TABLE Orders_Table
(
ORDERDATE DATE,
REGION VARCHAR(100),
REP VARCHAR(100),
ORDER_ITEM VARCHAR(100),
UNITS INT,
UNIT_COST MONEY,
TOTAL_PRICE MONEY,
ORDER_ID INT NOT NULL
)

CREATE TABLE Stores_Table
(
STORE_ID INT,
STORE_TYPE VARCHAR(100),
ASSORTMENT INT,
COMPETITIONDISTANCE INT,
MONTH_ INT,
YEAR_ INT,
PROMOINTERVAL VARCHAR(100)
)


/* Insert All records present here in the Orders_table and Stores_Table. */

INSERT INTO Orders_Table VALUES ('1-6-21','EAST','ARUNA','PENCIL',95,1.99,189.05,1)
INSERT INTO Orders_Table VALUES ('1-23-21','CENTRAL','KIVELL','ERASER',50,19.99,999.50,2)
INSERT INTO Orders_Table VALUES ('2-9-21','CENTRAL','GANESH',NULL,36,4.99,179.64,3)
INSERT INTO Orders_Table VALUES ('2-26-21','CENTRAL','PAYAL',NULL,27,19.99,539.73,4)
INSERT INTO Orders_Table VALUES ('3-15-21','WEST','SORVINO',NULL,56,2.99,167.44,5)
INSERT INTO Orders_Table VALUES ('4-1-21','EAST','HITESH','PENCIL',60,4.99,299.40,6)
INSERT INTO Orders_Table VALUES ('4-18-21','CENTRAL','AKSHITA',NULL,75,1.99,149.25,7)
INSERT INTO Orders_Table VALUES ('5-5-21','CENTRAL','RUCHIKA','BOOKS',90,4.99,449.10,8)
INSERT INTO Orders_Table VALUES ('5-22-21','WEST','SURBHI',NULL,32,1.99,63.68,9)
INSERT INTO Orders_Table VALUES ('6-8-21','EAST','JONES','SUITCASE',60,8.99,539.40,10)


INSERT INTO Stores_Table VALUES (1,'C',25,1270,9,2008,'JAN')
INSERT INTO Stores_Table VALUES (2,'A',21,570,11,2007,'FEB')
INSERT INTO Stores_Table VALUES (3,'A',26,14130,12,2006,'MAR')
INSERT INTO Stores_Table VALUES (4,'C',10,620,9,2009,NULL)
INSERT INTO Stores_Table VALUES (5,'A',44,29910,4,2015,'MAY')
INSERT INTO Stores_Table VALUES (6,'A',50,310,12,2013,'JUNE')
INSERT INTO Stores_Table VALUES (7,'A',29,24000,4,2013,NULL)
INSERT INTO Stores_Table VALUES (8,'A',39,7520,10,2014,'AUG')
INSERT INTO Stores_Table VALUES (9,'A',24,2030,8,2000,NULL)
INSERT INTO Stores_Table VALUES (10,'A',18,3160,9,2009,'OCT')


/* Make Order_Id  Column as Primary Key. */

ALTER TABLE Orders_Table ADD PRIMARY KEY (ORDER_ID)


/* Add one Column Name  as Store_Names and insert the records given above in Stores table. */

ALTER TABLE Stores_Table
ADD STORE_NAMES VARCHAR(100)

 UPDATE Stores_Table
 SET STORE_NAMES = 'CAR'
 WHERE STORE_ID = 1

 UPDATE Stores_Table
 SET STORE_NAMES = 'BIKES'
 WHERE STORE_ID = 2

UPDATE Stores_Table
SET STORE_NAMES = 'HARDWARE'
WHERE STORE_ID = 3

UPDATE Stores_Table
SET STORE_NAMES = 'ELECTRICS'
WHERE STORE_ID = 4

UPDATE Stores_Table
SET STORE_NAMES = 'FIBERS'
WHERE STORE_ID = 5

UPDATE Stores_Table
SET STORE_NAMES = 'ELASTICS'
WHERE STORE_ID = 6

UPDATE Stores_Table
SET STORE_NAMES = 'BOOKS'
WHERE STORE_ID = 7

UPDATE Stores_Table
SET STORE_NAMES = 'SHOES'
WHERE STORE_ID = 8

UPDATE Stores_Table
SET STORE_NAMES = 'CLOTHES'
WHERE STORE_ID = 9

UPDATE Stores_Table
SET STORE_NAMES = 'SCRAPS'
WHERE STORE_ID = 10


/* Make Stored_Id as a Foreign Key with reference too Orders_Table */

ALTER TABLE Stores_Table
ADD CONSTRAINT fk_Stores_Table_STORE_ID
FOREIGN KEY (STORE_ID) REFERENCES Orders_Table(ORDER_ID)


/* Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet */

UPDATE Orders_Table
SET ORDER_ITEM = 'COMPASS'
WHERE ORDER_ID = 3

UPDATE Orders_Table
SET ORDER_ITEM = 'TORCH'
WHERE ORDER_ID = 4

UPDATE Orders_Table
SET ORDER_ITEM = 'PHONE'
WHERE ORDER_ID = 5

UPDATE Orders_Table
SET ORDER_ITEM = 'LAPTOP'
WHERE ORDER_ID = 7

UPDATE Orders_Table
SET ORDER_ITEM = 'BOX'
WHERE ORDER_ID = 9


/* Update the missing records in the PromoInterval Column in Stores Table. */

UPDATE Stores_Table
SET PROMOINTERVAL = 'APR'
WHERE STORE_ID = 4

UPDATE Stores_Table
SET PROMOINTERVAL = 'JULY'
WHERE STORE_ID = 7

UPDATE Stores_Table
SET PROMOINTERVAL = 'SEPT'
WHERE STORE_ID = 9


/* Rename the column name  of Assortment to Store_Nos in Stores_Table. */

EXEC sp_rename 'Stores_Table.ASSORTMENT' , 'STORE_NOS' , 'COLUMN';


/* Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table. */

EXEC sp_rename 'Orders_Table.ORDER_ITEM','ITEM_NAME','COLUMN'
EXEC sp_rename 'Orders_Table.REP','CUSTOMERS_NAME','COLUMN';



/* Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order. */

SELECT UNIT_COST FROM Orders_Table
ORDER BY UNIT_COST DESC

SELECT TOTAL_PRICE FROM Orders_Table
ORDER BY TOTAL_PRICE ASC


/* Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region. */

EXEC sp_rename 'Orders_Table.CUSTOMERS_NAME','CUS_NAME','COLUMN'
SELECT REGION, COUNT(*) AS NUM_OF_CUSTOMERS
FROM Orders_Table
GROUP BY REGION;


/* Find the sum of Total_Price Column and Unit Cost  in Orders_Table */

SELECT SUM(TOTAL_PRICE) AS TOTAL_PRICE , SUM(UNIT_COST) AS TOTAL_UNIT_COST FROM Orders_Table


/* Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table. */

CREATE VIEW ORDER_STORES_TABLE AS

SELECT OT.ORDERDATE,OT.UNIT_COST,ST.STORE_TYPE,ST.YEAR_
FROM Orders_Table OT
JOIN Stores_Table ST ON OT.ORDER_ID = ST.STORE_ID

SELECT * FROM ORDER_STORES_TABLE


/* Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9 */

SELECT ITEM_NAME,REGION FROM Orders_Table
WHERE ORDER_ID IN (4,5,6,9)


/* Show me year  whose ComptetitionDistance is 29910  , 310 , 3160 */

SELECT YEAR_ FROM Stores_Table
WHERE COMPETITIONDISTANCE IN (29910,310,3160)


/*  Give me that Item_name whose  Total_Price is greater than 200 and less than 400 */

SELECT ITEM_NAME FROM Orders_Table
WHERE TOTAL_PRICE>200 AND TOTAL_PRICE<400


/* Rename the CompetitionDistance as CD and find the total CD in Stores_Table. */

EXEC sp_rename 'Stores_Table.COMPETITIONDISTANCE','CD','COLUMN'

SELECT SUM(CD) AS CD FROM Stores_Table


/* What is the Total Count of Stores_Type and CD columns */

SELECT STORE_TYPE, CD, COUNT(*) AS Total_Count
FROM Stores_Table
GROUP BY STORE_TYPE, CD;


/* Apply the Cross Join in  Orders_Table and Stores_Table. */

SELECT * FROM Orders_Table
CROSS JOIN
Stores_Table


/* DROP both the databases */

DROP DATABASE Order_Stores_Data