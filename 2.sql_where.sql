-- The WHERE clause is used to filter records.
-- Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc
-- The AND and OR operators are used to filter records based on more than one condition:

-- The AND operator displays a record if all the conditions separated by AND are TRUE.
-- The OR operator displays a record if any of the conditions separated by OR is TRUE.
-- The NOT operator displays a record if the condition(s) is NOT TRUE.

-- Operator	Description	Example
-- =	Equal	
-- >	Greater than	
-- <	Less than	
-- >=	Greater than or equal	
-- <=	Less than or equal	
-- <>	Not equal. Note: In some versions of SQL this operator may be written as !=	
-- BETWEEN	Between a certain range	
-- LIKE	Search for a pattern	
-- IN	To specify multiple possible values for a column	

--case 1 : using between as a logical operator

select SalesOrderNumber, OrderDate, TotalDue
from Sales.SalesOrderHeader
where TotalDue> = 870 and TotalDue <= 1000
and OrderDate> = '2002-01-01' and OrderDate <= '2002-06-30'

select SalesOrderNumber, OrderDate, TotalDue
from Sales.SalesOrderHeader
where  TotalDue between 870 
    and 1000
    and OrderDate between '2002-01-01' and'2002-06-30 '

-- case 2: Importance of Paranthesis
select Name, Color, ListPrice
from Production.Product
where Color = 'White'   
    or Color = 'Gray'
    and ListPrice> 9

--The above query will return everything that is white. In addition, the OR operator will also allow you to select all gray items,
--but with a price greater than 9. Since we have not explicitly specified how individual conditions should be treated, 
--all requirements that are connected with the AND operator will be treated together (obligatory). The others will be considered separately.
-- The database engine processing the query treated the AND conditions together, so the previous entry without parentheses will be equivalent to the following:
-- WHERE Color = 'White' OR (Color = 'Gray' and ListPrice> 9)

select Name, Color, ListPrice
from Production.Product
where (Color = 'White' or Color = 'Gray') 
    and ListPrice> 9

-- case 3 : Filtering Character Values
-- all records for which the value of the City column starts with "par"
select distinct City
from Person.Address
where City like 'par%'

-- records for which the value of the City column contains the string "par" (plus any number of characters before and after)
select distinct city
from Person.Address
where City like '% par%' 

--- all cities that start with any character,
-- contain the sequence "par" in position 2-4 
select distinct city
from Person.Address
where City like '_par%'

--Specifying a range of characters at the indicated position in square brackets []
--The range can be continuous [az] or a list of possible [adg] characters. 
--It can also specify the exclusion of specific characters - then we use the symbol ^. like : ring [td]
select distinct city
from Person.Address
where City like '% ring [td]%'  -- returns Springdale, Wamington

select distinct city
from Person.Address
where City like '% ring [^td]%' 

--Scoping can be performed for several characters.
--For example, the query below returns all items beginning with a or b and a second letter between n-p

select distinct city
from Person.Address
where City like '[ab] [np]%'  --Anacortes,Bobingy,Boise,Bonn,Boston,Bothell

-- case 4 : Usage of where instead of join , 
-- the following queries are equal.
-- Outer joins can be specified by using either the (+) syntax in the WHERE clause or the OUTER JOIN keywords in the FROM clause. 
-- Note : The result of an outer join contains a copy of all rows from one table. In this topic, the table whose rows are preserved is called the “outer” table, and the other table is called the “inner” table.
-- In a LEFT OUTER JOIN, the left-hand table is the outer table and the right-hand table is the inner table.
-- In a RIGHT OUTER JOIN, the right-hand table is the outer table and the left-hand table is the inner table.


--inner join  
select t1.c1, t2.c2
    from t1 inner join t2
        on t1.c1 = t2.c2;
        
--self join
select t1.c1, t2.c2
    from t1, t2
    where t1.c1 = t2.c2;

        
--outer join :
select t1.c1, t2.c2
    from t1 outer join t2
        on t1.c1 = t2.c2;
       
--self join
select t.c1,t2.c2
from t1,t2
where t1.c1 = t2.c2(+)



