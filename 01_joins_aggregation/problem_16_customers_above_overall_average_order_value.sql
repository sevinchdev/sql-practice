------------- Problem 16 ----------------------
--Find customers whose average completed order amount 
--is greater than the overall average completed order amount across all customers.

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
    amount INT,
    status VARCHAR(20)
);

INSERT INTO Orders VALUES
(101,1,100,'completed'),
(102,1,200,'cancelled'),
(103,1,300,'completed'),
(104,2,400,'completed'),
(105,2,100,'completed'),
(106,3,500,'cancelled'),
(107,4,200,'completed'),
(108,4,300,'completed'),
(109,4,100,'completed'),
(110,5,50,'completed');


select c.customer_id,
        c.customer_name,
        avg(o.amount) as average_completed_order_amount
from Customers c
join Orders o
on c.customer_id = o.order_id
where o.status = 'completed'
group by c.customer_id, c.customer_name
having avg(o.amount) > (
    select avg(amount)
    from Orders
    where status = 'completed')
order by average_completed_order_amount desc
