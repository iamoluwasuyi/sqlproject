-- 1.	What is the name of the company that supplied the product with ProductID 1?

select s.companyname, s.contactname, p.productid
from products p
join suppliers s on s.supplierid = p.ProductID
where p.productid=1;


-- 2.	What is the name of the employee who made the sale with OrderID 10248

select e.firstname, e.lastname, o.orderid
from orders o
join employees e on e.EmployeeID = o.EmployeeID
where o.orderid ='10248';


-- 3.	How many products does the category with CategoryID 1 have?

select count(QuantityPerUnit)
from products
where categoryid=1;


-- 4.	What is the total price of the products ordered in OrderID 10248?

select sum(unitprice* Quantity) as 'total price', orderid
from `order details`
where orderid = '10248';


-- 5.	What is the name of the customer with CustomerID ALFKI?

select companyname, contactname, customerid
from customers
where CustomerID = 'ALFKI';


-- 6.	What is the total number of orders placed by the 
-- customer with CustomerID ALFKI?

select count(orderid) as 'total number of orders', customerid
from orders 
where customerid= 'ALFKI';


-- 7.	What is the name of the supplier that supplied the product
-- with ProductID 1?

select s.companyname, s.contactname, p.productid
from suppliers s
join products p on p.SupplierID = s.SupplierID
where p.productid = 1;


-- 8.	What is the name of the employee with EmployeeID 5?

select firstname, lastname, employeeid
from employees
where employeeid = 5;

-- 9.	What is the total number of customers in the Customers table?

select count(*) as 'total no of customers'
from customers;

-- 10.	What is the total number of employees in the Employees table?

select count(*) as 'total no of employees'
from employees;

-- 11.	What is the total number of orders in the Orders table?

select count(*) as 'total no of orders'
from orders;

-- 12.	What is the total number of products in the Products table?

select count(*) as 'total no of products'
from products;

-- 13.	What is the total number of categories in the Categories table?

select count(*) as 'total no of category'
from categories;

-- 14.	What is the total number of suppliers in the Suppliers table?

select count(*) as 'total no of suppliers'
from suppliers;

-- 15.	What is the total number of shippers in the Shippers table?

select count(*) as 'total no of shippers'
from shippers;

-- 16.	What is the total number of territories in the Territories table?

select count(*) as 'total no of territory'
from territories;

-- 17.	What is the total number of regions in the Regions table?

 select count(*) as 'total no of regions'
 from region;

-- 18.	What is the name of the shipper with ShipperID 2?

select companyname, shipperid
from shippers
where ShipperID = '2';

-- 19.	What is the phone number of the customer with CustomerID ANATR?

select phone, customerid
from customers
where customerid = 'ANATR';

-- 20.	What is the city of the customer with CustomerID ANATR?

select city, customerid
from customers
where customerid = 'ANATR';

-- 21.	What is the postal code of the customer with CustomerID ANATR?
 
 select postalcode, customerid
 from customers
 where customerid = 'ANATR';
 
 
-- 22.	What is the name of the contact person for the customer
-- with CustomerID ANATR?

select contactname, customerid
from customers
where CustomerID = 'ANATR';

-- 23.	What is the name of the product with ProductID 1?
 
 select productname, productid
 from products
 where productid = '1';
 
-- 24.	What is the unit price of the product with ProductID 1?

select unitprice, productid
from products
where productid = '1';

-- 25.	What is the quantity of the product with ProductID 1 in stock?

select sum(quantityperunit) as 'products in stock', productid
from products
where ProductID = '1';

-- 26.	What is the name of the category with CategoryID 1?

select categoryname, categoryid
from categories
where categoryid = '1';

-- 27.	What is the name of the supplier with SupplierID 1?

select companyname, supplierid
from suppliers
where supplierid = '1';

-- 28.	What is the name of the shipper with ShipperID 1?

select companyname, shipperid
from shippers
where shipperid = '1';

-- 29.	What is the name of the region with RegionID 1?

select regiondescription, regionid
from region
where regionid = '1';

-- 30.	What is the name of the territory with TerritoryID 1?

select territoryDescription, territoryid
from territories
where TerritoryID = '1';


-- 31.	What is the total revenue earned by the company in the year 1997?

select sum(unitprice * quantity) as 'total revenue'
from `order details`
where '1997-01-01' and '1997-12-31';

-- 32.	What are the names of all the products that have been discontinued?

select productid, productname
from products
where Discontinued = 0
order by ProductID asc;

-- 33.	What is the total quantity of each product that has been ordered?

select sum(quantity) as 'total quantity', productid
from `order details`
group by 2;



-- 34.	Which customer has placed the most number of orders?

select customerid, count(*) as 'no of orders'
from customers
group by 1
order by 2 ;

-- 35.	What is the total amount spent by each customer in the year 1998?

 select o.customerid, c.companyname,
 sum(od.quantity * od.unitprice) as 'total amount spent'
 from orders o
 join `order details` od on o.orderid = od.OrderID
 join customers c on c.customerid = o.customerid
 where o.OrderDate between 1998-01-01 and 1998-31-12
 group by 1,2
 order by 3;
 

-- 36.	What are the names of all the employees who have sold products to customers
 -- in France?
 
 select
	e.firstname, e.lastname, e.EmployeeID, p.productid, c.country
 from 
	employees e
 join
	orders o on o.OrderID = e.EmployeeID
 join
	`order details` od on od.OrderID = o.OrderID
 join 
	products p on p.productid = od.productid
 join
	customers c on c.CustomerID = o.OrderID
 where
	c.country = 'France';
 
 
-- 37.	What is the average number of days it takes for an order
-- to be shipped after it is placed?

select
    AVG(DATEDIFF(ShippedDate, OrderDate)) AS 'AverageShippingDays'
from
    orders
where
    ShippedDate IS NOT NULL;


-- 38.	What are the names of all the customers who have not placed any orders

SELECT
	companyname, customerid
from 
	customers
where 	
	customerid Not in (select distinct CustomerID
from
	orders);
    
    
-- 39.	What is the total quantity of each product that has been ordered by
-- customers in Germany?

select p.productid , p.productname,c.country, sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.productid = p.productid
join orders o on o.orderid = od.orderid
join customers c on c.customerid = o.customerid
where c.country = 'germany'
group by 1,2;


-- 40.	What is the average price of all the products in the database?

  select avg(unitprice) as 'averageproductprice'
  from products;

  
-- 41.	What are the names of all the employees who have sold products 
-- to customers in Germany?

select e.firstname, e.lastname,c.country, p.productid, c.customerid
from employees e
join orders o on o.employeeid = e.employeeid
join `order details` od on od.orderid = o.orderid
join products p on p.productid = od.productid
join customers c on c.customerid = o.customerid
where c.country = 'germany';


-- 42.	What is the total quantity of each product that has been ordered
-- by customers in the year 1998?

select p.productid,p.productname, sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.productid = p.ProductID
join orders o on o.orderid = od.orderid
join customers c on c.customerid = o.customerid
where (o.orderdate) = 1998
group by p.productid, p.productname
order by 'total quantity';


-- 43.	What is the total revenue earned by each category of products?
select c.categoryname, c.categoryid,
sum(od.quantity* od.unitprice) as 'total revenue'
from categories c
join products p on p.categoryid= c.categoryid
join `order details` od on od.productid = p.ProductID
join orders o on o.orderid = od.orderid
group by 1,2;


-- 44.	What is the total quantity of each product that has been ordered 
-- by customers in the year 1997?


select p.productid, p.productname, 
sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.productid = p.ProductID
join orders o on o.orderid = od.orderid
where year(o.OrderDate) = 1997
group by 1,2
order by 3;


-- 45.	What is the average quantity of each product that has been ordered?

select p.productid, p.productname,
avg(od.quantity) as 'average quantity'
from products p
join `order details` od on od.ProductID = p.ProductID
join orders o on o.OrderID = od.OrderID
group by 1,2;


-- 46.	What are the names of all the customers who have placed orders
-- in the year 1997?

select c.customerid, c.companyname
from customers c
join orders o on o.customerid = c.customerid
where year(o.orderdate) = 1997;



-- 47.	What is the total quantity of each product that has been
-- ordered by customers in the USA?

select p.productid, p.productname, c.country,
sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.ProductID = p.ProductID
join orders o on o.orderid = od.orderid
join customers c on c.customerid = o.customerid
where c.country = 'USA'
group by 1,2;


-- 48.	What are the names of all the employees who have
-- sold products to customers in the year 1997?

 select e.employeeid, e.firstname, e.lastname
 from employees e
 join orders o on o.EmployeeID = e.EmployeeID
 join customers c on c.customerid = o.customerid
 join `order details` od on od.OrderID = o.orderid
 join products p on p.ProductID = od.ProductID
 where year(o.orderdate)= 1997
;



-- 49.	What is the total revenue earned by each employee?

select e.firstname, e.lastname,
sum(od.quantity * od.unitprice) as 'total revenue'
from employees e
join orders o on o.EmployeeID = e.EmployeeID
join `order details` od on od.orderid = o.OrderID
group by 1,2;

-- 50.	What are the names of all the products that have been
-- ordered by customers in the year 1997?

select p.productid, p.productname, c.customerid
from products p
join `order details` od on od.ProductID = p.productid
join orders o on o.OrderID = od.OrderID
join customers c on c.CustomerID= o.CustomerID
where year(o.orderdate)= 1997;

-- 51.	What is the total revenue earned by the company in the year 1998?

select sum(od.quantity * od.unitprice) as 'total revenue'
from `order details` od
join orders o on o.orderid= od.orderid
where year(o.orderdate) = 1998; 

-- 52.	What is the average quantity of each product that has been ordered
-- by customers in the year 1998?

select p.productid, p.productname, c.customerid
from products p
join `order details` od on od.ProductID = p.ProductID
join orders o on o.orderid = od.orderid
join customers c on c.CustomerID = o.CustomerID
where year(o.orderdate)= 1998;


-- 53.	What is the total amount spent by each customer in the year 1997?

select c.customerid, c.companyname,
sum(od.quantity * od.unitprice) as 'total amount'
from customers c
join orders o on o.CustomerID = c.CustomerID
join `order details` od on od.OrderID = o.OrderID
where year(o.orderdate) = 1997
group by 1,2;

-- 54.	What are the names of all the employees who have sold
-- products to customers in the year 1998?

select e.employeeid, e.firstname,
e.lastname,p.productname, c.customerid, o.orderdate
from employees e
join orders o on o.employeeid = e.EmployeeID
join customers c on c.CustomerID = o.CustomerID
join `order details` od on od.orderid = o.OrderID
join products p on p.ProductID = od.productid
where year(o.orderdate)= 1998;


-- 55.	What is the total quantity of each product that
-- has been ordered by customers in the year 1996?

select p.productid, p.productname,
sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.ProductID = p.productid
join orders o on o.orderid = od.OrderID
join customers c on c.customerid = o.CustomerID
where year(o.orderdate)= 1996
group by 1,2;


-- 56.	What is the total revenue earned by each supplier?

 select s.supplierid, s.companyname,
 sum(od.quantity * od.unitprice) as 'total revenue'
 from suppliers s
 join orders o on o.shipvia = s.supplierid
 join `order details` od on od.orderid = o.orderid
 group by 1,2;


-- 57.	What is the total quantity of each product that has been ordered
-- by customers in the year 1995?

select p.productid, p.productname,
sum(quantity) as 'total quantity'
from products p
join `order details` od on od.ProductID = p.productid
join orders o on o.orderid = od.orderid
where year(o.orderdate) = 1995
group by 1,2;


-- 58.	What are the names of all the customers who have
-- placed orders in the year 1998?

select c.customerid, c.companyname
from customers c
join orders o on o.customerid = c.customerid
where year(o.orderdate)= 1998;

-- 59.	What is the average price of all the products in each category?

select p.productid, p.productname, c.categoryname,
avg(p.unitprice) as 'average price'
from products p
join categories c on c.categoryid = p.CategoryID
group by 1,2;

-- 60.	What is the total quantity of each product that has been 
-- ordered by customers in the year 1999?

select p.productid, p.productname,
sum(od.Quantity) as 'total quantity'
from products p
join `order details` od on od.productid= p.productid
join orders o on o.orderid = od.orderid
join customers c on c.customerid = o.customerid
where year(o.orderdate)= '1999'
group by p.productid,p.productname;

-- 61.	What are the names of all the customers who
-- have placed orders in the year 1995?

 select c.customerid, c.companyname
 from customers c
 join orders o on o.CustomerID = c.CustomerID
 where year(o.orderdate) = 1995;


-- 62.	What is the total amount spent by each customer in the year 1996?

select c.customerid, c.companyname,
sum(od.quantity* od.unitprice) as 'total amount spent'
from customers c
join orders o on o.customerid = c.customerid
join `order details` od on od.orderid = o.orderid
where year(o.orderdate)= 1996
group by 1,2;


--	What are the names of all the employees who have sold products to customers 
-- in the USA?

select e.employeeid, e.lastname, e.firstname
from employees e
join orders o on o.EmployeeID = e.employeeid
join customers c on c.customerid = o.customerid
where c.country = 'USA';



-- 64.	What is the total revenue earned by each customer in the year 1998?

select c.customerid, c.companyname,
sum(od.quantity * od.unitprice) as 'total revenue'
from customers c
join orders o on o.CustomerID = c.customerid
join `order details` od on od.OrderID = o.orderid
where year(o.orderdate)= 1998
group by 1,2;

-- 65.	What is the total quantity of each product that has been
-- ordered by customers in the year 1994?

select p.productid, p.productname,
sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.productid = p.ProductID
join orders o on o.orderid = od.OrderID
where year(o.orderdate)= 1994
group by 1,2;

-- 66.	What are the names of all the products that have been 
-- ordered by customers in the USA?

select p.productid, p.productname
from products p
join `order details` od on od.ProductID = p.ProductID
join orders o on o.orderid = od.orderid
join customers c on  c.customerid = o.customerid
where c.country = 'USA';

-- 67.	What is the average number of days it takes for an order to be 
-- shipped after it is placed, for each customer?

select
    o.CustomerID,
    c.CompanyName,
    AVG(DATEDIFF(o.ShippedDate, o.OrderDate)) AS AvgDaysToShip
from orders o
join customers c ON o.CustomerID = c.CustomerID
where o.ShippedDate IS NOT NULL
group by o.CustomerID, c.CompanyName;

-- 68.	What is the total quantity of each product 
-- that has been ordered by customers in the year 1993?

select p.productid, p.productname,
sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.productid = p.productid
join orders o on o.orderid = od.orderid
where year(o.orderdate) = '1993'
group by 1,2;

-- 69.	What is the total revenue earned by each employee in the year 1997? 

select e.employeeid, e.firstname, e.lastname,
sum(od.quantity * od.unitprice) as 'total revenue'
from employees e
join orders o on o.orderid = o.EmployeeID
join `order details` od on od.orderid = o.orderid
where year(o.orderdate)= 1997
group by 1,2;

-- 70.	What is the total revenue earned by each customer in the year 1996?

select c.customerid, c.companyname, 
sum(od.quantity * od.unitprice) as 'total revenue'
from customers c
join orders o on o.customerid = c.customerid
join `order details` od on od.orderid = o.orderid
where year(o.orderdate) = 1996
group by 1,2;

-- 71.	What are the names of all the employees who have sold 
-- products to customers in the year 1996?

select e.employeeid, e.lastname, e.firstname,
 c.customerid, p.productid
from employees e
join orders o on o.employeeid = e.EmployeeID
join `order details` od on od.OrderID = o.OrderID
join products p on p.ProductID = od.ProductID
join customers c on c.CustomerID = o.CustomerID
where year(o.orderdate)= 1996;


-- 72.	What is the total revenue earned by each category of products 
-- in the year 1998?

select ca.categoryid, ca.categoryname, 
sum(od.quantity * od.unitprice) as 'total revenue'
from categories ca
join products p on p.CategoryID = ca.CategoryID
join `order details`od on od.ProductID = p.ProductID
join orders o on o.OrderID = od.orderid
where year(o.orderdate) = 1998
group by 1,2;

-- 73.	What are the names of all the customers who have
-- placed orders in the year 1996?

select c.customerid, c.companyname
from customers c
join orders o on o.customerid = c.CustomerID
where year(o.orderdate)= 1996;

-- 74.	What is the total quantity of each product that
-- has been ordered by customers in the year 1998 and has not been discontinued?

select p.ProductID, p.ProductName,
    SUM(od.Quantity) AS 'Total Quantity'
from products p
Join `order details` od ON p.ProductID = od.ProductID
join orders o ON od.OrderID = o.OrderID
where YEAR(o.OrderDate) = 1998 AND p.Discontinued = 0
group by p.ProductID, p.ProductName;


-- 75.	What is the total revenue earned by each supplier in the year 1997?
 
 select s.supplierid, s.companyname,
 sum( od. quantity * od.unitprice) as 'total revenue'
 from suppliers s
 join products p on p.supplierid = s.supplierid
 join `order details` od on od.ProductID = p.ProductID
 join orders o on o.orderid = od.orderid
 where year(o.orderdate) = 1997
 group by 1,2;


-- 76.	What are the names of all the customers who
-- have placed orders in the year 1999?

select c.customerid, c.companyname
from customers c
join orders o on o.customerid = c.customerid
where year(o.orderdate) = 1999;


-- 77.	What is the average price of all the products that
-- have been ordered by customers in the year 1998?

select p.productid, p.productname,
avg(p.unitprice) as 'average price'
from products p
join `order details` od on od.productid = p.ProductID
join orders o on o.orderid = od.orderid
join customers c on c.customerid = o.customerid
where year(o.orderdate) = 1998
group by 1,2;

-- 78.	What is the total quantity of each product that has been 
-- ordered by customers in the year 1997 and has not been discontinued?

select p.productid, p.productname,
sum(od.quantity) as 'total quantity'
from products p
join `order details` od on od.ProductID = p.ProductID
join orders o on o.orderid = od.orderid
where year(o.orderdate) = 1997 
and p.Discontinued = 0
group by 1,2;

-- 79.	What are the names of all the employees who 
-- have sold products to customers in the year 1995?

select e.employeeid, e.firstname, e.lastname
from employees e
join orders o on o.EmployeeID = e.employeeid
join `order details` od on od.orderid = o.orderid
join products p on p.productid = od.ProductID
join customers c on c.customerid = o.CustomerID
where year(o.orderdate) = 1995
group by 1,2;

-- 80.	

select c.CustomerID,c.CompanyName,
    SUM(od.Quantity * od.UnitPrice) AS 'Total Revenue'
from customers c
join orders o ON o.CustomerID = c.CustomerID
join `order details` od ON od.OrderID = o.OrderID
where YEAR(o.OrderDate) = 1995
group by
    c.CustomerID, c.CompanyName;



