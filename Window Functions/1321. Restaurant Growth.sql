select visited_on, moving_sum as amount, round((moving_sum/7), 2) as average_amount
from (select visited_on, 
      sum(daily_amount) over (order by visited_on rows between 6 preceding and current row) as moving_sum,
      rank() over (order by visited_on) as rank
      from(select visited_on, sum(amount) as daily_amount
           from customer
           group by visited_on)) 
where rank >= 7
order by visited_on asc

-- First, aggregate daily sales
-- Leveraging daily sales column get 7-day moving total: sum(daily_amount) over (order by visited_on rows between 6 preceding and current row) as moving_sum
-- Moving average can easily calculated and rounded at the very last step, so leave it until then
-- In order to filter the data from 7th day onwards, we need to create rank column too!: rank() over (order by visited_on)
