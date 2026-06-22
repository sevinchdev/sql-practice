------- Problem 4 --------
------ Customer Performance Dashboard -------

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
    amount INT,
    status VARCHAR(20)
);

INSERT INTO Orders VALUES
(101,1,500,'completed'),
(102,1,300,'completed'),
(103,1,200,'cancelled'),

(104,2,100,'completed'),
(105,2,150,'cancelled'),
(106,2,250,'completed'),

(107,3,400,'cancelled'),
(108,3,500,'cancelled'),

(109,4,600,'completed'),
(110,4,700,'completed'),
(111,4,800,'completed'),

(112,5,300,'completed');


select c.customer_id, c.customer_name,
        sum(case when o.status = 'completed' then 1 else 0 end) as completed_orders,
        sum(case when o.status = 'cancelled' then 1 else 0 end) as cancelled_orders,
        sum(case when o.status = 'completed' then o.amount else 0 end) as completed_revenue,
        sum(case when o.status = 'cancelled' then o.amount else 0 end) as cancelled_revenue
from Customers c
left join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(case when o.status = 'completed' then 1 else 0 end) >= 2 and
        sum(case when o.status = 'completed' then o.amount else 0 end) >= 500 and
          sum(case when o.status = 'cancelled' then 1 else 0 end) <= 1
order by completed_revenue desc, c.customer_id

        
        