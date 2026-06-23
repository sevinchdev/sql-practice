---------- Problem 5 ----------
------- Transaction Quality Report -------

drop table if exists users
CREATE TABLE Users (
    user_id INT,
    user_name VARCHAR(20)
);

INSERT INTO Users VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(4,'David');


drop table if exists transactions
CREATE TABLE Transactions (
    transaction_id INT,
    user_id INT,
    amount INT,
    status VARCHAR(20)
);

INSERT INTO Transactions VALUES
(101,1,100,'success'),
(102,1,300,'success'),
(103,1,150,'failed'),
(104,1,500,'success'),

(105,2,200,'success'),
(106,2,100,'failed'),

(107,3,400,'failed'),
(108,3,600,'failed'),

(109,4,300,'success'),
(110,4,400,'success'),
(111,4,500,'success'),
(112,4,200,'failed');


select u.user_id, u.user_name,
        sum(case when t.status = 'success' then 1 else 0 end) as successful_transactions,
        sum(case when t.status = 'failed' then 1 else 0 end) as failed_transactions,
        sum(case when t.status = 'success' then t.amount else 0 end) as successful_amount,
        100.0 * sum(case when t.status = 'success' then 1 else 0 end)/ count(*) as success_rate
from users u
left join Transactions t
on u.user_id = t.user_id
group by u.user_id, u.user_name
having 100.0 * sum(case when t.status = 'success' then 1 else 0 end)/ count(*) >= 60 and
        sum(case when t.status = 'success' then t.amount else 0 end) >= 500 and 
        count(*) >= 3 
order by success_rate desc, successful_amount  desc, u.user_id
        

