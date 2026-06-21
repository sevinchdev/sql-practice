------ Problem 22 -----------
----- Customers Using Multiple Product Categories ------

----Find customers who:

--✅ Purchased from at least 3 different categories
--✅ Have total spending ≥ 1000


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
(101,1,'Electronics',500),
(102,1,'Books',100),
(103,1,'Clothing',200),

(104,2,'Electronics',700),
(105,2,'Electronics',300),

(106,3,'Books',150),
(107,3,'Clothing',250),

(108,4,'Electronics',400),
(109,4,'Books',200),
(110,4,'Clothing',300),
(111,4,'Furniture',600),

(112,5,'Books',100);


select c.customer_id, c.customer_name,
        count(distinct o.category) as number_of_categories,
        sum(o.amount) as total_spent
from Customers c
join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(distinct o.category) >= 3 and sum(o.amount) >= 1000
order by number_of_categories desc, total_spent desc, customer_id asc
