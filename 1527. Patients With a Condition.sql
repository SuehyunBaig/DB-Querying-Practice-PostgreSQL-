select *
from patients 
where conditions like 'DIAB1%'    -- Matches if it's the first condition
   or conditions like '% DIAB1%'; -- Matches if it's a subsequent condition (note the space)
