select machine_id, round(avg(time_difference)::numeric, 3) as processing_time
from (select machine_id,
        process_id,
        max(timestamp) - min(timestamp) as time_difference
from activity
group by machine_id, process_id)
group by machine_id
