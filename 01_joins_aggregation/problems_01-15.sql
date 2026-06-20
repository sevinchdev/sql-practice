create database Roadmap

----- Question 1--------
drop table if exists customers
create table customers(
customer_id int,
customer_name varchar(50)
)

drop table if exists orders
create table orders(
order_id int, 
customer_id int
)


INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Orders VALUES
(101, 1),
(102, 1),
(103, 2),
(104, 1),
(105, 3);


select c.customer_id,
			 c.customer_name,
			 count(o.order_id) as number_of_orders
from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_id,
				c.customer_name
order by c.customer_id

-----Question 2---------
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT
);

INSERT INTO Employees VALUES
(1,'John',1),
(2,'Mary',2),
(3,'Peter',NULL),
(4,'Anna',1),
(5,'Mike',NULL);

CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance');


select e.employee_id,
        e.employee_name
from employees e
left join Departments d
on e.department_id = d.department_id 
where d.department_id is null
order by e.employee_id


---- Question 3-------
CREATE TABLE Users (
    user_id INT,
    username VARCHAR(20)
);

INSERT INTO Users VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(4,'David');

CREATE TABLE Comments (
    comment_id INT,
    user_id INT
);

INSERT INTO Comments VALUES
(101,1),
(102,1),
(103,2),
(104,1),
(105,3),
(106,3),
(107,3);


select u.user_id, 
      u.username,   
      count(c.comment_id) as comment_number
from Users u
left join Comments c
on u.user_id = c.user_id
group by u.user_id, u.username
order by u.user_id


----- Question 4 ------
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
    amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(101,1,100.00),
(102,1,200.00),
(103,2,300.00),
(104,1,150.00),
(105,3,400.00);

select c.customer_id,
        c.customer_name,
        avg(amount) as average_amount
from Customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by c.customer_id

------- Question 5 ---------------------
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
    customer_id INT
);

INSERT INTO Orders VALUES
(101,1),
(102,1),
(103,2),
(104,1),
(105,3);


select c.customer_id, c.customer_name
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.customer_id is null


----- Question 6 ----------------
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
    customer_id INT
);

INSERT INTO Orders VALUES
(101,1),
(102,1),
(103,2),
(104,1),
(105,3),
(106,1),
(107,3),
(108,3),
(109,5),
(110,3);


select c.customer_id, 
        c.customer_name,
        count(o.order_id) as number_of_orders
from Customers c
join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(o.order_id) > 2


------- Question 7 - Department Salary Totals ----------------
drop table if exists Employees
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT,
    salary INT
);

INSERT INTO Employees VALUES
(1,'John',1,5000),
(2,'Mary',2,7000),
(3,'Peter',1,6000),
(4,'Anna',3,8000),
(5,'Mike',2,9000),
(6,'Sara',1,5500);

drop table if exists departments
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance');

select d.department_name,
        sum(e.salary) as total_salary
from Employees e
join Departments d
on e.department_id = d.department_id
group by d.department_id, d.department_name


-------- Question 8 - Average Salary Per Department -------
drop table if exists Employees
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT,
    salary INT
);

INSERT INTO Employees VALUES
(1,'John',1,5000),
(2,'Mary',2,7000),
(3,'Peter',1,6000),
(4,'Anna',3,8000),
(5,'Mike',2,9000),
(6,'Sara',1,5500);


drop table if exists departments
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance');

select d.department_name,
        avg(e.salary) as average_salary
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_id, d.department_name


------ Question 9 - Products with No Sales -------
CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(20)
);

INSERT INTO Products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard'),
(4,'Monitor'),
(5,'Headphones');

CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO Sales VALUES
(101,1,2),
(102,1,1),
(103,2,3),
(104,4,2);


select p.product_id, p.product_name
from products p
left join sales s
on p.product_id = s.product_id
where s.product_id is null


-------- Quuestion 10 - Top Revenue Customer ----------
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
    amount INT
);

INSERT INTO Orders VALUES
(101,1,100),
(102,1,200),
(103,2,500),
(104,1,150),
(105,3,400),
(106,3,300);


select top 1 c.customer_name, 
       sum(amount) as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_revenue desc


--------- Problem 11 - Customers who have placed at least 2 orders ------
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

drop table orders
CREATE TABLE Orders (
    order_id INT,
    customer_id INT,
    amount INT
);

INSERT INTO Orders VALUES
(101,1,100),
(102,1,200),
(103,2,300),
(104,1,150),
(105,3,400),
(106,3,100),
(107,5,500);


select c.customer_id, c.customer_name,
        count(o.order_id) as number_of_orders,
        sum(amount) as total_spent
from Customers c
join Orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(o.order_id) >= 2
order by total_spent desc, c.customer_id asc


------ Problem 12 - Department with Average Salary over 5500-----
drop table if exists employees
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT,
    salary INT
);

INSERT INTO Employees VALUES
(1,'John',1,5000),
(2,'Mary',1,7000),
(3,'Peter',2,6000),
(4,'Anna',2,9000),
(5,'Mike',3,8000),
(6,'Sara',3,4000),
(7,'Tom',1,3000);

drop table if exists departments
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance');

select d.department_name,
        count(e.employee_id) as employee_count,
        avg(e.salary) as average_salary,
        sum(e.salary) as total_salary
from Employees e
join departments d
on e.department_id = d.department_id
group by d.department_id, d.department_name
having avg(e.salary) > 5500
order by average_salary desc

----- Problem 13 ----------------
drop table if exists users
CREATE TABLE Users (
    user_id INT,
    user_name VARCHAR(20)
);

INSERT INTO Users VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(4,'David'),
(5,'Emma');


CREATE TABLE Transactions (
    transaction_id INT,
    user_id INT,
    amount INT,
    status VARCHAR(20)
);

INSERT INTO Transactions VALUES
(101,1,100,'success'),
(102,1,200,'failed'),
(103,1,300,'success'),
(104,2,400,'success'),
(105,2,100,'success'),
(106,3,500,'failed'),
(107,4,200,'success'),
(108,4,300,'success'),
(109,4,100,'success');

select u.user_id, u.user_name,
        count(*) as successful_transactions,
        sum(t.amount) as total_success_amount
from users u
left join Transactions t
on u.user_id = t.user_id
where t.status = 'success'
group by u.user_id, u.user_name
having count(status)>=2 and sum(amount) >= 500
order by total_success_amount desc, user_id asc


--------- Problem 14 -------------------------
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

select c.customer_id, c.customer_name,
        count(*) as completed_orders,
        sum(o.amount) as total_spent,
        avg(o.amount) as average_order_value
from customers c
join orders o
on c.customer_id = o.customer_id
where o.status = 'completed'
group by c.customer_id, c.customer_name
having count(*) >= 2 and sum(o.amount) >= 500
order by average_order_value desc, customer_id asc


----------- Problem 15 ----------------------------
drop table if exists users
CREATE TABLE Users (
    user_id INT,
    user_name VARCHAR(20)
);

INSERT INTO Users VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(4,'David'),
(5,'Emma');


drop table if exists logins
CREATE TABLE Logins (
    login_id INT,
    user_id INT,
    device_type VARCHAR(20)
);

INSERT INTO Logins VALUES
(101,1,'mobile'),
(102,1,'desktop'),
(103,1,'mobile'),
(104,2,'desktop'),
(105,2,'desktop'),
(106,3,'mobile'),
(107,4,'tablet'),
(108,4,'mobile'),
(109,4,'mobile'),
(110,4,'desktop');

select u.user_id, u.user_name,
        count(l.login_id) as total_logins,
        count(distinct l.device_type) as number_of_devices
from users u
join logins l
on u.user_id = l.user_id
group by u.user_id, u.user_name
having count(l.login_id) >= 3 and count(distinct l.device_type) >= 2
order by total_logins desc, u.user_id asc

