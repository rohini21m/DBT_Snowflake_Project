-- creating model stg_department.sql
with source as(
select 
department_id,
country_code, 
local_department_name, 
effective_from 
from {{ source("raw","departments") }}
) 

select * from source
