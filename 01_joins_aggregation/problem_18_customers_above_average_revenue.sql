----- Problem 18 ------------
-----Customers above Average Revenue------
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
    amount INT
);

INSERT INTO Orders VALUES
(101,1,100),
(102,1,200),

(103,2,500),

(104,3,150),
(105,3,150),
(106,3,100),

(107,4,300),
(108,4,400),

(109,5,100);

select c.customer_id, c.customer_name,
      sum(o.amount) as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(o.amount) > 
  (
      select avg(customer_revenue) 
      from (
        select customer_id,
              sum(amount) as customer_revenue
        from orders
        group by customer_id   ) t
  ) 
order by total_revenue desc, c.customer_id asc