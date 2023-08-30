Create database Projects;

use Projects;

create table EmployeeDetail(
EmployeeID int not null,
FirstName varchar(20),
LastName varchar(20),
Salary money,
JoiningDate varchar(20),
Department varchar(20),
Gender varchar(20));

Insert into EmployeeDetail(EmployeeID,FirstName,LastName,Salary,JoiningDate,Department,Gender)
values (1,'Vikas','Ahlawat',600000,'2/12/2013 11:16','IT','Male'),
(2,'Nikita','Jain',530000,'2/14/2013 11:16','HR','Female'),
(3,'Ashish','Kumar',1000000,'2/14/2013 11:16','IT','Male'),
(4,'Nikhil','Sharma',480000,'2/15/2013 11:16','HR','Male'),
(5,'Anish','Kadian',500000,'2/16/2013 11:16','Paroll','Male');


/* Write a query to get all employee detail from "EmployeeDetail" table */

select * from EmployeeDetail;


/* Write a query to get only "FirstName" column from "EmployeeDetail" table */

select FirstName from EmployeeDetail;


/* Write a query to get FirstName in upper case as "First Name". */

select upper(FirstName) as First_Name  from EmployeeDetail;


/* Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name) */

select concat(FirstName,' ', LastName) as EmployeeName from EmployeeDetail;


/* Select employee detail whose name is "Vikas */

select * from EmployeeDetail
where
FirstName='Vikas';


/* Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'. */

select * from EmployeeDetail
where FirstName like'[a]%';


/* Get all employee details from EmployeeDetail table whose "FirstName" end with 'h' */

select * from EmployeeDetail
where FirstName like '%[h]';


/* Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p' */

select * from EmployeeDetail
where FirstName like '[a-p]%';


/* Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p' */

select * from EmployeeDetail
where FirstName not like '[a-p]%';


/* Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character */

select * from EmployeeDetail
where Gender like '__le';


/* Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters */

select * from EmployeeDetail
where FirstName like 'A____';


/* Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as". */

select * from EmployeeDetail
where FirstName like '%[%]%';


/* Get all unique "Department" from EmployeeDetail table */

select Distinct(Department) from EmployeeDetail;


/* Get the highest "Salary" from EmployeeDetail table. */

select max(Salary) as Highest_Salary from EmployeeDetail;


/* Get the lowest "Salary" from EmployeeDetail table */

select min(Salary) as Lowest_Salary from EmployeeDetail;


/* Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013 */

SELECT CONVERT(VARCHAR(20),JoiningDate,106) FROM EmployeeDetail;


/* Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15" */

SELECT CONVERT(VARCHAR(20),JoiningDate,111) FROM EmployeeDetail;


/* Show only time part of the "JoiningDate" */

SELECT CONVERT(VARCHAR(20),JoiningDate,108) FROM EmployeeDetail;


/* Get only Year part of "JoiningDate" */

SELECT DATEPART(YEAR,JoiningDate) FROM EmployeeDetail


/* Get only Month part of "JoiningDate” */

SELECT DATEPART(MONTH,JoiningDate) FROM EmployeeDetail


/* Get system date */

SELECT GETDATE()


/* Get UTC date. */

SELECT GETUTCDATE()


/* Get the first name, current date, joiningdate and diff between current date and joining date in months. */

SELECT FirstName, GETDATE() AS Current__Date, JoiningDate,DATEDIFF(MM,JoiningDate,GETDATE()) AS Total_Months FROM EmployeeDetail


/* Get the first name, current date, joiningdate and diff between current date and joining date in days. */

SELECT FirstName,GETDATE() AS CURRENT__DATE,JoiningDate,DATEDIFF(DD,JoiningDate,GETDATE()) AS TOTAL_DAYS FROM EmployeeDetail


/* Get all employee details from EmployeeDetail table whose joining year is 2013 */

SELECT * FROM EmployeeDetail
WHERE YEAR(JoiningDate)=2013


/* Get all employee details from EmployeeDetail table whose joining month is Jan(1) */

SELECT * FROM EmployeeDetail
WHERE MONTH(JoiningDate)=1


/* Get how many employee exist in "EmployeeDetail" table */

SELECT COUNT(*) AS COUNT_OF_EMPLOYEE FROM EmployeeDetail


/* Select only one/top 1 record from "EmployeeDetail" table */

SELECT TOP 1 * FROM EmployeeDetail


/* Select all employee detail with First name "Vikas","Ashish", and "Nikhil". */

SELECT * FROM EmployeeDetail
WHERE FirstName IN ('VIKAS','ASHISH','NIKHIL')


/* Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil" */

SELECT * FROM EmployeeDetail
WHERE FirstName NOT IN ('VIKAS','ASHISH','NIKHIL')


/* Select first name from "EmployeeDetail" table after removing white spaces from right side */

SELECT RTRIM(FirstName) FROM EmployeeDetail


/* Select first name from "EmployeeDetail" table after removing white spaces from left side */

SELECT LTRIM(FirstName) FROM EmployeeDetail


/* Display first name and Gender as M/F.(if male then M, if Female then F) */

SELECT FirstName,
       CASE Gender
           WHEN 'Male' THEN 'M'
           WHEN 'Female' THEN 'F'
       END AS GENDER
FROM EmployeeDetail


/* Select first name from "EmployeeDetail" table prifixed with "Hello */

SELECT CONCAT('Hello ',FirstName) AS PRIFIXED_VALUE FROM EmployeeDetail


/* Get employee details from "EmployeeDetail" table whose Salary greater than 600000 */

SELECT * FROM EmployeeDetail
WHERE Salary>600000


/* Get employee details from "EmployeeDetail" table whose Salary less than 700000 */

SELECT * FROM EmployeeDetail
WHERE Salary<700000


/* Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000 */

SELECT * FROM EmployeeDetail
WHERE Salary BETWEEN 500000 AND 600000


CREATE TABLE ProjectDetail
(
ProjectDetailID int,
EmployeeDetailID int,
ProjectName varchar(100)
)


/* Give records of ProjectDetail table */

INSERT INTO ProjectDetail VALUES (1,1,'Task Track')
INSERT INTO ProjectDetail VALUES (2,1,'CLP')
INSERT INTO ProjectDetail VALUES (3,1,'Survey Management')
INSERT INTO ProjectDetail VALUES (4,2,'HR Management')
INSERT INTO ProjectDetail VALUES (5,3,'Task Track')
INSERT INTO ProjectDetail VALUES (6,3,'GRS')
INSERT INTO ProjectDetail VALUES (7,3,'DDS')
INSERT INTO ProjectDetail VALUES (8,4,'HR Management')
INSERT INTO ProjectDetail VALUES (9,6,'GL Management')


/* Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table. */

SELECT Department,SUM(Salary) TOTAL_SALARY FROM EmployeeDetail
GROUP BY Department


/* Write the query to get the department and department wise total(sum) salary, display it in ascending order 
according to salary */

SELECT Department,SUM(Salary) FROM EmployeeDetail
GROUP BY Department
ORDER BY SUM(Salary) ASC


/* Write the query to get the department and department wise total(sum) salary, display it in descending order 
according to salary */

SELECT Department,SUM(Salary) FROM EmployeeDetail
GROUP BY Department
ORDER BY SUM(Salary) DESC


/* Write the query to get the department, total no. of departments, total(sum) salary with respect to department 
from "EmployeeDetail" table. */

SELECT Department,COUNT(Department) TOTAL_DEPARTMENTS,SUM(Salary) TOTAL_SALARY FROM EmployeeDetail
GROUP BY Department


/* Get department wise average salary from "EmployeeDetail" table order by salary ascending */

SELECT Department,AVG(Salary) FROM EmployeeDetail
GROUP BY Department
ORDER BY AVG(Salary) ASC


/* Get department wise maximum salary from "EmployeeDetail" table order by salary ascending */

SELECT Department,MAX(Salary) FROM EmployeeDetail
GROUP BY Department
ORDER BY MAX(Salary) ASC


/* Get department wise minimum salary from "EmployeeDetail" table order by salary ascending. */

SELECT Department,MIN(Salary) FROM EmployeeDetail
GROUP BY Department
ORDER BY MIN(Salary) ASC


/* Join both the table that is Employee and ProjectDetail based on some common paramter */

SELECT * FROM EmployeeDetail ED
JOIN
 ProjectDetail PD
ON ED.EmployeeID=PD.EmployeeDetailID


/* Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee 
which have assigned project already. */

SELECT CONCAT(ED.FirstName,' ',ED.LastName),PD.ProjectName FROM EmployeeDetail ED
JOIN
ProjectDetail PD
ON ED.EmployeeID=PD.EmployeeDetailID
ORDER BY FirstName


/* Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee 
even they have not assigned project. */

SELECT CONCAT(ED.FirstName,' ',ED.LastName),PD.ProjectName FROM EmployeeDetail ED
LEFT JOIN
ProjectDetail PD
ON ED.EmployeeID=PD.EmployeeDetailID
ORDER BY FirstName


/* Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee 
if project is not assigned then display "-No Project Assigned" */

SELECT CONCAT(ED.FirstName,' ',ED.LastName),ISNULL(PD.ProjectName,'No Project Assigned') FROM EmployeeDetail ED
LEFT JOIN
ProjectDetail PD
ON ED.EmployeeID=PD.EmployeeDetailID
ORDER BY FirstName


/* Get all project name even they have not matching any employeeid, in left table, order by firstname 
from "EmployeeDetail" and "ProjectDetail */

SELECT PD.ProjectName FROM ProjectDetail PD
LEFT JOIN
EmployeeDetail ED
ON PD.EmployeeDetailID=ED.EmployeeID
ORDER BY ED.FirstName


/* Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match 
found in any table then show NULL */

SELECT ISNULL(CONCAT(ED.FirstName,' ',ED.LastName),'NULL'),ISNULL(PD.ProjectName,'NULL') FROM EmployeeDetail ED
LEFT JOIN
ProjectDetail PD
ON ED.EmployeeID=PD.EmployeeDetailID


/* Write down the query to fetch EmployeeName & Project who has assign more than one project */

SELECT ED.FirstName,COUNT(PD.ProjectDetailID) FROM EmployeeDetail ED
JOIN
ProjectDetail PD
ON ED.EmployeeID=PD.EmployeeDetailID
GROUP BY ED.FirstName
HAVING COUNT(PD.ProjectDetailID)>1


/* Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName */

SELECT PD.ProjectName FROM ProjectDetail PD
JOIN
EmployeeDetail ED
ON ED.EmployeeID=PD.EmployeeDetailID
GROUP BY PD.ProjectName
HAVING COUNT(ED.FirstName)>1


/* Apply Cross Join in Both the tables */

SELECT * FROM EmployeeDetail
CROSS JOIN
ProjectDetail






