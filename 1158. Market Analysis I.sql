select u.user_id as buyer_id, u.join_date, count(*) filter (where o.order_date between '2019-01-01' and '2019-12-31') as orders_in_2019
from users as u left join orders as o on u.user_id = o.buyer_id
group by u.user_id, u.join_date

-- We do not want to remove non-2019 rows - otherwise how are we going to display 0 for users without any 2019 buying?
-- Instead, we should group users by user_id, while preserving all data regardless of order date.
-- Then in SELECT statement, we use count (*) FILTER (WHERE  ) statement which is SQL-equivalent of COUNTIF in Excel.

-- Key distinction: displaying rows that meet certain condition vs. counting the number of rows that meet certain condition
