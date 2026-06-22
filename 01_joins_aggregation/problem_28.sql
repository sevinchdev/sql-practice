------- Problem 28 ---------
------Products Sold Above Average Among Popular Products-----

--Find products whose total quantity sold is greater than the 
--average total quantity sold among products having at least 3 sales.


drop table if exists Products
CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(20)
);

INSERT INTO Products VALUES
(1,'Laptop'),
(2,'Phone'),
(3,'Tablet'),
(4,'Watch'),
(5,'Headphones');


drop table if exists sales
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO Sales VALUES
(101,1,3),
(102,1,2),
(103,1,5),

(104,2,4),
(105,2,6),

(106,3,2),
(107,3,1),
(108,3,3),
(109,3,4),

(110,4,1),

(111,5,7),
(112,5,8),
(113,5,6);

select p.product_id, p.product_name,
        count(s.sale_id) as sale_count,
        sum(quantity) as total_quantity
from Products p
join Sales s
on p.product_id = s.sale_id
group by p.product_id, p.product_name
having sum(quantity) >(
              select avg(total_quantity_per_product)
              from (
                    select product_id,
                        sum(quantity) as total_quantity_per_product
                    from sales
                    group by product_id
                    having count(sale_id) >= 3
                    ) t
              )
order by total_quantity desc, product_id asc