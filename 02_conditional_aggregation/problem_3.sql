----- Problem 3 -----
---- Completed and Cancelled Orders Per Customer ----

drop table if exists Customers
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
    amount INT,
    status VARCHAR(20)
);

INSERT INTO Orders VALUES
(101,1,300,'completed'),
(102,1,500,'cancelled'),
(103,1,400,'completed'),

(104,2,200,'completed'),
(105,2,100,'completed'),

(106,3,600,'cancelled'),

(107,4,100,'completed'),
(108,4,200,'cancelled'),
(109,4,300,'cancelled');

select c.customer_id, c.customer_name,
        sum(case when o.status = 'completed' then 1 else 0 end) as completed_orders,
        sum(case when o.status = 'cancelled' then 1 else 0 end) as cancelled_orders
from Customers c
left join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by completed_orders desc, customer_id