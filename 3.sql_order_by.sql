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
