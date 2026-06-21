------- Problem 21 ------------
----Departments With More Employees Than the Average Department----

--Find departments whose number of employees is 
--greater than the average number of employees per department.


drop table if exists Departments
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance'),
(4,'HR'),
(5,'IT');


drop table if exists Employees
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT
);

INSERT INTO Employees VALUES
(1,'John',1),
(2,'Mary',1),

(3,'Peter',2),
(4,'Anna',2),
(5,'Mike',2),

(6,'Sara',3),

(7,'Kate',4),
(8,'James',4),

(9,'David',5),
(10,'Emma',5),
(11,'Tom',5),
(12,'Alice',5);


select d.department_id, d.department_name,
        count(e.employee_id) as employee_count
from Departments d
join Employees e
on d.department_id = e.department_id
group by d.department_id, d.department_name
having count(e.employee_id) > (
              select avg(employee_per_department)
              from (
                  select department_id,
                        count(*) as employee_per_department
                  from Employees
                  group by department_id) t
              )
order by employee_count desc, department_id asc