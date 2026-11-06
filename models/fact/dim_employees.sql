-- lets create employee marts, convert german departments into plain english usa departemnt names  & make employee as dim table 
with employees as (
select 
        employee_id, 
        first_name,
        last_name,
        country_code,
        country_name,
        region,
        department_id,
        standard_department_name,
        employment_status,
        hire_date
 from {{ref('intermediate_employees_standardized')}}
)
select
    employee_id,
    concat(first_name,' ',last_name) as employee_full_name, -- or first_name || ' ' || last_name as employee_name,
    country_code,
    country_name,
    region,
    department_id,
    standard_department_name as department_name,
    employment_status,
