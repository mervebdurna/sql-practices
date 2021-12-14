--ORDER BY
SELECT ...
FROM ...
ORDER BY orderItem [ , orderItem , ... ]
[ ... ]

orderItem ::= { <column_alias> | <position> | <expr> } [ ASC | DESC ] [ NULLS { FIRST | LAST } ]
-- Usage Notes From Snowflake : https://docs.snowflake.com/en/sql-reference/constructs/order-by.html
-- * For numeric values . leading zeros before the decimal point and trailing zeros (0) after dthe decimal point have no effect on sort order.
-- * Unless specified otherwise, NULL values are considered to be higher than any non-NULL values. As a result, the ordering for NULLS depends on the sort order:
--      If the sort order is ASC, NULLS are returned last; to force NULLS to be first, use NULLS FIRST.
--      If the sort order is DESC, NULLS are returned first; to force NULLS to be last, use NULLS LAST.
-- * An ORDER BY inside a subquery or subclause applies only within that subquery or subclause.
--  Sorting can be expensive. If you want the results of the outer query sorted, use an ORDER BY clause only at the top level of the query, and avoid using ORDER BY clauses in subqueries unless necessary.

--  goood source : https://www.sqlshack.com/sql-order-by-clause-overview-and-examples/

-- OFFSET(to skip first n rows) & FETCH (to get m rows ) can be used with order by. 

-- We can use case when with order by for custom sorting
--source : https://stackoverflow.com/questions/19185792/order-a-column-by-low-medium-high
order by case priority
  when 'low' 1
  when 'med' then 2
  when 'high' then 3
  
  -- ORDER BY statement works after the select statement so we can use aliasses in order by clause.
  
  -- Order by can be used as a Random Ordering . But this randomness is always in some way conditioned, for example, by the physical storage of records (or the method of storing data in the cache)
  select NEWID () as RandomValue, FirstName as Name, 
	   LastName as Surname,
	   PersonType
from Person.Person
order by 1

- both queries return the same result. In the second, we sort by NEWID ()
select FirstName as Name, 
	   LastName as Surname,
	   PersonType
from Person.Person
order by NEWID ()
