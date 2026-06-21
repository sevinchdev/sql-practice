------ Problem 24 ---------
---- Departments with Diverse High Earners ----

--Find departments that satisfy all of the following:

--✅ At least 3 employees
--✅ At least 3 distinct job titles
--✅ Average salary > 7000

drop table if exists Departments
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(20)
);

INSERT INTO Departments VALUES
(1,'Sales'),
(2,'Marketing'),
(3,'Finance'),
(4,'IT');


drop table if exists Employees
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(20),
    department_id INT,
    job_title VARCHAR(20),
    salary INT
);

INSERT INTO Employees VALUES
(1,'John',1,'Manager',9000),
(2,'Mary',1,'Analyst',7000),
(3,'Tom',1,'Analyst',6000),

(4,'Peter',2,'Manager',10000),
(5,'Anna',2,'Designer',5000),
(6,'Mike',2,'Developer',6000),

(7,'Sara',3,'Manager',8000),
(8,'Kate',3,'Accountant',7000),

(9,'David',4,'Manager',12000),
(10,'Emma',4,'Developer',9000),
(11,'James',4,'Analyst',8000),
(12,'Alice',4,'Designer',7000);


select d.department_id, d.department_name,
        count(e.employee_id) as employee_count,
        count(distinct e.job_title) as number_of_job_titles,
        avg(e.salary) as average_salary
from Departments d
join Employees e
on d.department_id = e.department_id
group by d.department_id, d.department_name
having count(e.employee_id) >= 3 and count(distinct e.job_title) >= 3 and
    avg(e.salary) > 7000
order by average_salary desc, d.department_id asc
