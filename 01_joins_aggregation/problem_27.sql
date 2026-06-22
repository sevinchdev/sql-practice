------- Problem 26 ----------
----Departments Whose Average Salary Exceeds the Average Salary of Large Departments---

--Find departments whose average salary is greater than the average department 
--salary among departments having at least 3 employees.

drop table if exists Departments
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance'),
(4,'IT'),
(5,'HR');


drop table if exists Employees
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT,
    salary INT
);

INSERT INTO Employees VALUES
(1,'John',1,8000),
(2,'Mary',1,7000),

(3,'Peter',2,10000),
(4,'Anna',2,9000),
(5,'Mike',2,8000),

(6,'Sara',3,6000),

(7,'David',4,12000),
(8,'Emma',4,11000),
(9,'James',4,10000),
(10,'Alice',4,9000),

(11,'Kate',5,7000),
(12,'Tom',5,8000),
(13,'Lily',5,9000);


select d.department_id, d.department_name,
        count(e.employee_id) as employee_count,
        avg(e.salary) as average_salary
from Departments d
join Employees e
on d.department_id = e.department_id
group by d.department_id, d.department_name
having avg(e.salary) > 
               (
               select avg(department_average_salary)
               from (
                  select department_id,
                        avg(salary) as department_average_salary
                  from Employees
                  group by department_id
                  having count(employee_id) >= 3
                  ) t
               )
order by average_salary desc, department_id asc