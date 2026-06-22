------- Problem 2 --------
--- Successful Revenue Per User ---
drop table if exists Users
CREATE TABLE Users (
    user_id INT,
    user_name VARCHAR(20)
);

INSERT INTO Users VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie');


drop table if exists Transactions
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
            case
              when t.status = 'success' then 1 else 0
            end
            ) as successfull_transactions,
        sum(case when t.status = 'success' then amount else 0 end) as successfull_amount
from Users u
left join Transactions t
on u.user_id = t.user_id
group by u.user_id, u.user_name
order by successfull_amount desc, user_id asc
