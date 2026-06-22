------- Problem 1 ----------
-----Successful Transactions Per User---

--For each user, return:

--user_id
--user_name
--successful_transactions

--Sort by:

--successful_transactions DESC,
--user_id ASC

drop table if exists users
CREATE TABLE Users (
    user_id INT,
    user_name VARCHAR(20)
);

INSERT INTO Users VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie');

drop table if exists transactions
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

(104,2,150,'success'),
(105,2,250,'success'),

(106,3,400,'failed');


select u.user_id, u.user_name,
      sum(
        case when t.status = 'success' then 1 else 0 end
        ) as successfull_transactions
from users u
left join Transactions t
on u.user_id = t.user_id
group by u.user_id, u.user_name
order by successfull_transactions desc, user_id