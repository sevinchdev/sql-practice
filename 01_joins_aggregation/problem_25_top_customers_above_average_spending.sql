------ Problem 25 ---------
----- Top Customers Above Average Spending -----

--Find customers who satisfy all of the following:

--✅ Purchased from at least 3 different categories.
--✅ Their total spending is greater than the average customer spending.


drop table if exists Customers
CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(20)
);

INSERT INTO Customers VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(4,'David'),
(5,'Emma');


drop table if exists orders
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    category VARCHAR(20),
    amount INT
);

INSERT INTO Orders VALUES
(101,1,'Electronics',500),
(102,1,'Books',300),
(103,1,'Clothing',400),

(104,2,'Electronics',700),
(105,2,'Books',600),

(106,3,'Books',200),
(107,3,'Clothing',300),
(108,3,'Furniture',200),

(109,4,'Electronics',600),
(110,4,'Books',700),
(111,4,'Clothing',800),
(112,4,'Furniture',900),
(113,5,'Books',100);


select c.customer_id, c.customer_name,
        count(distinct o.category) as nubmer_of_categories,
        sum(o.amount) as total_spent
from Customers c
join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(distinct o.category) >= 3 and
       sum(o.amount) >
      (select avg(amount_per_customer)
      from (
          select customer_id,
                sum(amount) as amount_per_customer
          from Orders
          group by customer_id
          ) t
      )
order by total_spent desc, customer_id asc