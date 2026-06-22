--------- Problem 29 ------------
------ Customers with More Categories Than Average Active Customers ----

--Find customers whose number of distinct categories is greater than the average 
--number of distinct categories among customers having at least 3 orders.

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
(5,'Emma');


drop table if exists orders
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    category VARCHAR(20),
    amount INT
);

INSERT INTO Orders VALUES
(101,1,'Books',200),
(102,1,'Electronics',300),
(103,1,'Clothing',400),

(104,2,'Books',100),
(105,2,'Books',200),

(106,3,'Books',150),
(107,3,'Furniture',250),
(108,3,'Electronics',300),

(109,4,'Books',400),
(110,4,'Furniture',500),
(111,4,'Clothing',600),
(112,4,'Electronics',700),

(113,5,'Books',100);


select c.customer_id, c.customer_name,
        count(distinct o.category) as number_of_categories
from Customers c
join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(distinct o.category) > (
                select avg(category_count)
                from(
                    select customer_id,
                          count(distinct category) as category_count
                    from Orders
                    group by customer_id
                    having count(order_id) >= 3
                    ) t
                )
order by number_of_categories desc, customer_id asc