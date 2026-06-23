------ Problem 7 -------
------ User Engagement Report -------

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


drop table if exists events
CREATE TABLE Events (
    event_id INT,
    user_id INT,
    event_type VARCHAR(20)
);

INSERT INTO Events VALUES
(101,1,'login'),
(102,1,'purchase'),
(103,1,'login'),
(104,1,'purchase'),
(105,1,'logout'),

(106,2,'login'),
(107,2,'logout'),

(108,3,'login'),
(109,3,'purchase'),
(110,3,'purchase'),

(111,4,'login'),
(112,4,'login'),
(113,4,'purchase'),
(114,4,'purchase'),
(115,4,'purchase'),

(116,5,'login');



select u.user_id, u.user_name,
        sum(case when e.event_type = 'login' then 1 else 0 end) as login_count,
        sum(case when e.event_type = 'purchase' then 1 else 0 end) as purchase_count,
        100.0 * sum(case when e.event_type = 'purchase' then 1 else 0 end)/ count(*) as purchase_rate
from users u
left join Events e
on u.user_id = e.user_id
group by u.user_id, u.user_name
having sum(case when e.event_type = 'purchase' then 1 else 0 end) >= 2 and
        100.0 * sum(case when e.event_type = 'purchase' then 1 else 0 end)/ count(*) >= 50 and
        sum(case when e.event_type = 'login' then 1 else 0 end)  >= 1
order by purchase_rate desc, purchase_count desc, user_id asc