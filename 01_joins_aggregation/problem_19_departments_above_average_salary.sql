-------- Problem 19 --------------
----Departments Above Average Department Salary------
drop table if exists Departments
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance'),
(4,'HR');


drop table if exists Employees
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT,
    salary INT
);

INSERT INTO Employees VALUES
(1,'John',1,5000),
(2,'Mary',1,4000),

(3,'Peter',2,7000),
(4,'Anna',2,3000),
(5,'Mike',2,2000),

(6,'Sara',3,6000),
(7,'Tom',3,5000),

(8,'Kate',4,2000),
(9,'James',4,1000);

select d.department_id, d.department_name,
        sum(e.salary) as total_salary
from Departments d
join Employees e
on d.department_id = e.department_id
group by d.department_id, d.department_name
having sum(e.salary) >
      (select avg(department_salary)
      from (
          select department_id,
                  sum(salary) as department_salary
          from Employees
          group by department_id) t
      )
order by total_salary desc, department_id asc