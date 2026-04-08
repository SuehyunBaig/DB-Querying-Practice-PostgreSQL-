-- Write your PostgreSQL query statement below
select query_name, 
round(avg(rating::numeric/position), 2) as quality,
round((count(*) filter (where rating < 3)::numeric/count(*))*100, 2) as poor_query_percentage
from queries
group by query_name
