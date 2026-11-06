-- custom tests : since our datasets doensot have any leave column with value = 0 its always >0 , 
--we are writing custom test for it.
select
    leave_id,
    days_taken
from {{ ref('fact_leaves') }}
where days_taken <= 0
