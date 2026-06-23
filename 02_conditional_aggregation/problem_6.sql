--------- Problem 6 -----------
---------- Customer Purchase Mix ----------

drop table if exists customers
CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(20)
);

INSERT INTO Customers VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(4,'David');


drop table if exists orders
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    category VARCHAR(20),
    amount INT
);

INSERT INTO Orders VALUES
(101,1,'Books',200),
(102,1,'Books',300),
(103,1,'Electronics',500),

(104,2,'Books',100),
(105,2,'Clothing',200),
(106,2,'Clothing',300),

(107,3,'Electronics',400),
(108,3,'Electronics',600),

(109,4,'Books',200),
(110,4,'Electronics',300),
(111,4,'Clothing',500),
(112,4,'Books',400);


select c.customer_id, c.customer_name,
        sum(case when o.category = 'Books' then o.amount else 0 end) as books_revenue,
        sum(case when o.category = 'Electronics' then o.amount else 0 end) as electronics_revenue,
        sum(case when o.category = 'Clothing' then o.amount else 0 end) as clothing_revenue,
        sum(o.amount) as total_revenue
from customers c
left join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.amount) >= 1000 and 
        sum(case when o.category = 'Books' then o.amount else 0 end) > 
        sum(case when o.category = 'Electronics' then o.amount else 0 end) 
order by total_revenue desc, customer_id
