------ Problem 20 -------------
-------Customers With Above-Average Order Count--------

--Find customers whose number of orders is greater than 
--the average number of orders among customers who have placed at least one order.

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
(5,'Emma'),
(6,'Frank');


drop table if exists Orders
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    amount INT
);

INSERT INTO Orders VALUES
(101,1,100),
(102,1,200),
(103,1,300),

(104,2,500),

(105,3,100),
(106,3,150),

(107,4,200),
(108,4,300),
(109,4,400),

(110,5,50);


select c.customer_id, c.customer_name,
        count(o.order_id) as order_count
from Customers c
join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(o.order_id) > (
        select avg(customer_order_count)
        from (
            select customer_id,
                  count(order_id) customer_order_count
            from Orders
            group by customer_id
            ) t
        )
order by order_count desc, customer_id asc