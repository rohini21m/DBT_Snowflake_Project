-- create staging model st.leave_events.sql 

with source as (
 select 
   leave_id, 
   employee_id, 
   country_code,
   source_leave_code,
   leave_date, 
   days_taken,
   source_updated_at 
   from {{ source('raw', 'leave_events') }}
)
select * from source 

