------- Problem 26 ----------
-----Customers Spending Above the Average of Active Customers ------

--Find customers whose total spending is greater than the average 
--total spending among customers having at least 3 orders.

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
    amount INT
);

INSERT INTO Orders VALUES
(101,1,300),
(102,1,400),
(103,1,500),

(104,2,100),
(105,2,150),

(106,3,200),
(107,3,250),
(108,3,300),

(109,4,500),
(110,4,600),
(111,4,700),
(112,4,800),

(113,5,100),

(114,6,900),
(115,6,1000),
(116,6,1100);


select c.customer_id, c.customer_name,
      count(o.order_id) as order_count,
      sum(o.amount) as total_spent
from Customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.amount) > (
        select avg(amount_per_customer)
        from (
            select customer_id,
                  sum(amount) as amount_per_customer
            from orders
            group by customer_id
            having count(order_id) >= 3
            ) t
        )
order by total_spent desc, c.customer_id asc