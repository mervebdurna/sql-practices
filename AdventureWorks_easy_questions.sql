--AdventureWorks Easy Question 
--SOURCE : https://sqlzoo.net/wiki/AdventureWorks_easy_questions

--Question 1 : Show the first name and the email address of customer with CompanyName 'Bike World'

select FirstName, EmailAddress 
from Customer
where CompanyName = 'Bike World'

--Question 2 : 
Show the CompanyName for all customers with an address in City 'Dallas'.

select CompanyName,c.City
from Customer as a 
left join CustomerAddress as b
on a.CustomerId = b.CustomerId
left join Address as c
on c.AddressID = b.AddressID
where c.City = 'Dallas'


--Question 3 : 
How many items with ListPrice more than $1000 have been sold?

select count(1)
from Product
where ListPrice > 1000

--Question 4 : Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.

select CompanyName
from Customer as b
inner join SalesOrderHeader as a
on a.CustomerID =b.CustomerID
where a.SubTotal + a.TaxAmt +a.Freight > 100000


--Question 5 : Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'

select count(1)
from Product as a
inner join SalesOrderDetail as b
on a.productID =b.ProductID
inner join SalesOrderHeader as c
on b.SalesOrderID = c.SalesOrderID
where a.Name = 'Racing Socks, L'





