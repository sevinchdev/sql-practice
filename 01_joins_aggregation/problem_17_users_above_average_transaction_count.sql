------------ Problem 17 ----------------
--Users Above Average Transaction Count
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
(5,'Emma'),
(6,'Frank');


drop table if exists transactions
CREATE TABLE Transactions (
    transaction_id INT,
    user_id INT,
    amount INT
);

INSERT INTO Transactions VALUES
(101,1,100),
(102,1,200),
(103,1,300),

(104,2,400),

(105,3,100),
(106,3,200),

(107,4,100),
(108,4,100),
(109,4,100),
(110,4,100),

(111,5,300),
(112,5,200),
(113,5,100),

(114,6,500);

select u.user_id, u.user_name,
      count(t.transaction_id) as transaction_count
from users u
join transactions t
on u.user_id = t.user_id
group by u.user_id, u.user_name
having count(t.transaction_id) > (
        select avg(transaction_id)
        from Transactions)
order by transaction_count desc, u.user_id asc