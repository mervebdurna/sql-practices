-- AdventureWorks Medium Questions
-- SOURCE :  https://sqlzoo.net/wiki/AdventureWorks_medium_questions

--QUESTION 1: A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.

select SalesOrderID, UnitPrice
from SalesOrderDetail
where OrderQty = 1


-- QUESTION 2: Where did the racing socks go? List the product name and the CompanyName for all Customers who ordered ProductModel 'Racing Socks

select a.Name,d.CompanyName
from ProductModel as p

inner join Product   as a
on p.ProductModelID= a.ProductModelID
 

inner join SalesOrderDetail as b
on  a.ProductID = b.ProductID 

inner join SalesOrderHeader as c 
on b.SalesOrderID = c.SalesOrderID

inner join Customer as d 
on c.CustomerID = d.CustomerID

where p.name = 'Racing Socks'

--QUESTION 3: Show the product description for culture 'fr' for product with ProductID 736.

select a.Description
from ProductDescription as a

inner join ProductModelProductDescription as b
on a.ProductDescriptionID = b.ProductDescriptionID

inner join Product as c
on b.ProductModelID = c.ProductModelID

where b.culture = 'fr' AND c.ProductID = 736

--QUESTION 4 : Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the CompanyName and the SubTotal and the total weight of the order.

select b.CompanyName, a.SubTotal, d.Weight
from SalesOrderHeader as a

inner join Customer as b
on a.CustomerID = b.CustomerID

inner join SalesOrderDetail as c
on c.SalesOrderID = a.SalesOrderID

inner join Product as d
on d.ProductID = c.ProductID 

order by SubTotal desc

--QUESTION 5:How many products in ProductCategory 'Cranksets' have been sold to an address in 'London'?

select * 
from ProductCategory as a

inner join Product as b
on b.ProductCategoryID = a.ProductCategoryID

inner join SalesOrderDetail as c
on c.ProductID = b.ProductID

inner join SalesOrderHeader as d
on d.SalesOrderID = c.SalesOrderID

inner join Address as e
on e.AddressID = d.ShipToAddressId

where a.Name = 'Cranksets' and e.City = 'London'

