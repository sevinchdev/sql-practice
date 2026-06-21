----- Problem 22 ---------
----- High-Value Loyal Customers ------

---Marketing wants to identify high-value loyal customers.

--Find customers who satisfy all three conditions:

--1️. At least 3 completed orders
--2️. Total completed spending ≥ 1000
--3️. Average completed order amount > 300

drop table if exists customers
CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(20)
);

INSERT INTO Customers VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(4,'David'),
(5,'Emma'),
(6,'Frank');


drop table if exists orders
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    amount INT,
    status VARCHAR(20)
);

INSERT INTO Orders VALUES
(101,1,400,'completed'),
(102,1,350,'completed'),
(103,1,500,'completed'),

(104,2,800,'completed'),
(105,2,300,'completed'),

(106,3,200,'completed'),
(107,3,300,'cancelled'),
(108,3,400,'completed'),

(109,4,500,'completed'),
(110,4,600,'completed'),
(111,4,700,'completed'),
(112,4,200,'completed'),

(113,5,100,'completed'),
(114,5,150,'completed'),
(115,5,100,'completed'),

(116,6,1000,'completed');


select c.customer_id, c.customer_name,
      count(o.order_id) as completed_orders,
      sum(o.amount) as total_spent,
      avg(o.amount) as average_order_amount
from Customers c
join Orders o
on c.customer_id = o.customer_id
where o.status = 'completed'
group by c.customer_id, c.customer_name
having count(o.order_id) >= 3 and sum(o.amount) >= 1000 and avg(o.amount) > 300
order by total_spent desc, customer_id asc