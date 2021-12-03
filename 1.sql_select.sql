--case1 :  get all columns
select *
from table_name

--case2 :  gel columns with alias
select  Name as NameColumn,
        Surname as SurnameColumn
from table_name

--case 3: get columns with column positions (available in Snowflake)
select  $1,
        $2
from table_name

--case 4: make columns case sensitive by using double quote( "" )
select "Name",
       "Surname"
from table_name

-- case5: get distinct value from the columns
select distinct(Name)
from table_name

-- case6: get number of distinct value 
select count(distinct Name)
from table_name

-- case7: recoding 'null' values with COALESCE 
-- SOURCE : https://towardsdatascience.com/6-sql-tricks-every-data-scientist-should-know-f84be499aea5
select NullColumn,
       coalesce(NullColumn, 'Missing') as EncodedNullColumn
from table_name

-- case8: recoding empty and 'NA' values
-- NOTE :COALESCE don't work with 'NA' and empty instead case when statement can be used
select NaColumn,
       case 
       	    when NaColumn = 'NA' then 'NA_Missing' 
	    else NaColumn
       end as EncodedNaColumn,
       case 
       	    when EmptyColumn = '' then 'Empty_Missing' 
	    else EmptyColumn
       end as EncodedEmptyColumn
from table_name

--NOTE : 
--SQL query processing order
--(5) SELECT
--(1) FROM
--(2) WHERE
--(3) GROUP BY
--(4) HAVING
--(6) ORDER BY

-- case9: scalar functions usage 
--(Scalar functions, like in other programming languages, return a scalar value(!! one) based on the given arguments.)
-- DATEADD (datepart, number, date) - adds (or subtracts) the number of date 
-- DATEDIFF (datepart, startdate, enddate) - difference between two dates (end - start) 
-- DATEPART (datepart, date) - extracts the specified datepart parameter,
-- DATENAME (datepart, date) - similar to DATEPART, returns a character value specified by the datepart parameter,

select Name,
       Surname,
       BirthDate, 
       year(BirthDate) as BirthYear,
       datediff(yy,BirthDate, getdate()) as Age
 from Employee



select dateadd(dd, -DAY (GETDATE () - 1), GETDATE ()) as FirstDayCurrMonth,
	dateadd(dd, -DAY (GETDATE ()), GETDATE ()) as LastDayPrevMonth


select datename(dw, detdate ()) as Weekday,
	datename(mm, getdate ()) as Month



--case 10 :Artihmetic expresion usage
-- calculations without a table
select 2 + 2 as Result

-- Calculations on the values from the columns 
-- ROUND function rounds the result to n decimal places
-- FLOOR (fractional_number) - rounds any floating point number down 
-- CEILING (fractional_number) works similarly - it always rounds up to the full value

select UnitPrice, Quantity, Discount, 
	round((UnitPrice * Quantity * (1-Discount)) * 1.23, 2) as TotalBrutto
from dbo.[OrderDetails]

select floor (123.78) as FloorPositiveNumber, 
       floor (-123.78) as FloorNegativeNumber, 
       ceiling (123.78) as CeilingPositiveNumber, 
       ceiling (-123.78) as CeilingNegativeNumber
--source : https://www.sqlpedia.pl/funkcje-matematyczne-w-sql/


--case 11 :Text expresion usage
select LastName + ' ' + FirstName as FirstName, 
       left (FirstName, 1) + '. '+ LastName as FirstName2
from dbo.Employees
