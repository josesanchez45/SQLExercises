/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
Select p.Name , c.Name
from products as p
inner join categories as c
On p.CategoryID = c.CategoryID
where c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating
 from products as p
 inner join reviews as r
 on p.ProductID = r.ProductID
 where r.Rating = '5';
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName , e.LastName, SUM(s.Quantity) AS Total
 From Sales AS s
 INNER Join employees as e on e.EmployeeID = s.EmployeeID
 GROUP BY e.EmployeeID
 ORDER BY Total desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name AS "Department Name", c.Name AS "Category Name"
From departments as d
Inner join categories as c
 on d.DepartmentID = c.DepartmentID
where c.Name = "Appliances" or c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 Select p.Name, Sum(s.quantity) as "Total Sold", SUM(s.Quantity * s.PricePerUnit) AS "Total Price"
 from Products as p
 INNER JOIN Sales as s
 on p.ProductID = s.ProductID
 Where p.Name like '%Eagles:%';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name, R.Reviewer, r. Rating, r.Comment
from products AS P
INNER JOIN reviews AS r
on P.ProductID = r.ProductID
Where P.ProductID = 857 and r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS "TOTAL"
FROM Sales as s
INNER JOIN Employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
group by e.employeeID, p.ProductID;