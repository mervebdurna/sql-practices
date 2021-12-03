--case1 :  get all columns
select * from table_name

--case2 :  gel columns with alias
select  name as Isim,
        surname as Soyisim
from table_name

--case 3: get columns with column positions (available in Snowflake)
select  $1,$2
from table_name

--case 4: make columns case sensitive by using double quote( "" )
select "Name","Surname"
from table_name

-- case5: get distinct value from the columns
select distinct(name)
from table_name

-- case6: get number of distinct value 
select count(distinct name)
from table_name

-- case7: recoding 'null' values with COALESCE 
-- SOURCE : https://towardsdatascience.com/6-sql-tricks-every-data-scientist-should-know-f84be499aea5
select null_column,
       COALESCE(null_column, 'Missing') as encoded_null_colum
from table_name

-- case8: recoding empty and 'NA' values
-- NOTE :COALESCE don't work with 'NA' and empty instead CASE WHEN statement can be used
select na_column,
       CASE WHEN na_column = 'NA' THEN 'NA_Missing' END as encoded_na_column,
       CASE WHEN empty_column = '' THEN 'Empty_Missing' END as encoded_empty_column
from table_name

--NOTE : 
--SQL query processing order
--(5) SELECT
--(1) FROM
--(2) WHERE
--(3) GROUP BY
--(4) HAVING
--(6) ORDER BY

-- case9: SCALAR FUNCTIONS USAGE (Scalar functions, like in other programming languages, return a scalar value based on the given arguments.)
-- DATEADD (datepart, number, date) - adds (or subtracts) the number of date 
-- DATEDIFF (datepart, startdate, enddate) - difference between two dates (end - start) 
-- DATEPART (datepart, date) - extracts the specified datepart parameter,
-- DATENAME (datepart, date) - similar to DATEPART, returns a character value specified by the datepart parameter,

select Name,
       Surname,
       BirthDate, 
       YEAR(BirthDate) as BirthYear,
       DATEDIFF(yy,BirthDate, getdate()) as Age
 from Employee



SELECT DATEADD (dd, -DAY (GETDATE () - 1), GETDATE ()) as FirstDayCurrMonth,
	DATEADD (dd, -DAY (GETDATE ()), GETDATE ()) as LastDayPrevMonth


SELECT DATENAME (dw, GETDATE ()) as Weekday,
	DATENAME (mm, GETDATE ()) as Month

--case 10 :Artihmetic expresion usage
-- calculate without a table;) 
Select 2 + 2 as the result

-- Calculations on the values from the columns 
-- ROUND function rounds the result to n decimal places
-- FLOOR (fractional_number) - rounds any floating point number down 
-- CEILING (fractional_number) works similarly - it always rounds up to the full value

select UnitPrice, Quantity, Discount, 
	Round ((UnitPrice * Quantity * (1-Discount)) * 1.23, 2) as TotalBrutto
from dbo. [Order Details]

SELECT FLOOR (123.78), FLOOR (-123.78), CEILING (123.78), CEILING (-123.78)
--source : https://www.sqlpedia.pl/funkcje-matematyczne-w-sql/


--case 11 :Text expresion usage
select LastName + '' + FirstName as FirstName, 
       LEFT (FirstName, 1) + '. '+ LastName as FirstName2
from dbo.Employees
