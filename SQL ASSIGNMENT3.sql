CREATE DATABASE EMPLOYEE

USE EMPLOYEE

CREATE TABLE EMPLOYEEDETAILS
(
EMPID INT NOT NULL,
FULLNAME VARCHAR(100),
MANAGERID INT NOT NULL,
DATEOFJOINING DATE ,
CITY VARCHAR(100)
)

INSERT INTO EMPLOYEEDETAILS VALUES (121,'JOHN SNOW',321,'01-31-2019','TORANTO')
INSERT INTO EMPLOYEEDETAILS VALUES (321,'WALTER WHITE',986,'01-30-2020','CALIFORNIA')
INSERT INTO EMPLOYEEDETAILS VALUES (421,'KULDEEP RANA',876,'11-27-2021','NEW DELHI')

SELECT * FROM EMPLOYEEDETAILS


CREATE TABLE EMPLOYEESALARY
(
EMPID INT NOT NULL,
PROJECT VARCHAR(100),
SALARY MONEY,
VARIABLE INT
)

INSERT INTO EMPLOYEESALARY VALUES (121,'P1',8000,500)
INSERT INTO EMPLOYEESALARY VALUES (321,'P2',10000,1000)
INSERT INTO EMPLOYEESALARY VALUES (421,'P1',12000,0)

SELECT * FROM EMPLOYEESALARY

                       ---     ASSIGNMENT -- 1      ---


/* SQL Query to fetch records that are present in one table but not in another table. */

SELECT * FROM EMPLOYEEDETAILS ED
LEFT JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE ES.EMPID IS NULL


/* SQL query to fetch all the employees who are not working on any project. */

SELECT * FROM EMPLOYEEDETAILS ED
JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE ES.PROJECT IS NULL


/* SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020. */

SELECT FULLNAME FROM EMPLOYEEDETAILS
WHERE YEAR(DATEOFJOINING)=2020


/* Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary. */

SELECT FULLNAME FROM EMPLOYEEDETAILS ED
JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE SALARY IS NOT NULL


/* Write an SQL query to fetch a project-wise count of employees. */

SELECT PROJECT, COUNT(*) EC
FROM EMPLOYEESALARY
GROUP BY PROJECT


/* Fetch employee names and salaries even if the salary value is not present for the employee. */

SELECT ED.FULLNAME, ES.SALARY FROM EMPLOYEEDETAILS ED
JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID


/* Write an SQL query to fetch all the Employees who are also managers. */

SELECT FULLNAME FROM EMPLOYEEDETAILS
WHERE MANAGERID IS NOT NULL


/* Write an SQL query to fetch duplicate records from EmployeeDetails. */

SELECT EMPID, COUNT(*) 
FROM EMPLOYEEDETAILS
GROUP BY EMPID
HAVING COUNT(*)>1


/* Write an SQL query to fetch only odd rows from the table. */

SELECT * FROM EMPLOYEEDETAILS
WHERE EMPID%2<>0


/* Write a query to find the 3rd highest salary from a table without top or limit keyword. */

SELECT MAX(SALARY) FROM TABLE
WHERE SALARY<(SELECT MAX(SALARY) FROM TABLE
WHERE SALARY<(SELECT MAX(SALARY) FROM TABLE))


                           ---    ASSIGNMENT -- 2    ---

/* Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’. */

SELECT EMPID,FULLNAME FROM EMPLOYEEDETAILS
WHERE MANAGERID=986


/*  Write an SQL query to fetch the different projects available from the EmployeeSalary table. */

SELECT DISTINCT(PROJECT) FROM EMPLOYEESALARY


/* Write an SQL query to fetch the count of employees working in project ‘P1’. */

SELECT COUNT(*) COUNTOFEMPLOYEES FROM EMPLOYEESALARY
WHERE PROJECT='P1'


/* Write an SQL query to find the maximum, minimum, and average salary of the employees. */

SELECT MAX(SALARY) MAXSALARY,MIN(SALARY) MINSALARY,AVG(SALARY) AVGSALARY FROM EMPLOYEESALARY


/* Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000. */

SELECT EMPID FROM EMPLOYEESALARY
WHERE SALARY BETWEEN 9000 AND 15000


/* Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321. */

SELECT * FROM EMPLOYEEDETAILS
WHERE CITY='TORANTO' AND MANAGERID=321


/* Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321. */

SELECT * FROM EMPLOYEEDETAILS
WHERE CITY='CALIFORNIA' OR MANAGERID=321


/* Write an SQL query to fetch all those employees who work on Projects other than P1. */

SELECT * FROM EMPLOYEEDETAILS ED
JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE PROJECT<>'P1'


/* Write an SQL query to display the total salary of each employee adding the Salary with Variable value. */

SELECT (SALARY+VARIABLE) TOTAL_SALARY FROM EMPLOYEESALARY


/* Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters. */

SELECT * FROM EMPLOYEEDETAILS ED
JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE FULLNAME LIKE '__HN%'


                       ---    ASSIGNMENT -- 3    ---


/* Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’. */

SELECT ED.EMPID,ES.EMPID FROM EMPLOYEEDETAILS ED
JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID


/* Write an SQL query to fetch common records between two tables. */

SELECT * FROM EMPLOYEEDETAILS ED
INNER JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID


/* Write an SQL query to fetch records that are present in one table but not in another table. */

SELECT * FROM EMPLOYEEDETAILS ED
LEFT JOIN 
EMPLOYEESALARY ES
ON ED.EMPID = ES.EMPID 
WHERE ES.EMPID IS NULL


/* Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary. */

SELECT DISTINCT ED.EMPID FROM EMPLOYEEDETAILS ED
JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID


/* Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary. */

SELECT DISTINCT ED.EMPID FROM EMPLOYEEDETAILS ED
INNER JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE ES.EMPID IS NULL


/* Write an SQL query to fetch the employee’s full names and replace the space */

SELECT REPLACE(FULLNAME,' ','-') FROM EMPLOYEEDETAILS  NEW_NAME


/* Write an SQL query to fetch the position of a given character(s) in a field. */

SELECT FULLNAME,CHARINDEX('S',FULLNAME,1) FROM EMPLOYEEDETAILS

SELECT Patindex ('%s%', FULLNAME) FROM EMPLOYEEDETAILS
 


/* Write an SQL query to display both the EmpId and ManagerId together. */

SELECT EMPID,MANAGERID FROM EMPLOYEEDETAILS 


/* Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table. */

SELECT LEFT(FULLNAME, CHARINDEX(' ',FULLNAME)-1) FROM EMPLOYEEDETAILS


/* Write an SQL query to uppercase the name of the employee and lowercase the city values. */

SELECT UPPER(FULLNAME) UPPER_FULLNAME,LOWER(CITY) LOWER_CITY FROM EMPLOYEEDETAILS


                          ---     ASSIGNMENT -- 4     ---


/* Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field. */

SELECT LEN(FULLNAME) - LEN(REPLACE(FULLNAME, 'n', ''))  FROM EMPLOYEEDETAILS


/* Write an SQL query to update the employee names by removing leading and trailing spaces. */

UPDATE EMPLOYEEDETAILS
SET FULLNAME=TRIM(FULLNAME)


/* Fetch all the employees who are not working on any project. */

SELECT ED.FULLNAME FROM EMPLOYEEDETAILS ED
INNER JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE PROJECT IS NULL


/* Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000. */

SELECT ED.FULLNAME,ES.SALARY FROM EMPLOYEEDETAILS ED
INNER JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE SALARY>=5000 AND SALARY<=10000


/* Write an SQL query to find the current date-time. */

SELECT SYSDATETIME() AS CURRENT_DATE_TIME


/* Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020. */

SELECT * FROM EMPLOYEEDETAILS ED
INNER JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE YEAR(DATEOFJOINING) = 2020


/* Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table. */

SELECT * FROM EMPLOYEEDETAILS ED
INNER JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE SALARY IS NOT NULL


/* Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order. */

SELECT PROJECT, COUNT(*) TC FROM EMPLOYEESALARY
GROUP BY PROJECT
ORDER BY TC DESC


/* Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee. */

SELECT * FROM EMPLOYEEDETAILS ED
INNER JOIN
EMPLOYEESALARY ES
ON ED.EMPID=ES.EMPID
WHERE SALARY IS NULL OR SALARY IS NOT NULL


/* Write an SQL query to join 3 tables. */

SELECT * FROM T1
JOIN T2 ON T1.COMMONCOLUMN=T2.COMMONCOLUMN
JOIN T3 ON T2.COMMONCOLUMN=T3.COMMONCOLUMN



                  ---    ADVANCED  ASSIGNMENT    ---


CREATE TABLE EMPLOYEEINFO
(
EMPID INT NOT NULL,
EMPFNAME VARCHAR(100),
EMPLNAME VARCHAR(100),
DEPARTMENT VARCHAR(100),
PROJECT CHAR(100),
ADDRESS VARCHAR(100),
DOB DATE,
GENDER VARCHAR(10)
)

CREATE TABLE EMPLOYEEPOSITION
(
EMPID INT NOT NULL,
EMPPOSITION VARCHAR(100),
DATEOFJOINING DATE,
SALARY MONEY
)

INSERT INTO EMPLOYEEINFO VALUES (1,'SANJAY','MEHRA','HR','P1','HYDERABAD(HYD)','1976/12/01','M')
INSERT INTO EMPLOYEEINFO VALUES (2,'ANANYA','MISHRA','ADMIN','P2','DELHI(DEL)','1968/05/02','F')
INSERT INTO EMPLOYEEINFO VALUES (3,'ROHAN','DIWAN','ACCOUNT','P3','MUMBAI(BOM)','1980/01/01','M')
INSERT INTO EMPLOYEEINFO VALUES (4,'SONIA','KULKARNI','HR','P1','HYDERABAD(HYD)','1992/05/02','F')
INSERT INTO EMPLOYEEINFO VALUES (5,'ANKIT','KAPOOR','ADMIN','P2','DELHI(DEL)','1994/07/03','M')

INSERT INTO EMPLOYEEPOSITION VALUES (1,'MANAGER','01/05/2022',500000)
INSERT INTO EMPLOYEEPOSITION VALUES (2,'EXECUTIVE','02/05/2022',75000)
INSERT INTO EMPLOYEEPOSITION VALUES (3,'MANAGER','01/05/2022',90000)
INSERT INTO EMPLOYEEPOSITION VALUES (2,'LEAD','02/05/2022',85000)
INSERT INTO EMPLOYEEPOSITION VALUES (1,'EXECUTIVE','01/05/2022',300000)


/* Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName. */

SELECT UPPER(EMPFNAME) EMPNAME FROM EMPLOYEEINFO


/* Write a query to fetch the number of employees working in the department ‘HR’. */

SELECT COUNT(*) HR FROM EMPLOYEEINFO
WHERE DEPARTMENT='HR'


/* Write a query to get the current date. */

SELECT GETDATE()


/* Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table. */

SELECT LEFT(EMPLNAME,4) FROM EMPLOYEEINFO


/* Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table. */

SELECT SUBSTRING(ADDRESS,1,CHARINDEX('(',ADDRESS)-1) ADDR FROM EMPLOYEEINFO


/* Write a query to create a new table that consists of data and structure copied from the other table. */

SELECT * INTO EMPLOYEEINFO1 FROM EMPLOYEEINFO 



/* Write q query to find all the employees whose salary is between 50000 to 100000. */

SELECT * FROM EMPLOYEEINFO EI
INNER JOIN
EMPLOYEEPOSITION EP
ON EI.EMPID=EP.EMPID
WHERE SALARY  BETWEEN 50000 AND 100000


/* Write a query to find the names of employees that begin with ‘S’ */

SELECT EMPFNAME FROM EMPLOYEEINFO
WHERE EMPFNAME LIKE 'S%'


/* Write a query to fetch top N records. */

SELECT TOP 3 * FROM EMPLOYEEINFO EI
JOIN
EMPLOYEEPOSITION EP
ON EI.EMPID=EP.EMPID


/* Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space. */

SELECT CONCAT(EMPFNAME,' ',EMPLNAME) FULLNAME FROM EMPLOYEEINFO


/* Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender */

SELECT COUNT(*) FROM EMPLOYEEINFO
WHERE DOB BETWEEN '1970/05/02' AND '1975/12/31'
GROUP BY GENDER


/* Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order. */

SELECT * FROM EMPLOYEEINFO
ORDER BY EMPLNAME DESC

SELECT * FROM EMPLOYEEINFO
ORDER BY DEPARTMENT ASC


/* Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets. */

SELECT * FROM EMPLOYEEINFO EI
JOIN
EMPLOYEEPOSITION EP
ON EI.EMPID=EP.EMPID
WHERE EMPLNAME LIKE '____A'


/* Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table. */

SELECT * FROM EMPLOYEEINFO EI
JOIN
EMPLOYEEPOSITION EP
ON EI.EMPID=EP.EMPID
WHERE EMPFNAME NOT IN ('SANJAY' , 'SONIA')


/* Write a query to fetch details of employees with the address as “DELHI(DEL)”. */

SELECT * FROM EMPLOYEEINFO EI
JOIN
EMPLOYEEPOSITION EP
ON EI.EMPID=EP.EMPID
WHERE EI.ADDRESS='DELHI(DEL)'


/* Write a query to fetch all employees who also hold the managerial position. */

SELECT * FROM EMPLOYEEINFO EI
JOIN
EMPLOYEEPOSITION EP
ON EI.EMPID=EP.EMPID
WHERE EMPPOSITION='MANAGER'


/* Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order. */

SELECT DEPARTMENT,COUNT(*) FROM EMPLOYEEINFO
GROUP BY DEPARTMENT 
ORDER BY DEPARTMENT ASC


/* Write a query to calculate the even and odd records from a table. */

SELECT * FROM EMPLOYEEINFO
WHERE EMPID%2=0

SELECT * FROM EMPLOYEEINFO
WHERE EMPID%2<>0


/* Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table. */

SELECT EI.* FROM EMPLOYEEINFO EI
LEFT JOIN
EMPLOYEEPOSITION EP
ON EI.EMPID=EP.EMPID
WHERE EP.DATEOFJOINING IS NOT NULL


/* Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table. */

SELECT TOP 2 SALARY FROM EMPLOYEEPOSITION
ORDER BY SALARY ASC

SELECT TOP 2 SALARY FROM EMPLOYEEPOSITION
ORDER BY SALARY DESC


/* Write a query to find the Nth highest salary from the table without using TOP/limit keyword. */

SELECT DISTINCT SALARY
FROM EMPLOYEEPOSITION EP
WHERE N = (SELECT COUNT(DISTINCT SALARY) FROM EMPLOYEEPOSITION EP1 WHERE EP1.SALARY >= EP.SALARY)


/* Write a query to retrieve duplicate records from a table. */

SELECT EMPFNAME,EMPLNAME,COUNT(*) FROM EMPLOYEEINFO
GROUP BY EMPFNAME,EMPLNAME
HAVING COUNT(*)>1


/* Write a query to retrieve the list of employees working in the same department. */

SELECT EMPFNAME, EMPLNAME, DEPARTMENT, COUNT(*) 
FROM EMPLOYEEINFO
GROUP BY DEPARTMENT
HAVING COUNT(*) > 1


/* Write a query to retrieve the last 3 records from the EmployeeInfo table. */

SELECT TOP 3 * FROM EMPLOYEEINFO
ORDER BY EMPID DESC


/* Write a query to find the third-highest salary from the EmpPosition table. */

SELECT MAX(SALARY) THIRD_HIGHEST_SALARY FROM EMPLOYEEPOSITION
WHERE SALARY<(SELECT MAX(SALARY) FROM EMPLOYEEPOSITION 
WHERE SALARY<(SELECT MAX(SALARY) FROM EMPLOYEEPOSITION))


/* Write a query to display the first and the last record from the EmployeeInfo table. */

SELECT TOP 1 * FROM EMPLOYEEINFO
ORDER BY EMPID ASC
SELECT TOP 1 * FROM EMPLOYEEINFO
ORDER BY EMPID DESC


/* Write a query to add email validation to your database */

CREATE TABLE PEOPLE
(
ID INT PRIMARY KEY,
EMAIL TEXT)

INSERT INTO PEOPLE VALUES (1,'vicky905813@gmail.com')
INSERT INTO PEOPLE VALUES (2,'vicky905813gmail.com')

select * from PEOPLE


SELECT * FROM [EMPLOYEE].[dbo].[PEOPLE]
WHERE EMAIL NOT LIKE '%_@__%.__%' 


SELECT * FROM [EMPLOYEE].[dbo].[PEOPLE]
WHERE EMAIL  LIKE '%_@__%.__%' 

SELECT * FROM [EMPLOYEE].[dbo].[PEOPLE]
WHERE EMAIL  LIKE '%_@_%.__'  



/* Write a query to retrieve Departments who have less than 2 employees working in it. */

SELECT DEPARTMENT,COUNT(*) EMPLOYEES FROM EMPLOYEEINFO
GROUP BY DEPARTMENT
HAVING COUNT(*)<2


/* Write a query to retrieve EmpPostion along with total salaries paid for each of them */

SELECT EMPPOSITION,SUM(SALARY) FROM EMPLOYEEPOSITION
GROUP BY EMPPOSITION


/* Write a query to fetch 50% records from the EmployeeInfo table. */

SELECT * FROM EMPLOYEEINFO
WHERE EMPID<=(SELECT COUNT(*)/2 FROM EMPLOYEEINFO)



---------------------------------------------------------------------------------------------------
