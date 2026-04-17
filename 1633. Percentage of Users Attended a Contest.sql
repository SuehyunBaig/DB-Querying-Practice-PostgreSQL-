select contest_id, 
    100 * round(count(distinct user_id)::numeric / (select count(*) from users), 4) as percentage
from register
group by contest_id
order by percentage desc, contest_id asc
