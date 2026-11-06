-- lets create a intermediate employee.sql model with standardized names 
-- use ref ()  when transfoming intermediate model or silver layer. 
-- uses source() in staging or bronze layer 
with leave_events as
(
select * from {{ref('stg_leave_events')}}
), 
leave_mapping as(
select * from {{ref('leave_events_mapping')}}
),
leave_combined as(
select 
le.leave_id, 
le.employee_id,
le.country_code,
le.leave_date, 
le.source_leave_code,
le.days_taken, 
lm.standard_leave_type, 
lm.is_paid,
le.source_updated_at
from leave_events le 
left join leave_mapping lm 
on le.country_code=lm.country_code
and le.source_leave_code = lm.source_leave_code
)
select
    leave_id,
    employee_id,
    country_code,
    source_leave_code,
    standard_leave_type,
    is_paid,
    leave_date,
    days_taken,
    source_updated_at
from leave_combined

